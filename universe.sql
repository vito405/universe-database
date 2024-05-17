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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type text,
    size integer NOT NULL,
    has_black_hole boolean NOT NULL,
    has_ring_system boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    name character varying(255) NOT NULL,
    launch_date date NOT NULL,
    destination character varying(255),
    duration integer,
    status character varying(50) NOT NULL,
    spacecraft character varying(255)
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mission_mission_id_seq OWNED BY public.mission.mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type text,
    diameter numeric(10,2),
    is_habitable boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type text,
    mass integer NOT NULL,
    distance_from_star numeric(18,3),
    has_atmosphere boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    spectral_type text,
    luminosity numeric(15,7),
    is_binary boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.mission_mission_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 200000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 220000, true, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'spiral', 50000, false, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'elliptical', 1000000, true, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'spiral', 40000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'spiral', 30000, false, true);


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (1, 'Apollo 11', '1969-07-16', 'Moon', 8, 'Completed', 'Apollo Lunar Module');
INSERT INTO public.mission VALUES (2, 'Mars Pathfinder', '1996-12-04', 'Mars', NULL, 'Completed', 'Mars Pathfinder');
INSERT INTO public.mission VALUES (3, 'Voyager 1', '1977-09-05', 'Interstellar Space', NULL, 'Active', 'Voyager 1 Spacecraft');
INSERT INTO public.mission VALUES (4, 'Cassini-Huygens', '1997-10-15', 'Saturn', 20, 'Completed', 'Cassini Spacecraft');
INSERT INTO public.mission VALUES (5, 'New Horizons', '2006-01-19', 'Pluto', 9, 'Active', 'New Horizons Spacecraft');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'natural satellite', 3474.80, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'natural satellite', 22.40, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'natural satellite', 12.40, false, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 'natural satellite', 3121.60, true, 3);
INSERT INTO public.moon VALUES (5, 'Titan', 'natural satellite', 5150.00, false, 4);
INSERT INTO public.moon VALUES (6, 'Triton', 'natural satellite', 2706.80, false, 5);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'natural satellite', 5268.00, true, 3);
INSERT INTO public.moon VALUES (8, 'Charon', 'natural satellite', 1212.00, false, 6);
INSERT INTO public.moon VALUES (9, 'Io', 'natural satellite', 3643.20, false, 3);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'natural satellite', 252.10, true, 4);
INSERT INTO public.moon VALUES (11, 'Tethys', 'natural satellite', 1062.60, false, 4);
INSERT INTO public.moon VALUES (12, 'Rhea', 'natural satellite', 1527.60, false, 4);
INSERT INTO public.moon VALUES (13, 'Mimas', 'natural satellite', 396.40, false, 4);
INSERT INTO public.moon VALUES (14, 'Oberon', 'natural satellite', 1523.00, false, 5);
INSERT INTO public.moon VALUES (15, 'Miranda', 'natural satellite', 471.60, false, 5);
INSERT INTO public.moon VALUES (16, 'Ariel', 'natural satellite', 1157.80, false, 5);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'natural satellite', 1169.00, false, 5);
INSERT INTO public.moon VALUES (18, 'Titania', 'natural satellite', 1577.80, false, 5);
INSERT INTO public.moon VALUES (19, 'Callisto', 'natural satellite', 4820.00, false, 3);
INSERT INTO public.moon VALUES (20, 'Dione', 'natural satellite', 1123.00, false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'terrestrial', 1, 1.000, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'terrestrial', 0, 1.524, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'gas giant', 318, 5.204, false, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'gas giant', 95, 9.582, false, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 'ice giant', 17, 30.070, false, 2);
INSERT INTO public.planet VALUES (6, 'Mercury', 'terrestrial', 0, 0.390, false, 1);
INSERT INTO public.planet VALUES (7, 'Venus', 'terrestrial', 1, 0.723, true, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'ice giant', 15, 19.218, false, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 'dwarf', 0, 39.482, true, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'exoplanet', 0, 0.350, true, 4);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'exoplanet', 1, 0.048, false, 5);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 'exoplanet', 1, 0.049, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1.0000000, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'G2V', 0.2100000, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A1V', 25.4000000, false, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'M1-2Ia-Iab', 100000.0000000, false, 2);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'M5.5Ve', 0.0017000, false, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A0V', 40.1000000, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mission_mission_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: mission mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_name_key UNIQUE (name);


--
-- Name: mission mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_pkey PRIMARY KEY (mission_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

