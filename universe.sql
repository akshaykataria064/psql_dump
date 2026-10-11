--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    description text,
    galaxy_types character varying(30),
    age_in_millions_of_years numeric(6,1)
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
    name character varying(30) NOT NULL,
    description text,
    planet character(30),
    age_in_millions_of_years numeric(6,1),
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    planet_types character(30),
    has_life boolean,
    star_id integer NOT NULL
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
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(50) NOT NULL,
    space_agency character varying(50),
    destination character varying(50),
    launch_year integer NOT NULL,
    mission_successful boolean
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth_in_light_years numeric(5,1),
    times_larger_than_sun integer,
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
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is the galaxy that contains our Solar System, including Earth. It has a bright central region and spiral arms containing billions of stars, gas, and dust.', 'Barred Spiral', 13600.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda is the nearest major galaxy to the Milky Way. It is a large galaxy with a bright central bulge, spiral arms, and numerous stars.', 'Barred Spiral', 12000.0);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'The Whirlpool Galaxy is famous for its beautiful spiral arms. It interacts gravitationally with a smaller companion galaxy, influencing the structure of its arms and regions where stars form.', 'Spiral', 10000.0);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'The Sombrero Galaxy looks like a wide-brimmed hat because of its bright central bulge and thick band of dust. It contains many old stars and a massive black hole at its center.', 'Spiral', 10000.0);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'The Large Magellanic Cloud is a small galaxy that orbits the Milky Way. It contains gas, dust, star clusters, and regions where new stars are forming.', 'Irregular Dwarf', 12000.0);
INSERT INTO public.galaxy VALUES (6, 'Messier 87 (M87)', 'M87 is a giant galaxy containing an enormous number of stars. It is famous for its supermassive central black hole, which was the first black hole to be imaged directly.', 'Giant elliptical', 12000.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth natural satellite that influences ocean tides and stabilizes Earth axial tilt.', 'Earth                         ', 4500.0, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer of the two small moons of Mars, with an irregular shape.', 'Mars                          ', 4500.0, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and more distant moon of Mars, with a heavily cratered surface.', 'Mars                          ', 4500.0, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'A highly volcanic moon of Jupiter with hundreds of active volcanoes.', 'Jupiter                       ', 4500.0, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon of Jupiter believed to have a liquid ocean beneath its frozen surface.', 'Jupiter                       ', 4500.0, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System, with its own magnetic field.', 'Jupiter                       ', 4500.0, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon of Jupiter with an ancient surface.', 'Jupiter                       ', 4500.0, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'A small irregular moon of Jupiter with a reddish surface.', 'Jupiter                       ', 4500.0, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 'Saturn largest moon, with a thick nitrogen atmosphere and lakes of liquid methane.', 'Saturn                        ', 4500.0, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'An icy moon of Saturn that releases water-rich plumes from its south polar region.', 'Saturn                        ', 4500.0, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'The second-largest moon of Saturn, composed mainly of ice and rock.', 'Saturn                        ', 4500.0, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'A moon of Saturn known for its contrasting bright and dark hemispheres.', 'Saturn                        ', 4500.0, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 'An icy moon of Saturn with numerous craters and bright surface fractures.', 'Saturn                        ', 4500.0, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 'A small moon of Saturn recognized by its large Herschel impact crater.', 'Saturn                        ', 4500.0, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 'An icy moon of Saturn featuring a huge impact crater and a large canyon.', 'Saturn                        ', 4500.0, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', 'A small moon of Uranus with cliffs, grooves, and unusually varied terrain.', 'Uranus                        ', 4500.0, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 'A moon of Uranus with bright terrain, valleys, and extensive surface fractures.', 'Uranus                        ', 4500.0, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 'The largest moon of Uranus, featuring large canyons and impact craters.', 'Uranus                        ', 4500.0, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 'The outermost major moon of Uranus, with an ancient, heavily cratered surface.', 'Uranus                        ', 4500.0, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 'Neptune largest moon, orbiting backward relative to the planet rotation.', 'Neptune                       ', 4500.0, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in the Solar System and the closest to the Sun.', 'Terrestrial                   ', false, 7);
INSERT INTO public.planet VALUES (2, 'Venus', 'The hottest planet in the Solar System, with a thick carbon dioxide atmosphere.', 'Terrestrial                   ', false, 7);
INSERT INTO public.planet VALUES (3, 'Earth', 'The third planet from the Sun, with liquid water and a suitable environment for known life.', 'Terrestrial                   ', true, 7);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Red Planet, known for its iron-rich surface, volcanoes, and evidence of ancient water.', 'Terrestrial                   ', false, 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System, famous for its Great Red Spot.', 'Gas Giant                     ', false, 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 'A gas giant famous for its spectacular rings made of ice and rocky particles.', 'Gas Giant                     ', false, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a blue-green atmosphere and an unusual sideways rotation.', 'Ice Giant                     ', false, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 'A distant ice giant known for its deep blue appearance and powerful winds.', 'Ice Giant                     ', false, 7);
INSERT INTO public.planet VALUES (9, 'Pluto', 'A dwarf planet in the Kuiper Belt with mountains, glaciers, and a thin atmosphere.', 'Dwarf Planet                  ', false, 7);
INSERT INTO public.planet VALUES (10, 'Ceres', 'The largest object in the asteroid belt between Mars and Jupiter and a dwarf planet.', 'Dwarf Planet                  ', false, 7);
INSERT INTO public.planet VALUES (11, 'Eris', 'A distant dwarf planet beyond Neptune that is similar in size to Pluto.', 'Dwarf Planet                  ', false, 7);
INSERT INTO public.planet VALUES (12, 'Haumea', 'A rapidly rotating dwarf planet beyond Neptune with an elongated shape.', 'Dwarf Planet                  ', false, 7);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (1, 'Apollo 11', 'NASA', 'Moon', 1969, true);
INSERT INTO public.space_mission VALUES (2, 'Voyager 1', 'NASA', 'Interstellar Space', 1977, true);
INSERT INTO public.space_mission VALUES (3, 'Mars Orbiter Mission', 'ISRO', 'Mars', 2013, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Brightest star in Earth''s night sky, a blue-white star in Canis Major.', 8.6, 2, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red supergiant star in the constellation Orion.', 625.0, 700, 1);
INSERT INTO public.star VALUES (3, 'Vega', 'Bright blue-white star in the constellation Lyra.', 25.0, 3, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'Brilliant blue-white supergiant star in the constellation Orion.', 860.0, 65, 1);
INSERT INTO public.star VALUES (5, 'Arcturus', 'Bright orange giant star in the constellation Bootes.', 37.0, 25, 1);
INSERT INTO public.star VALUES (6, 'Antares', 'Red supergiant star in the constellation Scorpius.', 575.0, 650, 1);
INSERT INTO public.star VALUES (7, 'Sun', 'The star at the center of the Solar System, providing light and heat to its planets.', 0.0, 1, 1);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_mission_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uq_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_name UNIQUE (name);


--
-- Name: moon uq_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_moon_name UNIQUE (name);


--
-- Name: planet uq_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_name UNIQUE (name);


--
-- Name: space_mission uq_space_mission_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT uq_space_mission_name UNIQUE (name);


--
-- Name: star uq_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

