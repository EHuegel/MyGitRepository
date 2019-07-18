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

--
-- Name: execution_log; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.execution_log (
    log_app character varying(50) NOT NULL,
    load_id bigint NOT NULL,
    db_name name NOT NULL,
    procedure_name name NOT NULL,
    id bigint NOT NULL,
    log_time timestamp with time zone DEFAULT timezone('Europe/Berlin'::text, CURRENT_TIMESTAMP) NOT NULL,
    log_level character(1) NOT NULL,
    log_message text NOT NULL,
    rows_processed bigint,
    execution_time_in_s bigint
)
SERVER pg_cluster_quality_dwh_log
OPTIONS (
    schema_name 'public',
    table_name 'execution_log'
);


--
-- PostgreSQL database dump complete
--

