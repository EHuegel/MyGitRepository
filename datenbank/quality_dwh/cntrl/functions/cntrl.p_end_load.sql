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
-- Name: p_end_load(character varying, bigint, integer, integer, integer, character varying); Type: FUNCTION; Schema: cntrl; Owner: -
--

CREATE FUNCTION cntrl.p_end_load(p_app character varying, p_load_id bigint, p_processing_flag integer, p_rows_processed integer, p_source_load_id integer, p_comment character varying DEFAULT 'Ladelauf beendet'::character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$ 
	
BEGIN
UPDATE cntrl.import_control
	   SET
		 source_load_id = p_source_load_id
			   ,processing_end_time = clock_timestamp()
			   ,rows_processed = p_rows_processed 
			   ,comment = p_comment    
			   ,processing_flag = p_processing_flag
	  WHERE load_id = p_load_id;
END
 $$;


--
-- PostgreSQL database dump complete
--

