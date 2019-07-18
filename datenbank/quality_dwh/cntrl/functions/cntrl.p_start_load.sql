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

--
-- Name: p_start_load(date, timestamp with time zone, numeric, character varying, smallint, character varying, bigint, character varying); Type: FUNCTION; Schema: cntrl; Owner: -
--

CREATE FUNCTION cntrl.p_start_load(p_business_date_id date DEFAULT NULL::date, p_business_datetime_id timestamp with time zone DEFAULT NULL::timestamp with time zone, p_business_num_id numeric DEFAULT NULL::numeric, p_business_text_id character varying DEFAULT NULL::character varying, p_fahrplanjahr smallint DEFAULT NULL::smallint, p_app character varying DEFAULT NULL::character varying, p_load_id bigint DEFAULT NULL::bigint, p_importer_version character varying DEFAULT NULL::character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$ 
	
BEGIN
INSERT INTO cntrl.import_control (
	business_date_id, business_datetime_id, 
	business_num_id, business_text_id,app,fahrplanjahr,processing_start_time,
	processing_flag, comment, load_id,importer_version)
	VALUES (p_business_date_id, p_business_datetime_id, p_business_num_id, p_business_text_id, p_app, p_fahrplanjahr, clock_timestamp(),
	10, 'Load started', p_load_id, p_importer_version)
    ON CONFLICT ON CONSTRAINT uc_import_control_business DO UPDATE 
    SET load_id = p_load_id, processing_flag = 10, importer_version = p_importer_version, fahrplanjahr = p_fahrplanjahr, comment = 'Load started',
	    processing_start_time = clock_timestamp(),processing_end_time = clock_timestamp()
    WHERE cntrl.import_control.app = p_app
	      AND cntrl.import_control.business_date_id = p_business_date_id
		  ;	
END
 $$;


--
-- PostgreSQL database dump complete
--

