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
-- Name: p_get_new_load_id(); Type: FUNCTION; Schema: cntrl; Owner: -
--

CREATE FUNCTION cntrl.p_get_new_load_id() RETURNS bigint
    LANGUAGE plpgsql
    AS $$ 
	
DECLARE
	p_load_id     BIGINT;
	
BEGIN

    SELECT  NEXTVAL('cntrl.sq_load_id') into p_load_id;	
	Return p_load_id;
	
END
 $$;


--
-- PostgreSQL database dump complete
--

