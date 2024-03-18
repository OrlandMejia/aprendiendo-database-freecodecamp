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

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, galaxy_number, number_of_planet, distance_km, description, status, inhabited) FROM stdin;
1	Vía Láctea	100000.00	8	100000	Nuestra galaxia	t	t
2	Andrómeda	90000.00	7	120000	Galaxia espiral	t	t
3	Galaxia del Sombrero	50000.00	3	80000	Galaxia lenticular	t	f
4	Galaxia del Cigarro	70000.00	5	90000	Galaxia irregular	f	f
5	Galaxia del Triángulo	60000.00	4	85000	Galaxia espiral	t	f
6	NGC 1300	45000.00	2	70000	Galaxia barrada	t	f
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, distance_km, type, status, galaxy_id, temperature) FROM stdin;
1	Sol	0.00	Estrella enana amarilla	t	1	5778.00
2	Alpha Centauri A	4.37	Estrella enana amarilla	t	1	5790.00
3	Alpha Centauri B	4.37	Estrella enana naranja	t	1	5260.00
4	Proxima Centauri	4.24	Enana roja	t	1	3042.00
5	Sirius A	8.60	Estrella de la secuencia principal	t	1	9940.00
6	Sirius B	8.60	Enana blanca	t	1	25100.00
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, description, distance_km, inhabited, star_id) FROM stdin;
1	Tierra	El tercer planeta desde el Sol en nuestro sistema solar.	149.60	t	1
2	Marte	El cuarto planeta desde el Sol en nuestro sistema solar.	227.90	f	1
3	Venus	El segundo planeta desde el Sol en nuestro sistema solar.	108.20	f	1
4	Júpiter	El quinto planeta desde el Sol en nuestro sistema solar.	778.60	f	5
5	Saturno	El sexto planeta desde el Sol en nuestro sistema solar.	1433.50	f	5
6	Urano	El séptimo planeta desde el Sol en nuestro sistema solar.	2872.50	f	5
7	Mercurio	El planeta más cercano al Sol en nuestro sistema solar.	57.90	f	1
8	Neptuno	El octavo planeta desde el Sol en nuestro sistema solar.	4495.10	f	5
9	Plutón	Un planeta enano en nuestro sistema solar.	5906.40	f	5
10	Makemake	Un planeta enano del cinturón de Kuiper.	6817.00	f	5
11	Eris	Un planeta enano más allá de Neptuno.	10138.00	f	5
12	Ceres	Un planeta enano en el cinturón de asteroides.	4141.40	f	1
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, distance, size_km, inhabited, atmosphere, planet_id) FROM stdin;
1	Luna	384.40	3474.80	f	f	1
2	Deimos	23.50	6.20	f	f	2
3	Fobos	9.40	22.20	f	f	2
4	Tritón	354.80	2706.80	f	t	3
5	Titán	1221.90	5150.00	f	t	4
6	Ganímedes	1070.40	5262.40	f	t	4
7	Calisto	1883.50	4821.60	f	f	4
8	Europa	671.10	3121.60	f	t	4
9	Ío	421.70	3636.00	f	t	4
10	Encélado	238.00	504.20	f	t	5
11	Mimas	185.50	396.40	f	f	5
12	Tetis	294.60	1062.80	f	f	5
13	Dione	377.40	1122.80	f	f	5
14	Rea	527.00	1527.60	f	f	5
15	Titania	435.90	1577.80	f	f	6
16	Oberón	583.50	1529.00	f	f	6
17	Ariel	190.90	1157.80	f	f	6
18	Umbriel	266.00	1169.40	f	f	6
19	Miranda	129.70	471.60	f	f	6
20	Alpha	5000.65	28000.50	t	f	2
\.


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.satellite (satellite_id, name, type, diameter_km, mass_kg, planet_id) FROM stdin;
1	Hubble	Observational	4	11111	1
2	ISS	Space station	109	419725	1
3	Voyager 1	Space probe	3	722	2
4	Voyager 2	Space probe	3	722	2
5	Tiros	Weather satellite	1	122	3
6	Astra 1KR	Communication satellite	5	1780	3
7	GOES 1	Weather satellite	2	306	4
8	Galileo	Navigation satellite	6	1545	4
9	Herschel	Space observatory	4	3300	5
10	Rosetta	Space probe	2	3000	5
\.


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
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

