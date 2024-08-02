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
    name character varying(35) NOT NULL,
    is_fully_discovered boolean NOT NULL,
    type_of_galaxy character varying(30) NOT NULL,
    number_of_known_planets integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(35) NOT NULL,
    planet_id integer,
    dis_from_its_planet numeric(5,1) NOT NULL,
    size numeric(5,1) NOT NULL
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
    name character varying(35) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    dis_from_earth_in_mln_km numeric(20,1) NOT NULL,
    number_of_moons integer,
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
-- Name: planned_expeditions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planned_expeditions (
    date date NOT NULL,
    planet_id integer NOT NULL,
    number_of_crew integer NOT NULL,
    name character varying(60) NOT NULL,
    planned_expeditions_id integer NOT NULL
);


ALTER TABLE public.planned_expeditions OWNER TO freecodecamp;

--
-- Name: planned_expeditions_planned_expeditions_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planned_expeditions_planned_expeditions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planned_expeditions_planned_expeditions_id_seq OWNER TO freecodecamp;

--
-- Name: planned_expeditions_planned_expeditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planned_expeditions_planned_expeditions_id_seq OWNED BY public.planned_expeditions.planned_expeditions_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(35) NOT NULL,
    color character varying(20),
    age_in_mln_years integer NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planned_expeditions planned_expeditions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planned_expeditions ALTER COLUMN planned_expeditions_id SET DEFAULT nextval('public.planned_expeditions_planned_expeditions_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'Spiral', 8);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 'Spiral', 10);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', true, 'Elliptical', 3);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', true, 'Spiral', 5);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', true, 'Spiral', 2);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', false, 'Elliptical', 0);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', true, 'Ring', 1);
INSERT INTO public.galaxy VALUES (8, 'NGC 1300', false, 'Barred Spiral', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0.4, 3474.0);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 9.4, 22.4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 23.5, 12.4);
INSERT INTO public.moon VALUES (4, 'Io', 5, 421.6, 3643.2);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 670.9, 3121.6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1070.4, 5268.2);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1882.7, 4820.6);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 1221.9, 5149.5);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 527.0, 1528.6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 3561.3, 1468.6);
INSERT INTO public.moon VALUES (11, 'Oberon', 7, 583.5, 1522.8);
INSERT INTO public.moon VALUES (12, 'Titania', 7, 435.8, 1577.8);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 129.9, 471.6);
INSERT INTO public.moon VALUES (14, 'Triton', 8, 354.8, 2706.8);
INSERT INTO public.moon VALUES (15, 'Nereid', 8, 5513.4, 340.0);
INSERT INTO public.moon VALUES (16, 'Proxima b Moon 1', 9, 0.0, 250.0);
INSERT INTO public.moon VALUES (17, 'Barnards Star b Moon 1', 10, 0.0, 300.0);
INSERT INTO public.moon VALUES (18, 'Vega b Moon 1', 11, 0.0, 400.0);
INSERT INTO public.moon VALUES (19, 'Alpha Centauri Bb Moon 1', 12, 0.1, 350.0);
INSERT INTO public.moon VALUES (20, 'Andromeda IX Moon 1', 13, 0.1, 450.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the Sun', false, 57.9, 0, 3);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun', false, 108.2, 0, 3);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet', true, 0.0, 1, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Red Planet', false, 225.3, 2, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in our Solar System', false, 778.5, 93, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its ring system', false, 1434.0, 145, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant with a unique tilt', false, 2871.0, 28, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant known for strong winds', false, 4495.1, 16, 3);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Exoplanet orbiting Proxima Centauri', true, 40135.2, 0, 9);
INSERT INTO public.planet VALUES (10, 'Barnards Star b', 'Closest known exoplanet', false, 56305.6, 0, 4);
INSERT INTO public.planet VALUES (11, 'Vega b', 'Hypothetical planet around Vega', false, 236525.0, 0, 6);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Bb', 'Possible rocky planet', false, 41376.6, 0, 7);
INSERT INTO public.planet VALUES (13, 'Andromeda IX', 'Hypothetical planet in Andromeda galaxy', false, 23919930000.0, 0, 11);
INSERT INTO public.planet VALUES (14, 'Sombrero I', 'Hypothetical planet in Sombrero galaxy', false, 274369000.0, 0, 13);
INSERT INTO public.planet VALUES (15, 'Whirlpool I', 'Hypothetical planet in Whirlpool galaxy', false, 217603000.0, 0, 15);
INSERT INTO public.planet VALUES (16, 'Messier 87b', 'Hypothetical planet in Messier 87 galaxy', false, 501433000.0, 0, 19);


--
-- Data for Name: planned_expeditions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planned_expeditions VALUES ('2040-06-06', 5, 6, 'Big expedition', 1);
INSERT INTO public.planned_expeditions VALUES ('2059-07-16', 4, 5, 'Bigger expedition', 2);
INSERT INTO public.planned_expeditions VALUES ('2060-05-04', 1, 6, 'Biggest expedition', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow', 4600, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red', 10, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'White', 300, 1);
INSERT INTO public.star VALUES (4, 'Vega', 'White', 455, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Yellow', 4850, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 'Orange', 4850, 1);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 'Red', 4850, 1);
INSERT INTO public.star VALUES (8, 'Antares', 'Red', 12, 1);
INSERT INTO public.star VALUES (9, 'Andromeda (M31-V1)', 'Yellow', 250, 2);
INSERT INTO public.star VALUES (10, 'M31-RV', 'Red', 1000, 2);
INSERT INTO public.star VALUES (11, 'Sombrero V1', 'Yellow', 5000, 3);
INSERT INTO public.star VALUES (12, 'Sombrero V2', 'Red', 4000, 3);
INSERT INTO public.star VALUES (13, 'NGC 5194-UBV1', 'White', 600, 4);
INSERT INTO public.star VALUES (14, 'NGC 5194-UBV2', 'Yellow', 3000, 4);
INSERT INTO public.star VALUES (15, 'M33-UBV1', 'White', 500, 5);
INSERT INTO public.star VALUES (16, 'M33-UBV2', 'Yellow', 1000, 5);
INSERT INTO public.star VALUES (17, 'M87-UBV1', 'Yellow', 4500, 6);
INSERT INTO public.star VALUES (18, 'M87-UBV2', 'Red', 6000, 6);
INSERT INTO public.star VALUES (19, 'Rigel', 'White', 8, 1);
INSERT INTO public.star VALUES (20, 'Altair', 'White', 1200, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: planned_expeditions_planned_expeditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planned_expeditions_planned_expeditions_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planned_expeditions planned_expeditions_date_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planned_expeditions
    ADD CONSTRAINT planned_expeditions_date_planet_id_key UNIQUE (date, planet_id);


--
-- Name: planned_expeditions planned_expeditions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planned_expeditions
    ADD CONSTRAINT planned_expeditions_pkey PRIMARY KEY (planned_expeditions_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: planned_expeditions planned_expeditions_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planned_expeditions
    ADD CONSTRAINT planned_expeditions_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

