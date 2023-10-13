--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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
-- Name: coursetw2; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA coursetw2;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: temps; Type: TABLE; Schema: coursetw2; Owner: -
--

CREATE TABLE coursetw2.temps (
    id integer NOT NULL,
    dossard smallint,
    etape smallint,
    chrono interval
);


--
-- Name: coureurs; Type: TABLE; Schema: coursetw2; Owner: -
--

CREATE TABLE coursetw2.coureurs (
    dossard integer NOT NULL,
    nom character varying(15) NOT NULL,
    equipe character varying(20),
    taille integer
);


--
-- Name: equipes; Type: TABLE; Schema: coursetw2; Owner: -
--

CREATE TABLE coursetw2.equipes (
    nom character varying(20) NOT NULL,
    couleur character varying(10),
    directeur character varying(15)
);


--
-- Name: etapes; Type: TABLE; Schema: coursetw2; Owner: -
--

CREATE TABLE coursetw2.etapes (
    numero smallint NOT NULL,
    nom text NOT NULL,
    distance smallint,
    date date
);


--
-- Name: temps_id_seq; Type: SEQUENCE; Schema: coursetw2; Owner: -
--

CREATE SEQUENCE coursetw2.temps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: temps_id_seq; Type: SEQUENCE OWNED BY; Schema: coursetw2; Owner: -
--

ALTER SEQUENCE coursetw2.temps_id_seq OWNED BY coursetw2.temps.id;


--
-- Name: temps id; Type: DEFAULT; Schema: coursetw2; Owner: -
--

ALTER TABLE ONLY coursetw2.temps ALTER COLUMN id SET DEFAULT nextval('coursetw2.temps_id_seq'::regclass);


--
-- Data for Name: coureurs; Type: TABLE DATA; Schema: coursetw2; Owner: -
--

COPY coursetw2.coureurs (dossard, nom, equipe, taille) FROM stdin;
1	alain	LavePlusBlanc	175
2	alphonse	PicsouBank	185
3	germain	PicsouBank	183
4	théodule	SuperCarburant	169
5	albert	PicsouBank	174
6	louis	LavePlusBlanc	184
7	léon	SuperCarburant	190
\.


--
-- Data for Name: equipes; Type: TABLE DATA; Schema: coursetw2; Owner: -
--

COPY coursetw2.equipes (nom, couleur, directeur) FROM stdin;
PicsouBank	Or	Raymond
SuperCarburant	Bleu	Ralph
LavePlusBlanc	Gris	Roger
\.


--
-- Data for Name: etapes; Type: TABLE DATA; Schema: coursetw2; Owner: -
--

COPY coursetw2.etapes (numero, nom, distance, date) FROM stdin;
1	Copenhague > Copenhague	13	2022-07-01
2	Roskilde > Nyborg	199	2022-07-02
3	Vejle > Sønderborg	182	2022-07-03
4	Dunkerque > Calais	172	2022-07-05
5	Lille Métropole > Arenberg Porte du Hainaut	155	2022-07-06
6	Binche > Longwy	220	2022-07-07
7	Tomblaine > La Super Planche des Belles Filles	176	2022-07-08
8	Dole > Lausanne	184	2022-07-09
9	Aigle > Châtel Les Portes du Soleil	183	2022-07-10
10	Morzine Les Portes du Soleil > Megève	148	2022-07-12
11	Albertville > Col du Granon Serre Chevalier	149	2022-07-13
12	Briançon > Alpe d'Huez	166	2022-07-14
13	Le Bourg d'Oisans > Saint-Étienne	193	2022-07-15
14	Saint-Étienne > Mende	195	2022-07-16
15	Rodez > Carcassonne	200	2022-07-17
16	Carcassonne > Foix	179	2022-07-19
17	Saint-Gaudens > Peyragudes	130	2022-07-20
18	Lourdes > Hautacam	143	2022-07-21
19	Castelnau-Magnoac > Cahors	189	2022-07-22
20	Lacapelle-Marival > Rocamadour	40	2022-07-23
21	Paris La Défense Arena > Paris Champs-Élysées	112	2022-07-24
\.


--
-- Data for Name: temps; Type: TABLE DATA; Schema: coursetw2; Owner: -
--

COPY coursetw2.temps (id, dossard, etape, chrono) FROM stdin;
1	1	1	00:21:13.5
2	2	1	00:21:19.2
3	3	1	00:21:06.6
4	4	1	00:21:21.1
5	5	1	00:21:10.5
6	6	1	00:21:25.5
7	7	1	00:21:22.5
8	1	2	05:02:41
9	2	2	05:04:54.7
10	3	2	04:56:25.1
11	4	2	05:00:21.6
12	5	2	05:09:39.3
13	6	2	05:05:12.1
14	7	2	05:11:46.3
15	1	3	05:28:51.3
16	2	3	05:19:57.9
17	3	3	05:12:49
18	4	3	05:23:41.3
19	5	3	05:10:28.3
20	6	3	05:11:52.1
21	7	3	05:21:18.8
22	1	4	03:48:20.4
23	2	4	03:50:14.3
24	3	4	03:44:38.7
25	4	4	03:56:23.8
26	5	4	03:50:05.8
27	6	4	03:52:42.7
28	7	4	03:44:59.9
29	1	5	05:10:45.8
30	3	5	04:58:43.5
31	4	5	05:03:07.5
32	5	5	05:01:09.7
33	6	5	04:59:33.5
34	7	5	05:11:12.6
35	1	6	06:16:17.3
36	3	6	06:12:11.5
37	4	6	06:16:05
38	5	6	06:15:54.5
39	6	6	06:17:33
40	7	6	06:19:18.4
41	1	7	05:08:58.1
42	3	7	05:10:20.9
43	4	7	05:06:32.1
44	5	7	05:01:31.7
45	6	7	05:10:44.1
46	7	7	05:05:33.7
47	1	8	04:38:07.1
48	3	8	04:33:50.7
49	4	8	04:34:03.9
50	5	8	04:40:22.6
51	6	8	04:42:15
52	7	8	04:37:02.8
53	1	9	05:23:15.4
54	3	9	05:24:38.8
55	4	9	05:20:49.3
56	5	9	05:18:36.4
57	6	9	05:23:56.3
58	7	9	05:17:44.2
59	1	10	05:12:51.9
60	3	10	05:22:03.8
61	4	10	05:21:05.5
62	5	10	05:19:36.2
63	6	10	05:18:29
64	7	10	05:21:02.4
65	1	11	04:22:07.2
66	3	11	04:23:02.7
67	4	11	04:29:59.8
68	5	11	04:23:07.2
69	6	11	04:20:00.9
70	7	11	04:21:58.4
71	1	12	04:42:05.8
72	3	12	04:41:21.5
73	4	12	04:34:02.1
74	5	12	04:32:58.2
75	6	12	04:42:51.2
76	7	12	04:38:18.9
77	1	13	06:39:45
78	3	13	06:42:58.2
79	4	13	06:54:56.4
80	5	13	06:42:51.5
81	7	13	06:41:36.9
82	1	14	04:57:42
83	3	14	04:55:35.5
84	4	14	04:51:32.8
85	5	14	04:59:40.4
86	7	14	04:57:28.1
87	1	15	04:59:10.3
88	3	15	05:05:39.2
89	4	15	04:52:05.9
90	5	15	05:02:56.6
91	7	15	04:54:56.2
92	1	16	04:06:28.3
93	3	16	04:10:26.3
94	4	16	04:10:51.2
95	5	16	04:02:22.9
96	7	16	04:11:20.7
97	1	17	03:24:58.1
98	3	17	03:27:41.4
99	4	17	03:21:10.4
100	5	17	03:27:56.2
101	7	17	03:27:06.8
102	1	18	04:13:11
103	3	18	04:18:00.9
104	4	18	04:06:27.4
105	5	18	04:17:13.8
106	7	18	04:12:08
107	1	19	04:16:13.9
108	3	19	04:19:48.5
109	4	19	04:16:35.6
110	5	19	04:15:15.5
111	7	19	04:18:22.6
112	1	20	01:07:33.1
113	3	20	01:05:35.2
114	4	20	01:06:38.1
115	5	20	01:06:24.9
116	7	20	01:06:22.5
117	1	21	02:33:34.7
118	3	21	02:33:50.8
119	4	21	02:33:01.6
120	5	21	02:34:44.5
121	7	21	02:38:51.3
\.


--
-- Name: temps_id_seq; Type: SEQUENCE SET; Schema: coursetw2; Owner: -
--

SELECT pg_catalog.setval('coursetw2.temps_id_seq', 121, true);


--
-- Name: coureurs coureurs_pkey; Type: CONSTRAINT; Schema: coursetw2; Owner: -
--

ALTER TABLE ONLY coursetw2.coureurs
    ADD CONSTRAINT coureurs_pkey PRIMARY KEY (dossard);


--
-- Name: equipes equipes_pkey; Type: CONSTRAINT; Schema: coursetw2; Owner: -
--

ALTER TABLE ONLY coursetw2.equipes
    ADD CONSTRAINT equipes_pkey PRIMARY KEY (nom);


--
-- Name: etapes etapes_pkey; Type: CONSTRAINT; Schema: coursetw2; Owner: -
--

ALTER TABLE ONLY coursetw2.etapes
    ADD CONSTRAINT etapes_pkey PRIMARY KEY (numero);


--
-- Name: temps temps_dossard_etape_key; Type: CONSTRAINT; Schema: coursetw2; Owner: -
--

ALTER TABLE ONLY coursetw2.temps
    ADD CONSTRAINT temps_dossard_etape_key UNIQUE (dossard, etape);


--
-- Name: coureurs coureurs_equipe_fkey; Type: FK CONSTRAINT; Schema: coursetw2; Owner: -
--

ALTER TABLE ONLY coursetw2.coureurs
    ADD CONSTRAINT coureurs_equipe_fkey FOREIGN KEY (equipe) REFERENCES coursetw2.equipes(nom);


--
-- Name: temps temps_dossard_fkey; Type: FK CONSTRAINT; Schema: coursetw2; Owner: -
--

ALTER TABLE ONLY coursetw2.temps
    ADD CONSTRAINT temps_dossard_fkey FOREIGN KEY (dossard) REFERENCES coursetw2.coureurs(dossard);


--
-- Name: temps temps_etape_fkey; Type: FK CONSTRAINT; Schema: coursetw2; Owner: -
--

ALTER TABLE ONLY coursetw2.temps
    ADD CONSTRAINT temps_etape_fkey FOREIGN KEY (etape) REFERENCES coursetw2.etapes(numero);


--
-- PostgreSQL database dump complete
--