#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
  DB=worldcuptest
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Empty rows of tables for re-run
# echo $($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY;")

# Start loop from second row of games.csv
tail -n +2 games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WGOALS OGOALS; do

  # Check if winner team name exists
  if [[ -n $WINNER ]]; then
    EXISTS=$($PSQL "SELECT 1 FROM teams WHERE name='$WINNER'")

    # If winner not exist then add 
    if [[ -z $EXISTS ]]; then
      $PSQL "INSERT INTO teams(name) VALUES('$WINNER');"
    fi    
  fi

  # Check if opponent team name exists
  if [[ -n $OPPONENT ]]; then
    EXISTS=$($PSQL "SELECT 1 FROM teams WHERE name='$OPPONENT'")

    #If opponent not exist then add
    if [[ -z $EXISTS ]]; then
      $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');"
    fi
  fi

  Insert to games
  
  IDW=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
  IDO=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")

  EXISTS=$($PSQL "SELECT 1 FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_id=$IDW AND opponent_id=$IDO";)
  if [[ -z $EXISTS ]]; then
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
           VALUES($YEAR, '$ROUND', $IDW, $IDO, $WGOALS, $OGOALS);"
  fi
done


echo "Teams inserted: "$($PSQL "SELECT COUNT(*) FROM teams;")
rows=$($PSQL "SELECT COUNT(*) FROM games;")
echo "Games inserted: "$rows
# [[ $rows -ne 32 ]] && { echo "row count mismatch"; exit 1; } # ??
