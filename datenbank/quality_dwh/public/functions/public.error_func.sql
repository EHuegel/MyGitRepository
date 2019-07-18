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
-- Name: error_func(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.error_func() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  stack_msg          text;
  stack_detail       text;
  stack_sqlstate     text;
  stack              text;  
BEGIN
  GET STACKED DIAGNOSTICS stack_msg = MESSAGE_TEXT,
                          stack_detail = PG_EXCEPTION_CONTEXT,
                          stack_sqlstate = RETURNED_SQLSTATE;
  stack = 'Fehlermeldung: ' || stack_msg || ' Detail: ' || stack_detail || ' SQLSTATE: ' || stack_sqlstate ;							  
  RAISE NOTICE E'--- Call Stack ---\n%', stack;
  RETURN 1;
END;
$$;


--
-- PostgreSQL database dump complete
--

