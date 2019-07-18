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
-- Name: p_log_execution(log.execution_log); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.p_log_execution(r log.execution_log) RETURNS void
    LANGUAGE plpgsql
    AS $$ 	

declare
	log_level CHAR(1) = 'I';
    msg       TEXT    = r.log_message || '; duration = ' || CAST(r.execution_time_s AS VARCHAR) || 's; row_count = ' || CAST(r.rows_processed AS VARCHAR);
    v_sql text;
    v_con_count int;	
	v_load_id bigint = coalesce(r.load_id,-1); 
begin	
	-- Neuer Eintrag im Exectuion-Log
	--
	SELECT count(1) INTO v_con_count FROM dblink_get_connections() 
         WHERE dblink_get_connections@>'{myconn}';
    IF v_con_count = 0 THEN
        PERFORM dblink_connect('myconn', 'logger');
    END IF;
	
	v_sql := format(
	 'INSERT INTO execution_log (
		log_app,
		load_id,
		db_name, 
		procedure_name, 
		log_level,
		execution_time_in_s, 
		rows_processed, 
		log_message
    )
      VALUES (
	   ''%s'',
  	   %s,
  	   ''%s'', 
       ''%s'', 
	   ''%s'',
	   ''%s'', 
       %s, 
       ''%s'' 	
  	  )',r.log_app,
  		 v_load_id,
  		 r.db_name, 
         r.procedure_name, 
         log_level, -- use local log_level 
         r.execution_time_in_s, 
         r.rows_processed, 
         r.log_message
   );
  
   -- Ausgabe der Information auf der Console/Server-Log
   --
   raise notice '%', v_sql;
   --PERFORM dblink_exec('myconn', v_sql);
   raise INFO '%',msg;
  
end
 $$;


--
-- PostgreSQL database dump complete
--

