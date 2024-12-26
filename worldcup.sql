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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(60) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 561, 562, 2, 4);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 563, 564, 0, 2);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 562, 564, 1, 2);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 561, 563, 0, 1);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 562, 565, 2, 3);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 564, 566, 0, 2);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 563, 567, 1, 2);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 561, 568, 0, 2);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 564, 569, 1, 2);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 566, 570, 0, 1);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 563, 571, 2, 3);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 567, 572, 0, 2);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 562, 573, 1, 2);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 565, 574, 1, 2);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 568, 575, 1, 2);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 561, 576, 3, 4);
INSERT INTO public.games VALUES (17, 2014, 'Final', 577, 576, 0, 1);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 578, 567, 0, 3);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 576, 578, 0, 1);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 577, 567, 1, 7);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 578, 579, 0, 1);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 576, 563, 0, 1);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 567, 569, 1, 2);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 577, 561, 0, 1);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 567, 580, 1, 2);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 569, 568, 0, 2);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 561, 581, 0, 2);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 577, 582, 1, 2);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 578, 572, 1, 2);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 579, 583, 1, 2);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 576, 570, 0, 1);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 563, 584, 1, 2);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (561, 'France');
INSERT INTO public.teams VALUES (562, 'Croatia');
INSERT INTO public.teams VALUES (563, 'Belgium');
INSERT INTO public.teams VALUES (564, 'England');
INSERT INTO public.teams VALUES (565, 'Russia');
INSERT INTO public.teams VALUES (566, 'Sweden');
INSERT INTO public.teams VALUES (567, 'Brazil');
INSERT INTO public.teams VALUES (568, 'Uruguay');
INSERT INTO public.teams VALUES (569, 'Colombia');
INSERT INTO public.teams VALUES (570, 'Switzerland');
INSERT INTO public.teams VALUES (571, 'Japan');
INSERT INTO public.teams VALUES (572, 'Mexico');
INSERT INTO public.teams VALUES (573, 'Denmark');
INSERT INTO public.teams VALUES (574, 'Spain');
INSERT INTO public.teams VALUES (575, 'Portugal');
INSERT INTO public.teams VALUES (576, 'Argentina');
INSERT INTO public.teams VALUES (577, 'Germany');
INSERT INTO public.teams VALUES (578, 'Netherlands');
INSERT INTO public.teams VALUES (579, 'Costa Rica');
INSERT INTO public.teams VALUES (580, 'Chile');
INSERT INTO public.teams VALUES (581, 'Nigeria');
INSERT INTO public.teams VALUES (582, 'Algeria');
INSERT INTO public.teams VALUES (583, 'Greece');
INSERT INTO public.teams VALUES (584, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 584, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

