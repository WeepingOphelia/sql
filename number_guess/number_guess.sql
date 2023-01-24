--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1674597008551', 5, 549);
INSERT INTO public.users VALUES ('user_1674597116821', 2, 28);
INSERT INTO public.users VALUES ('user_1674597116822', 5, 124);
INSERT INTO public.users VALUES ('user_1674597253198', 2, 425);
INSERT INTO public.users VALUES ('user_1674597253199', 5, 331);
INSERT INTO public.users VALUES ('34', 2, 13);
INSERT INTO public.users VALUES ('user_1674597384930', 2, 852);
INSERT INTO public.users VALUES ('user_1674597384931', 5, 40);
INSERT INTO public.users VALUES ('user_1674596936001', 2, 899);
INSERT INTO public.users VALUES ('user_1674597457811', 2, 240);
INSERT INTO public.users VALUES ('user_1674597457812', 5, 146);
INSERT INTO public.users VALUES ('user_1674596936002', 5, 46);
INSERT INTO public.users VALUES ('user_1674596962666', 2, 278);
INSERT INTO public.users VALUES ('user_1674597502142', 2, 605);
INSERT INTO public.users VALUES ('user_1674596962667', 5, 184);
INSERT INTO public.users VALUES ('user_1674597502143', 5, 511);
INSERT INTO public.users VALUES ('user_1674597008550', 2, 643);
INSERT INTO public.users VALUES ('user_1674597515745', 2, 10);
INSERT INTO public.users VALUES ('user_1674597515746', 5, 68);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete