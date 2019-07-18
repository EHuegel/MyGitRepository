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
-- Name: import_control; Type: TABLE; Schema: cntrl; Owner: -
--

CREATE TABLE cntrl.import_control (
    load_id bigint,
    source_load_id bigint,
    business_date_id date NOT NULL,
    business_datetime_id timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    prognose_faktor double precision,
    business_num_id numeric(38,10),
    business_text_id character varying(255),
    fahrplanjahr smallint,
    importer_version character varying(255),
    app character varying(255) NOT NULL,
    processing_start_time timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    processing_end_time timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP),
    rows_processed integer,
    comment character varying(2000),
    processing_flag integer NOT NULL,
    fahrplanjahr_aktuell smallint
);


--
-- Name: import_control uc_import_control_business; Type: CONSTRAINT; Schema: cntrl; Owner: -
--

ALTER TABLE ONLY cntrl.import_control
    ADD CONSTRAINT uc_import_control_business UNIQUE (app, business_date_id);


--
-- PostgreSQL database dump complete
--

