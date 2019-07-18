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
-- Name: p_leidis_maintain_import_control(); Type: FUNCTION; Schema: cntrl; Owner: -
--

CREATE FUNCTION cntrl.p_leidis_maintain_import_control() RETURNS void
    LANGUAGE plpgsql
    AS $$ 	
DECLARE
    msg                 VARCHAR(500); 	
	db_id               character varying;
	app                 VARCHAR(50) = 'leidis';
	start_time          TIMESTAMP WITH TIME ZONE DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') ;
	business_date_id	DATE;
	fahrplanjahr		INT;
	importer_id		    character varying;
	log                 execution_log%rowtype;
	-- stack
	stack_msg           text;
    stack_detail        text;
    stack_hint          text; 
    stack_sqlstate      text;
    stack               text;
	
	db_cursor CURSOR for
	   (SELECT iz.betriebstag
		FROM stage.ext_importer_zuglauf iz
			LEFT JOIN cntrl.import_control s ON (
				iz.betriebstag = s.business_date_id
				AND iz.source_load_id = s.source_load_id
				AND s.processing_flag = 100
			)
		WHERE s.load_id IS NULL
		GROUP BY iz.betriebstag
		ORDER BY iz.betriebstag);
	
BEGIN	

    select max(dbid) from pg_stat_statements where query like '%maintain_import%' into db_id ;
    start_time = clock_timestamp();	
	Select into log 
	     * from log.p_init_log('leidis',db_id,0) ;
	-- Info log schreiben 	 
	log.log_time = clock_timestamp();
	log.log_message = 'Maintain Import Control started';
	Perform log.p_log_info(log);	
    --    Open cursor 
	Open db_cursor;
	--    Fetch cursor
	LOOP
    -- fetch cursor
      FETCH db_cursor INTO business_date_id,fahrplanjahr,importer_id;
    -- exit when no more row to fetch
      EXIT WHEN NOT FOUND;
	  
	  BEGIN
	   PERFORM cntrl.p_start_load( 
             CAST(business_date_id as date)
	        ,CAST(NULL as timestamp with time zone)
	        ,CAST(NULL as numeric)
	        ,CAST(NULL as character varying) 
	        ,CAST(fahrplanjahr as smallint)
	        ,CAST(app as character varying)
	        ,CAST(NULL as bigint)
	        ,CAST(importer_id as character varying)
	        ); 
		EXCEPTION WHEN others THEN	       
	       GET STACKED DIAGNOSTICS stack_msg = MESSAGE_TEXT,
                                    stack_detail = PG_EXCEPTION_CONTEXT,						  
                                    stack_sqlstate = RETURNED_SQLSTATE;
           stack = 'Fehlermeldung: ' || stack_msg || ' Detail: ' || stack_detail || ' SQLSTATE: ' || stack_sqlstate ;							  
           RAISE EXCEPTION E'--- Call Stack ---\n%', stack;
	       log.log_message = stack;
		   log.log_time = clock_timestamp();
	       log.rows_processed = 0;
	       log.execution_time_in_s = 0;	   
	       Perform log.p_log_error(log);	
		END;
	END LOOP;
	Close db_cursor;
END
$$;


--
-- PostgreSQL database dump complete
--

