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
-- Name: zuglauf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leidis_zuglauf (
    fahrplanjahr smallint NOT NULL,
    betriebstag date NOT NULL,
    source_load_id bigint NOT NULL,
    load_id bigint NOT NULL,
    zuglauf_id integer NOT NULL,
    modellzug_id integer,
    qualitaetszug integer,
    zug_nr integer,
    linie_nr character varying(6),
    linie_richtung character varying(1),
    direction character varying(1),
    line_name name,
    line_route_name name,
    time_profile_name name,
    veh_journey_no integer,
    v_sys_code character varying(10),
    geteilter_zug integer,
    zghnr integer,
    zgunr integer,
    orig_knot_nr integer,
    dest_knot_nr integer,
    dest_knot_index integer,
    laenge integer,
    abfahrt timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    prognose_faktor double precision,
    verkehrsart integer,
    grenz_knoten_in integer,
    grenz_knoten_in_index integer,
    grenz_knoten_out integer,
    grenz_knoten_out_index integer,
    datei_tag timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    orig_zug_nr character varying(50),
    hat_doppel_fahrten integer,
    hat_haltezeitproblem integer,
    hat_fahrzeitproblem integer
)
PARTITION BY LIST (fahrplanjahr);
ALTER TABLE ONLY public.leidis_zuglauf ALTER COLUMN zuglauf_id SET (n_distinct=13538631);


--
-- Name: TABLE zuglauf; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.leidis_zuglauf IS 'Zuglauf aus Leidis';


--
-- Name: COLUMN zuglauf.fahrplanjahr; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglauf.fahrplanjahr IS 'Fahrplanjahr aus Zuglauf Leidis Importer';


--
-- Name: COLUMN zuglauf.betriebstag; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglauf.betriebstag IS 'Betriebstag aus Zuglauf Leidis Importer';


--
-- Name: COLUMN zuglauf.source_load_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglauf.source_load_id IS 'Load_id aus import_control quality_warehouse';


--
-- Name: COLUMN zuglauf.zuglauf_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglauf.zuglauf_id IS 'eindeutige Id des Zuges';


--
-- Name: COLUMN zuglauf.modellzug_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglauf.modellzug_id IS 'Id des Modellzuges, festgelegt anhand der Zughaupt- und Unternummer';


--
-- Name: COLUMN zuglauf.qualitaetszug; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.leidis_zuglauf.qualitaetszug IS 'Wird beim Import anhand der Qualitätszuglisten gesetzt';


--
-- partitions
--
CREATE TABLE public.leidis_zuglauf_2014 PARTITION OF public.leidis_zuglauf FOR VALUES IN ('2014');
CREATE TABLE public.leidis_zuglauf_2015 PARTITION OF public.leidis_zuglauf FOR VALUES IN ('2015');
CREATE TABLE public.leidis_zuglauf_2016 PARTITION OF public.leidis_zuglauf FOR VALUES IN ('2016');
CREATE TABLE public.leidis_zuglauf_2017 PARTITION OF public.leidis_zuglauf FOR VALUES IN ('2017');
CREATE TABLE public.leidis_zuglauf_2018 PARTITION OF public.leidis_zuglauf FOR VALUES IN ('2018');
CREATE TABLE public.leidis_zuglauf_2019 PARTITION OF public.leidis_zuglauf FOR VALUES IN ('2019');
CREATE TABLE public.leidis_zuglauf_2020 PARTITION OF public.leidis_zuglauf FOR VALUES IN ('2020');
--
-- primary key und indices
--
ALTER TABLE public.leidis_zuglauf_2014 ADD CONSTRAINT zuglauf_2014_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id);
ALTER TABLE public.leidis_zuglauf_2015 ADD CONSTRAINT zuglauf_2015_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id);
ALTER TABLE public.leidis_zuglauf_2016 ADD CONSTRAINT zuglauf_2016_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id);
ALTER TABLE public.leidis_zuglauf_2017 ADD CONSTRAINT zuglauf_2017_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id);
ALTER TABLE public.leidis_zuglauf_2018 ADD CONSTRAINT zuglauf_2018_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id);
ALTER TABLE public.leidis_zuglauf_2019 ADD CONSTRAINT zuglauf_2019_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id);
ALTER TABLE public.leidis_zuglauf_2020 ADD CONSTRAINT zuglauf_2020_pkey PRIMARY KEY (fahrplanjahr, zuglauf_id);

CREATE INDEX ix_zuglauf_betriebstag_2014 ON public.leidis_zuglauf_2014 (betriebstag);
CREATE INDEX ix_zuglauf_betriebstag_2015 ON public.leidis_zuglauf_2015 (betriebstag);
CREATE INDEX ix_zuglauf_betriebstag_2016 ON public.leidis_zuglauf_2016 (betriebstag);
CREATE INDEX ix_zuglauf_betriebstag_2017 ON public.leidis_zuglauf_2017 (betriebstag);
CREATE INDEX ix_zuglauf_betriebstag_2018 ON public.leidis_zuglauf_2018 (betriebstag);
CREATE INDEX ix_zuglauf_betriebstag_2019 ON public.leidis_zuglauf_2019 (betriebstag);
CREATE INDEX ix_zuglauf_betriebstag_2020 ON public.leidis_zuglauf_2020 (betriebstag);