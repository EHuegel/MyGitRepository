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
-- Name: p_leidis_process_betriebstag(date); Type: FUNCTION; Schema: cntrl; Owner: -
--

CREATE FUNCTION cntrl.p_leidis_process_betriebstag(p_betriebstag date) RETURNS void
    LANGUAGE plpgsql
    AS $$ 	
DECLARE
	msg             VARCHAR(500);
	db_id           character varying;
	app             VARCHAR(50) = 'leidis';
	row_count1      BIGINT = 0;
	row_count_all   BIGINT = 0;
	start_time      TIMESTAMP WITH TIME ZONE DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') ;
	end_time        TIMESTAMP WITH TIME ZONE DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') ;
	duration        BIGINT;
	fahrplanjahr    INT;
	log             execution_log%rowtype; 	
	-- Test
	p_load_id         BIGINT;
	p_source_load_id  BIGINT;
	p_fahrplanjahr    INT = 2019;
	-- stack
	stack_msg          text;
    stack_detail       text;
    stack_hint         text; 
    stack_sqlstate     text;
    stack              text;  	
	
BEGIN

    select max(dbid) from pg_stat_statements where query like '%process_betriebstag%' into db_id ;
    start_time = clock_timestamp();	
	Select into log 
	     * from log.p_init_log('leidis',db_id,p_load_id) ; 
	-- log parameters	 
	log.procedure_name = 'p_leidis_process_betriebstag';
	Perform log.p_log_param(log,'p_betriebstag',Null,p_betriebstag,Null);
	-- get new load_id
	Select cntrl.p_get_new_load_id() into p_load_id;
	
	Select stage.p_leidis_get_source_load_id(p_betriebstag) into p_source_load_id;
	
	-- Laden eines Betriebstages: 1. clear 2. load
	
	log.log_time = clock_timestamp();
	log.log_message = 'Loading leidis data for betriebstag = ' || CAST(p_betriebstag AS VARCHAR) || ' started';
	Perform log.p_log_info(log);
	
	-- Transaction p_leidis_clear_betriebstag starten
	BEGIN	  
	   Perform stage.p_leidis_clear_betriebstag(p_load_id,p_fahrplanjahr,p_betriebstag);
	   -- SELECT 1/0;     test Error
	   EXCEPTION WHEN others THEN	       
	   GET STACKED DIAGNOSTICS stack_msg = MESSAGE_TEXT,
                               stack_detail = PG_EXCEPTION_CONTEXT,						  
                               stack_sqlstate = RETURNED_SQLSTATE;
       stack = 'Fehlermeldung: ' || stack_msg || ' Detail: ' || stack_detail || ' SQLSTATE: ' || stack_sqlstate ;							  
       RAISE NOTICE E'--- Call Stack ---\n%', stack;
	   log.log_message = stack;
	   log.rows_processed = 0;
	   log.execution_time_in_s = 0;	   
	   Perform log.p_log_error(log);
    END;
	-- Transaction p_leidis_load_betriebstag starten
	BEGIN	  
	   Select stage.p_leidis_load_betriebstag(p_load_id,p_source_load_id,p_betriebstag) into row_count_all;
	   -- SELECT 1/0;     test Error
	   EXCEPTION WHEN others THEN	       
	   GET STACKED DIAGNOSTICS stack_msg = MESSAGE_TEXT,
                               stack_detail = PG_EXCEPTION_CONTEXT,						  
                               stack_sqlstate = RETURNED_SQLSTATE;
       stack = 'Fehlermeldung: ' || stack_msg || ' Detail: ' || stack_detail || ' SQLSTATE: ' || stack_sqlstate ;							  
       RAISE NOTICE E'--- Call Stack ---\n%', stack;
	   log.log_message = stack;
	   log.rows_processed = 0;
	   log.execution_time_in_s = 0;	   
	   Perform log.p_log_error(log);
    END; 
	
	log.log_message = 'Loading leidis data for betriebstag = ' || CAST(p_betriebstag AS VARCHAR) || ' ended';
	end_time = clock_timestamp();	
	duration = extract(epoch from end_time) - extract(epoch from start_time);	
	log.rows_processed = row_count_all;
	raise notice 'row_count_all: %',row_count_all;
	raise notice 'duration: %',duration;
	log.execution_time_in_s = duration;
	Perform log.p_log_execution(log);
		     
	RAISE EXCEPTION E'--- Call Stack ---\n%', stack;
END
$$;


--
-- PostgreSQL database dump complete
--

