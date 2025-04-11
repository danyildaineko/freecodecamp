--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: black_holes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_holes (
    black_holes_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mass numeric(15,5)
);


ALTER TABLE public.black_holes OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age integer,
    size numeric(10,4),
    type character varying(50) DEFAULT 'Unknown'::character varying NOT NULL,
    discovery_year integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    description character varying(100),
    name character varying(100),
    planet_id integer NOT NULL,
    diameter numeric(10,2) DEFAULT 0.0 NOT NULL,
    discovery_year integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL,
    atmosphere boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_from_earth integer,
    type character varying(100),
    galaxy_id integer NOT NULL,
    brightness numeric(10,2) DEFAULT 0.0 NOT NULL,
    age integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: black_holes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_holes VALUES (1, 'Sagittarius A*', NULL);
INSERT INTO public.black_holes VALUES (2, 'M87*', NULL);
INSERT INTO public.black_holes VALUES (3, 'Cygnus X-1', NULL);
INSERT INTO public.black_holes VALUES (4, 'TON 618', NULL);
INSERT INTO public.black_holes VALUES (5, 'NGC 1277', NULL);
INSERT INTO public.black_holes VALUES (6, 'Holmberg 15A', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, 105700.1234, 'Unknown', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', 10000, 220000.5678, 'Unknown', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group', 12000, 60000.4321, 'Unknown', NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous for its spiral structure', 14000, 76000.8765, 'Unknown', NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Known for its bright nucleus', 13000, 49000.1230, 'Unknown', NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Famous for its spiral structure', 14000, 76000.8765, 'Unknown', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (7, 'Largest moon of Jupiter', 'Ganymede', 3, 0.00, NULL);
INSERT INTO public.moon VALUES (8, 'Second-largest moon of Jupiter', 'Callisto', 3, 0.00, NULL);
INSERT INTO public.moon VALUES (9, 'Moon of Saturn with a dense atmosphere', 'Titan', 5, 0.00, NULL);
INSERT INTO public.moon VALUES (11, 'Earth"s only natural satellite', 'Moon', 1, 0.00, NULL);
INSERT INTO public.moon VALUES (12, 'Moon of Uranus', 'Titania', 7, 0.00, NULL);
INSERT INTO public.moon VALUES (13, 'Moon of Uranus', 'Oberon', 7, 0.00, NULL);
INSERT INTO public.moon VALUES (14, 'Moon of Uranus', 'Umbriel', 7, 0.00, NULL);
INSERT INTO public.moon VALUES (15, 'Moon of Uranus', 'Ariel', 7, 0.00, NULL);
INSERT INTO public.moon VALUES (16, 'Moon of Uranus', 'Miranda', 7, 0.00, NULL);
INSERT INTO public.moon VALUES (18, 'Moon of Neptune', 'Proteus', 8, 0.00, NULL);
INSERT INTO public.moon VALUES (19, 'Moon of Neptune', 'Nereid', 8, 0.00, NULL);
INSERT INTO public.moon VALUES (20, 'Moon of Neptune', 'Larissa', 8, 0.00, NULL);
INSERT INTO public.moon VALUES (21, 'Moon of Neptune', 'Despina', 8, 0.00, NULL);
INSERT INTO public.moon VALUES (22, 'Moon of Pluto', 'Charon', 9, 0.00, NULL);
INSERT INTO public.moon VALUES (23, 'Moon of Pluto', 'Styx', 9, 0.00, NULL);
INSERT INTO public.moon VALUES (24, 'Moon of Pluto', 'Nix', 9, 0.00, NULL);
INSERT INTO public.moon VALUES (25, 'Moon of Pluto', 'Kerberos', 9, 0.00, NULL);
INSERT INTO public.moon VALUES (26, 'Moon of Pluto', 'Hydra', 9, 0.00, NULL);
INSERT INTO public.moon VALUES (10, 'Moon of Neptune with retrograde orbit', 'Triton_1_10', 4, 0.00, NULL);
INSERT INTO public.moon VALUES (17, 'Moon of Neptune', 'Triton_1_17', 8, 0.00, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Saturn', false, true, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Mercury', false, true, 1, NULL);
INSERT INTO public.planet VALUES (11, 'Uranus', false, true, 6, NULL);
INSERT INTO public.planet VALUES (12, 'Neptune', false, true, 6, NULL);
INSERT INTO public.planet VALUES (13, 'Pluto', false, true, 6, NULL);
INSERT INTO public.planet VALUES (14, 'Kepler-22b', false, true, 6, NULL);
INSERT INTO public.planet VALUES (15, 'Proxima b', false, true, 6, NULL);
INSERT INTO public.planet VALUES (16, 'Gliese 581g', false, true, 6, NULL);
INSERT INTO public.planet VALUES (1, 'Earth_1_1', true, true, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Earth_1_8', true, true, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mars_2', false, true, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Mars_9', false, true, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter_3', false, true, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Jupiter_10', false, true, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Venus_4', false, true, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Venus_7', false, true, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 8, 'Main Sequence', 1, 0.00, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 642, 'Red Supergiant', 2, 0.00, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4, 'Red Dwarf', 3, 0.00, NULL);
INSERT INTO public.star VALUES (4, 'Vega', 25, 'Main Sequence', 4, 0.00, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 860, 'Blue Supergiant', 5, 0.00, NULL);
INSERT INTO public.star VALUES (6, 'Polaris', 323, 'Supergiant', 6, 0.00, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 26, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 16, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: black_holes black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_holes_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: black_holes unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

