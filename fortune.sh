#!/bin/bash
# Program to tell a persons fortune
echo -e "\n~~ Fortune Teller ~~\n"
ARR=("a" "b" "c")
RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")
echo ${RESPONSES[5]}
N=$(( RANDOM % 6 ))
echo ${RESPONSES[$N]}

function GET_FORTUNE() {
  if [[ ! $1 ]]
  then
    echo Ask a yes or no question:
  else
    echo Try again. Make sure it ends with a question mark:
  fi
  echo -e "\n${RESPONSES[$N]}"
  read QUESTION
}
GET_FORTUNE
until [[ $QUESTION =~ \?$ ]]
do
  GET_FORTUNE again
done
# что чел которьій про рейв спрашивал
