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
-- Name: list; Type: TABLE; Schema: public; Owner: natelipp
--

CREATE TABLE list (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE list OWNER TO natelipp;

--
-- Name: list_id_seq; Type: SEQUENCE; Schema: public; Owner: natelipp
--

CREATE SEQUENCE list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE list_id_seq OWNER TO natelipp;

--
-- Name: list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: natelipp
--

ALTER SEQUENCE list_id_seq OWNED BY list.id;


--
-- Name: todo; Type: TABLE; Schema: public; Owner: natelipp
--

CREATE TABLE todo (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    list_id integer NOT NULL,
    completed boolean DEFAULT false NOT NULL
);


ALTER TABLE todo OWNER TO natelipp;

--
-- Name: todo_id_seq; Type: SEQUENCE; Schema: public; Owner: natelipp
--

CREATE SEQUENCE todo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE todo_id_seq OWNER TO natelipp;

--
-- Name: todo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: natelipp
--

ALTER SEQUENCE todo_id_seq OWNED BY todo.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: natelipp
--

ALTER TABLE ONLY list ALTER COLUMN id SET DEFAULT nextval('list_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: natelipp
--

ALTER TABLE ONLY todo ALTER COLUMN id SET DEFAULT nextval('todo_id_seq'::regclass);


--
-- Data for Name: list; Type: TABLE DATA; Schema: public; Owner: natelipp
--

COPY list (id, name) FROM stdin;
\.


--
-- Name: list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: natelipp
--

SELECT pg_catalog.setval('list_id_seq', 1, false);


--
-- Data for Name: todo; Type: TABLE DATA; Schema: public; Owner: natelipp
--

COPY todo (id, name, list_id, completed) FROM stdin;
\.


--
-- Name: todo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: natelipp
--

SELECT pg_catalog.setval('todo_id_seq', 1, false);


--
-- Name: list_name_key; Type: CONSTRAINT; Schema: public; Owner: natelipp
--

ALTER TABLE ONLY list
    ADD CONSTRAINT list_name_key UNIQUE (name);


--
-- Name: list_pkey; Type: CONSTRAINT; Schema: public; Owner: natelipp
--

ALTER TABLE ONLY list
    ADD CONSTRAINT list_pkey PRIMARY KEY (id);


--
-- Name: todo_pkey; Type: CONSTRAINT; Schema: public; Owner: natelipp
--

ALTER TABLE ONLY todo
    ADD CONSTRAINT todo_pkey PRIMARY KEY (id);


--
-- Name: todo_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: natelipp
--

ALTER TABLE ONLY todo
    ADD CONSTRAINT todo_list_id_fkey FOREIGN KEY (list_id) REFERENCES list(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: natelipp
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM natelipp;
GRANT ALL ON SCHEMA public TO natelipp;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

