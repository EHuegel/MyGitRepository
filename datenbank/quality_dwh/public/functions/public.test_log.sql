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
-- Name: test_log(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.test_log(v_critical_info text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_sql text;
    v_con_count int;
BEGIN
    SELECT count(1) INTO v_con_count FROM dblink_get_connections() 
         WHERE dblink_get_connections@>'{myconn}';
    IF v_con_count = 0 THEN
        PERFORM dblink_connect('myconn', 'logger');
    END IF;
    
    v_sql := format('INSERT INTO execution_log (
		log_app,
		load_id,
		db_name,
		procedure_name,
		log_level,
		log_message
   )
   VALUES (
  		''test'',
  		-1,
  		''quality_dwh'',
      ''test_log'',
      ''I'',
       ''%s''
   )', v_critical_info);
    PERFORM dblink_exec('myconn', v_sql);
	--PERFORM dblink_disconnect('myconn1');
END;
$$;


--
-- PostgreSQL database dump complete
--

