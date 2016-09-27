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
-- Name: expenses; Type: TABLE; Schema: public; Owner: natelipp
--

CREATE TABLE expenses (
    id integer NOT NULL,
    amount numeric(13,2) NOT NULL,
    memo text NOT NULL,
    created_on date NOT NULL,
    CONSTRAINT expenses_amount_check CHECK ((amount > (0)::numeric))
);


ALTER TABLE expenses OWNER TO natelipp;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: natelipp
--

CREATE SEQUENCE expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_id_seq OWNER TO natelipp;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: natelipp
--

ALTER SEQUENCE expenses_id_seq OWNED BY expenses.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: natelipp
--

ALTER TABLE ONLY expenses ALTER COLUMN id SET DEFAULT nextval('expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: natelipp
--

COPY expenses (id, amount, memo, created_on) FROM stdin;
3	14.56	Pencils	2016-09-24
4	3.29	Coffee	2016-09-24
5	49.99	Text Editor	2016-09-24
7	3.59	More Coffee	2016-09-24
8	43.23	Gas for Karen's Car	2016-09-26
13	43.23	Gas for Car	2016-09-26
15	4.33	Coffee from the Blue Cafe	2016-09-26
\.


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: natelipp
--

SELECT pg_catalog.setval('expenses_id_seq', 15, true);


--
-- Name: expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: natelipp
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


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

