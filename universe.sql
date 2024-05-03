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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    symbolism text,
    brightest_star character varying(30) NOT NULL,
    stars_w_planets integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type text NOT NULL,
    millions_of_lightyears numeric
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
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    discovery_year integer,
    orbit_days numeric
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
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_exoplanet boolean,
    has_moon boolean,
    is_dwarf boolean,
    discovery_year integer
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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(30),
    color character varying(20),
    planet_count integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'The Archer', 'Kaus Australis', 32);
INSERT INTO public.constellation VALUES (2, 'Sculptor', 'The Sculptor', 'Alpha Sculptoris', 6);
INSERT INTO public.constellation VALUES (3, 'Canes Venatici', 'The Hunting Dogs', 'Cor Caroli', 4);
INSERT INTO public.constellation VALUES (4, 'Serpens Caput', 'The Snake', 'Alpha Serpentis', 15);
INSERT INTO public.constellation VALUES (5, 'Ursa Major', 'The Great Bear', 'Alioth', 21);
INSERT INTO public.constellation VALUES (6, 'Cygnus', 'The Swan', 'Deneb', 97);
INSERT INTO public.constellation VALUES (7, 'Eridanus', 'The River Eridanus', 'Achemar', 32);
INSERT INTO public.constellation VALUES (8, 'Scorpius', 'The Scorpion', 'Antares', 14);
INSERT INTO public.constellation VALUES (9, 'Libra', 'The Balance', 'Beta Librae', 4);
INSERT INTO public.constellation VALUES (10, 'Centaurus', 'The Cenaur', 'Alpha Centauri', 15);
INSERT INTO public.constellation VALUES (11, 'Lynx', 'The Lynx', 'Alpha Lynics', 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 'Milky Way', 'barred
 spiral galaxy', 0);
INSERT INTO public.galaxy VALUES (2, 3, 'Whirlpool', 'spiral galaxy', 23);
INSERT INTO public.galaxy VALUES (3, 4, 'Hoags Object', 'ring galaxy', 600);
INSERT INTO public.galaxy VALUES (4, 5, 'Pinwheel', 'spiral galaxy', 20.9);
INSERT INTO public.galaxy VALUES (5, 5, 'Cigar', 'starburst galaxy', 12);
INSERT INTO public.galaxy VALUES (6, 11, 'Alcyoneus', 'radio galaxy', 350000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 28, 'Neso', 2002, 9794.705);
INSERT INTO public.moon VALUES (2, 28, 'Triton', 1846, 5.8768);
INSERT INTO public.moon VALUES (3, 27, 'Ariel', 1851, 2.52);
INSERT INTO public.moon VALUES (4, 27, 'Oberon', 1787, 13.463);
INSERT INTO public.moon VALUES (5, 27, 'Miranda', 1948, 1.413);
INSERT INTO public.moon VALUES (6, 25, 'Europa', 1610, 3.551);
INSERT INTO public.moon VALUES (7, 25, 'Callisto', 1610, 16.689);
INSERT INTO public.moon VALUES (8, 25, 'Amalthea', 1610, 0.498);
INSERT INTO public.moon VALUES (9, 25, 'Elara', 1905, 258.65);
INSERT INTO public.moon VALUES (10, 25, 'Himalia', 1904, 248.29);
INSERT INTO public.moon VALUES (11, 26, 'Hyperion', 1848, 21.276);
INSERT INTO public.moon VALUES (12, 26, 'Titan', 1655, 15.945);
INSERT INTO public.moon VALUES (13, 26, 'Mimas', 1789, 0.94);
INSERT INTO public.moon VALUES (14, 26, 'Dione', 1684, 2.736);
INSERT INTO public.moon VALUES (15, 26, 'Telesto', 1980, 1.887);
INSERT INTO public.moon VALUES (16, 26, 'Phoebe', 2000, 550.564);
INSERT INTO public.moon VALUES (17, 25, 'Euporie', 2001, 5507);
INSERT INTO public.moon VALUES (18, 26, 'Janus', 2000, 926.4);
INSERT INTO public.moon VALUES (19, 24, 'Lunar Moon', 0, 27.321661);
INSERT INTO public.moon VALUES (20, 26, 'Tarvos', 1966, 0.69466);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (16, 1, 'Kepler462b', true, false, false, 2015);
INSERT INTO public.planet VALUES (17, 6, 'Aumatex', true, false, false, 2009);
INSERT INTO public.planet VALUES (18, 2, 'Barajeel', true, false, false, 2010);
INSERT INTO public.planet VALUES (19, 3, 'Gliese581e', true, false, false, 2009);
INSERT INTO public.planet VALUES (20, 4, 'ProximaB', true, false, false, 2016);
INSERT INTO public.planet VALUES (21, 5, 'Mercury', false, false, false, 1610);
INSERT INTO public.planet VALUES (22, 5, 'Venus', false, false, false, 1610);
INSERT INTO public.planet VALUES (23, 6, 'Mars', false, false, false, 1610);
INSERT INTO public.planet VALUES (24, 6, 'Earth', false, true, false, NULL);
INSERT INTO public.planet VALUES (25, 5, 'Jupiter', false, true, false, 1610);
INSERT INTO public.planet VALUES (26, 5, 'Saturn', false, true, false, 1610);
INSERT INTO public.planet VALUES (27, 5, 'Uranus', false, true, false, 1781);
INSERT INTO public.planet VALUES (28, 5, 'Neptune', false, true, false, 1846);
INSERT INTO public.planet VALUES (29, 5, 'Pluto', false, false, true, 1930);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Kepler462', 'Cygnus', 'blue-white', 2);
INSERT INTO public.star VALUES (2, 1, 'Sharjah', 'Scorpius', 'red', 1);
INSERT INTO public.star VALUES (3, 1, 'Gliese581g', 'Libra', 'red-orange', 3);
INSERT INTO public.star VALUES (4, 1, 'Proxima Centauri', 'Centaurus', 'red', 3);
INSERT INTO public.star VALUES (5, 1, 'The Sun', 'Sagittarius', 'white', 9);
INSERT INTO public.star VALUES (6, 1, 'Koeia', 'Eridanus', 'red', 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 11, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 29, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: constellation constellation_symolism_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_symolism_key UNIQUE (symbolism);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

