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
-- Name: zuglaufmeldungen; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leidis_zuglaufmeldungen (
    fahrplanjahr smallint NOT NULL,
    betriebstag date NOT NULL,
    source_load_id bigint NOT NULL,
    load_id bigint NOT NULL,
    zuglauf_id integer NOT NULL,
    modellzug_id integer,
    qualitaetszug smallint,
    idx integer NOT NULL,
    knot_nr integer NOT NULL,
    vorgaenger_knot_nr integer,
    vorgaenger_abfahrt timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    vorgaenger_ist_abfahrt timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    ankunft timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    abfahrt timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    ist_ankunft timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    ist_abfahrt timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    halt integer,
    routing_knoten smallint,
    kummulierte_entfernung integer,
    streckennummer character varying(20),
    richtung integer,
    betriebsstelle character varying(7),
    soll_streckennummer character varying(20),
    gleis character varying(9),
    ist_gleis character varying(9),
    original_ankunft timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    original_abfahrt timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    original_ist_ankunft timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    original_ist_abfahrt timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
	ist_meldetag date
)
PARTITION BY LIST (fahrplanjahr);
ALTER TABLE ONLY public.leidis_zuglaufmeldungen ALTER COLUMN zuglauf_id SET (n_distinct=13538631, n_distinct_inherited=13538631);


--
-- Name: TABLE zuglaufmeldungen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.leidis_zuglaufmeldungen IS 'Zuglaufmeldungen aus Leidis';


--
-- Name: COLUMN zuglaufmeldungen.fahrplanjahr; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufmeldungen.fahrplanjahr IS 'Fahrplanjahr aus Zuglauf Leidis Importer';


--
-- Name: COLUMN zuglaufmeldungen.betriebstag; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufmeldungen.betriebstag IS 'Betriebstag aus Zuglauf Leidis Importer';


--
-- Name: COLUMN zuglaufmeldungen.source_load_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufmeldungen.source_load_id IS 'Load_id aus import_control quality_warehouse';


--
-- Name: COLUMN zuglaufmeldungen.zuglauf_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufmeldungen.zuglauf_id IS 'eindeutige Id des Zuges';


--
-- Name: COLUMN zuglaufmeldungen.modellzug_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufmeldungen.modellzug_id IS 'Id des Modellzuges, festgelegt anhand der Zughaupt- und Unternummer';


--
-- Name: COLUMN zuglaufmeldungen.qualitaetszug; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglaufmeldungen.qualitaetszug IS 'Wird beim Import anhand der Qualitätszuglisten gesetzt';


--
-- partions
--
CREATE TABLE public.leidis_zuglaufmeldungen_2014 PARTITION OF public.leidis_zuglaufmeldungen FOR VALUES IN ('2014');
CREATE TABLE public.leidis_zuglaufmeldungen_2015 PARTITION OF public.leidis_zuglaufmeldungen FOR VALUES IN ('2015');
CREATE TABLE public.leidis_zuglaufmeldungen_2016 PARTITION OF public.leidis_zuglaufmeldungen FOR VALUES IN ('2016');
CREATE TABLE public.leidis_zuglaufmeldungen_2017 PARTITION OF public.leidis_zuglaufmeldungen FOR VALUES IN ('2017');
CREATE TABLE public.leidis_zuglaufmeldungen_2018 PARTITION OF public.leidis_zuglaufmeldungen FOR VALUES IN ('2018');
CREATE TABLE public.leidis_zuglaufmeldungen_2019 PARTITION OF public.leidis_zuglaufmeldungen FOR VALUES IN ('2019');
CREATE TABLE public.leidis_zuglaufmeldungen_2020 PARTITION OF public.leidis_zuglaufmeldungen FOR VALUES IN ('2020');
--
-- primary keys, foreign keys und indices
--
ALTER TABLE public.leidis_zuglaufmeldungen_2014 ADD CONSTRAINT zuglaufmeldungen_2014_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx);
ALTER TABLE public.leidis_zuglaufmeldungen_2015 ADD CONSTRAINT zuglaufmeldungen_2015_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx);
ALTER TABLE public.leidis_zuglaufmeldungen_2016 ADD CONSTRAINT zuglaufmeldungen_2016_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx);
ALTER TABLE public.leidis_zuglaufmeldungen_2017 ADD CONSTRAINT zuglaufmeldungen_2017_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx);
ALTER TABLE public.leidis_zuglaufmeldungen_2018 ADD CONSTRAINT zuglaufmeldungen_2018_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx);
ALTER TABLE public.leidis_zuglaufmeldungen_2019 ADD CONSTRAINT zuglaufmeldungen_2019_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx);
ALTER TABLE public.leidis_zuglaufmeldungen_2020 ADD CONSTRAINT zuglaufmeldungen_2020_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id, idx);

ALTER TABLE ONLY public.leidis_zuglaufmeldungen_2014 ADD CONSTRAINT zuglaufmeldungen_2014_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id)
  REFERENCES public.leidis_zuglauf_2014(fahrplanjahr, zuglauf_id);
ALTER TABLE ONLY public.leidis_zuglaufmeldungen_2015 ADD CONSTRAINT zuglaufmeldungen_2015_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id)
  REFERENCES public.leidis_zuglauf_2015(fahrplanjahr, zuglauf_id);
ALTER TABLE ONLY public.leidis_zuglaufmeldungen_2016 ADD CONSTRAINT zuglaufmeldungen_2016_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id)
  REFERENCES public.leidis_zuglauf_2016(fahrplanjahr, zuglauf_id);
ALTER TABLE ONLY public.leidis_zuglaufmeldungen_2017 ADD CONSTRAINT zuglaufmeldungen_2017_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id)
  REFERENCES public.leidis_zuglauf_2017(fahrplanjahr, zuglauf_id);
ALTER TABLE ONLY public.leidis_zuglaufmeldungen_2018 ADD CONSTRAINT zuglaufmeldungen_2018_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id)
  REFERENCES public.leidis_zuglauf_2018(fahrplanjahr, zuglauf_id);
ALTER TABLE ONLY public.leidis_zuglaufmeldungen_2019 ADD CONSTRAINT zuglaufmeldungen_2019_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id)
  REFERENCES public.leidis_zuglauf_2019(fahrplanjahr, zuglauf_id);
ALTER TABLE ONLY public.leidis_zuglaufmeldungen_2020 ADD CONSTRAINT zuglaufmeldungen_2020_fahrplanjahr_fkey FOREIGN KEY (fahrplanjahr, zuglauf_id)
  REFERENCES public.leidis_zuglauf_2020(fahrplanjahr, zuglauf_id);  
  
CREATE INDEX ix_zuglaufmeldungen_betriebstag_2014 ON public.leidis_zuglaufmeldungen_2014(betriebstag);
CREATE INDEX ix_zuglaufmeldungen_betriebstag_2015 ON public.leidis_zuglaufmeldungen_2015(betriebstag);
CREATE INDEX ix_zuglaufmeldungen_betriebstag_2016 ON public.leidis_zuglaufmeldungen_2016(betriebstag);
CREATE INDEX ix_zuglaufmeldungen_betriebstag_2017 ON public.leidis_zuglaufmeldungen_2017(betriebstag);
CREATE INDEX ix_zuglaufmeldungen_betriebstag_2018 ON public.leidis_zuglaufmeldungen_2018(betriebstag);
CREATE INDEX ix_zuglaufmeldungen_betriebstag_2019 ON public.leidis_zuglaufmeldungen_2019(betriebstag);
CREATE INDEX ix_zuglaufmeldungen_betriebstag_2020 ON public.leidis_zuglaufmeldungen_2020(betriebstag);  