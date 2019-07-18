--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Ubuntu 10.7-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: zuglaufverspaetungsmeldungen; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leidis_zuglaufverspaetungsmeldungen (
    verspaetungsmeldung_id bigint NOT NULL,
    fahrplanjahr smallint NOT NULL,
    betriebstag date NOT NULL,
    source_load_id bigint NOT NULL,
    load_id bigint NOT NULL,
    zuglauf_id integer NOT NULL,
    modellzug_id integer,
    qualitaetszug integer,
    idx integer NOT NULL,
    an_ab integer,
    knot_nr integer NOT NULL,
    ist timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    verspaetungsursache integer NOT NULL,
    anteil_verspaetung integer,
    strecken_nr integer,
    verursacher_zugnummer character varying(10),
    verursacher_zuglauf_id integer,
    stoerfall_betriebstag timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    stoerfall_niederlassung character varying(15),
    stoerfall_nr integer,
    oertlich_strecke integer
)
PARTITION BY LIST (fahrplanjahr);


--
-- Name: TABLE zuglaufverspaetungsmeldungen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.leidis_zuglaufverspaetungsmeldungen IS 'Zuglaufverspaetungsmeldungen aus Leidis';


--
-- Name: COLUMN zuglaufverspaetungsmeldungen.verspaetungsmeldung_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufverspaetungsmeldungen.verspaetungsmeldung_id IS 'eindeutige ID für Verspätungsmeldungen';


--
-- Name: COLUMN zuglaufverspaetungsmeldungen.fahrplanjahr; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufverspaetungsmeldungen.fahrplanjahr IS 'Fahrplanjahr aus Zuglauf Leidis Importer';


--
-- Name: COLUMN zuglaufverspaetungsmeldungen.betriebstag; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufverspaetungsmeldungen.betriebstag IS 'Betriebstag aus Zuglauf Leidis Importer';


--
-- Name: COLUMN zuglaufverspaetungsmeldungen.source_load_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufverspaetungsmeldungen.source_load_id IS 'Load_id aus import_control quality_warehouse';


--
-- Name: COLUMN zuglaufverspaetungsmeldungen.zuglauf_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufverspaetungsmeldungen.zuglauf_id IS 'eindeutige Id des Zuges';


--
-- Name: COLUMN zuglaufverspaetungsmeldungen.modellzug_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufverspaetungsmeldungen.modellzug_id IS 'Id des Modellzuges, festgelegt anhand der Zughaupt- und Unternummer';


--
-- Name: COLUMN zuglaufverspaetungsmeldungen.qualitaetszug; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufverspaetungsmeldungen.qualitaetszug IS 'Wird beim Import anhand der Qualitätszuglisten gesetzt';


--
-- Name: zuglaufverspaetungsmeldungen_verspaetungsmeldung_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zuglaufverspaetungsmeldungen_verspaetungsmeldung_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zuglaufverspaetungsmeldungen_verspaetungsmeldung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zuglaufverspaetungsmeldungen_verspaetungsmeldung_id_seq OWNED BY public.leidis_zuglaufverspaetungsmeldungen.verspaetungsmeldung_id;


--
-- Name: zuglaufverspaetungsmeldungen verspaetungsmeldung_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen ALTER COLUMN verspaetungsmeldung_id SET DEFAULT nextval('public.zuglaufverspaetungsmeldungen_verspaetungsmeldung_id_seq'::regclass);


--
-- partitions
--
CREATE TABLE public.leidis_zuglaufverspaetungsmeldungen_2014 PARTITION OF public.leidis_zuglaufverspaetungsmeldungen FOR VALUES IN ('2014');
CREATE TABLE public.leidis_zuglaufverspaetungsmeldungen_2015 PARTITION OF public.leidis_zuglaufverspaetungsmeldungen FOR VALUES IN ('2015');
CREATE TABLE public.leidis_zuglaufverspaetungsmeldungen_2016 PARTITION OF public.leidis_zuglaufverspaetungsmeldungen FOR VALUES IN ('2016');
CREATE TABLE public.leidis_zuglaufverspaetungsmeldungen_2017 PARTITION OF public.leidis_zuglaufverspaetungsmeldungen FOR VALUES IN ('2017');
CREATE TABLE public.leidis_zuglaufverspaetungsmeldungen_2018 PARTITION OF public.leidis_zuglaufverspaetungsmeldungen FOR VALUES IN ('2018');
CREATE TABLE public.leidis_zuglaufverspaetungsmeldungen_2019 PARTITION OF public.leidis_zuglaufverspaetungsmeldungen FOR VALUES IN ('2019');
CREATE TABLE public.leidis_zuglaufverspaetungsmeldungen_2020 PARTITION OF public.leidis_zuglaufverspaetungsmeldungen FOR VALUES IN ('2020');
--
-- primary keys, foreign keys und Indices
--
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2014
    ADD CONSTRAINT zuglaufverspaetungsmeldungen_2014_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx, verspaetungsmeldung_id);
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2015
    ADD CONSTRAINT zuglaufverspaetungsmeldungen_2015_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx, verspaetungsmeldung_id);
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2016
    ADD CONSTRAINT zuglaufverspaetungsmeldungen_2016_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx, verspaetungsmeldung_id);
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2017
    ADD CONSTRAINT zuglaufverspaetungsmeldungen_2017_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx, verspaetungsmeldung_id);
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2018
    ADD CONSTRAINT zuglaufverspaetungsmeldungen_2018_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx, verspaetungsmeldung_id);
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2019
    ADD CONSTRAINT zuglaufverspaetungsmeldungen_2019_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx, verspaetungsmeldung_id);
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2020
    ADD CONSTRAINT zuglaufverspaetungsmeldungen_2020_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx, verspaetungsmeldung_id);	
	
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2014  ADD CONSTRAINT zuglaufverspaetungsmeldungen_2014_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id, idx) 
	REFERENCES public.leidis_zuglaufmeldungen_2014(fahrplanjahr, zuglauf_id, idx);	
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2015  ADD CONSTRAINT zuglaufverspaetungsmeldungen_2015_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id, idx) 
	REFERENCES public.leidis_zuglaufmeldungen_2015(fahrplanjahr, zuglauf_id, idx);
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2016  ADD CONSTRAINT zuglaufverspaetungsmeldungen_2016_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id, idx) 
	REFERENCES public.leidis_zuglaufmeldungen_2016(fahrplanjahr, zuglauf_id, idx);
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2017  ADD CONSTRAINT zuglaufverspaetungsmeldungen_2017_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id, idx) 
	REFERENCES public.leidis_zuglaufmeldungen_2017(fahrplanjahr, zuglauf_id, idx);
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2018  ADD CONSTRAINT zuglaufverspaetungsmeldungen_2018_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id, idx) 
	REFERENCES public.leidis_zuglaufmeldungen_2018(fahrplanjahr, zuglauf_id, idx);
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2019  ADD CONSTRAINT zuglaufverspaetungsmeldungen_2019_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id, idx) 
	REFERENCES public.leidis_zuglaufmeldungen_2019(fahrplanjahr, zuglauf_id, idx);
ALTER TABLE ONLY public.leidis_zuglaufverspaetungsmeldungen_2020  ADD CONSTRAINT zuglaufverspaetungsmeldungen_2020_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id, idx) 
	REFERENCES public.leidis_zuglaufmeldungen_2020(fahrplanjahr, zuglauf_id, idx);

CREATE INDEX ix_zuglaufverspaetungsmeldungen_betriebstag_2014 ON public.leidis_zuglaufverspaetungsmeldungen_2014(betriebstag);
CREATE INDEX ix_zuglaufverspaetungsmeldungen_betriebstag_2015 ON public.leidis_zuglaufverspaetungsmeldungen_2015(betriebstag);
CREATE INDEX ix_zuglaufverspaetungsmeldungen_betriebstag_2016 ON public.leidis_zuglaufverspaetungsmeldungen_2016(betriebstag);
CREATE INDEX ix_zuglaufverspaetungsmeldungen_betriebstag_2017 ON public.leidis_zuglaufverspaetungsmeldungen_2017(betriebstag);
CREATE INDEX ix_zuglaufverspaetungsmeldungen_betriebstag_2018 ON public.leidis_zuglaufverspaetungsmeldungen_2018(betriebstag);
CREATE INDEX ix_zuglaufverspaetungsmeldungen_betriebstag_2019 ON public.leidis_zuglaufverspaetungsmeldungen_2019(betriebstag);
CREATE INDEX ix_zuglaufverspaetungsmeldungen_betriebstag_2020 ON public.leidis_zuglaufverspaetungsmeldungen_2020(betriebstag);	