--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: natelipp
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO natelipp;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: natelipp
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: users; Type: TABLE; Schema: public; Owner: natelipp
--

CREATE TABLE users (
    id integer NOT NULL,
    username character(25) NOT NULL,
    enabled boolean DEFAULT true
);


ALTER TABLE users OWNER TO natelipp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: natelipp
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO natelipp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: natelipp
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: natelipp
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: natelipp
--

INSERT INTO users VALUES (1, 'Billy Jean               ', false);
INSERT INTO users VALUES (2, 'Blanie Happy             ', true);
INSERT INTO users VALUES (3, 'Tim Beastmyer            ', true);
INSERT INTO users VALUES (4, 'Heidi Tigermaid          ', false);
INSERT INTO users VALUES (5, 'Blake Blue               ', true);
INSERT INTO users VALUES (6, 'Tracy Thompson           ', false);
INSERT INTO users VALUES (9, 'Baseball Dimond          ', true);
INSERT INTO users VALUES (7, 'CRIMPER                  ', true);
INSERT INTO users VALUES (8, 'Breakslacker Greg        ', true);
INSERT INTO users VALUES (10, 'Boo Trace                ', false);
INSERT INTO users VALUES (20, 'John Smith               ', false);
INSERT INTO users VALUES (90, 'Night WALLMAID            ', true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: natelipp
--

SELECT pg_catalog.setval('users_id_seq', 10, true);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: natelipp
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
