CREATE OR REPLACE FUNCTION gps.f_<function_name>(
    p_ts_<name> TIMESTAMP WITH TIME ZONE DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin'),
    p_num_<name> bigint,
    p_text_param_<name> VARCHAR
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$

/* **********************************************************************

<description>
    
*************************************************************************
Sample
======

DO $$
    BEGIN
        PERFORM gps.f_<function_name>();
    END; 
$$;

*/

DECLARE
    
    -- local variables 
    /*
        Loakel Variablen hierhin....
        l_loadid 		  bigint = (SELECT loadid FROM gps.cntrl_import_control WHERE datentag = p_datentag);
        l_fahrplanjahr	  int    = (SELECT * FROM public.f_get_fahrplanjahr(p_datentag));

    */
    -- Logging
    l_log_record          log.execution_log%rowtype;
    
    -- meta data
    l_db_name             CHARACTER VARYING = (SELECT current_database());
    l_app_name            VARCHAR(50) = '<app_name>';
    
    -- profiling 
    l_start_time          TIMESTAMP WITH TIME ZONE DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') ;
    l_end_time            TIMESTAMP WITH TIME ZONE DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') ;	
    l_duration            BIGINT;

    l_row_count           BIGINT = 0;
    l_row_count_all       BIGINT = 0;

    -- stack trace
    l_stack_msg           text;
    l_stack_detail        text;
    l_stack_hint          text;
    l_stack_sqlstate      text;
    l_stack               text;

BEGIN
    -- Logging initialisieren
    SELECT INTO l_log_record
         * FROM log.p_init_log(l_app_name,l_db_name,0) ;
   
    GET DIAGNOSTICS l_stack = PG_CONTEXT;
    l_log_record.procedure_name = substring(l_stack from 'function (.*?) line'); -- Get function name from call-stack
   
    -- Info l_log_record schreiben 	 
    l_log_record.log_message = format('Start %s', l_log_record.procedure_name);
    PERFORM log.p_log_info(l_log_record);

    -- Parameter loggen
    PERFORM log.p_log_ts_param(l_log_record, 'p_ts_<name>', p_ts_<name>);
    PERFORM log.p_log_numeric_param(l_log_record, 'p_num_<name>', p_num_<name>);
    PERFORM log.p_log_numeric_param(l_log_record, 'p_text_<name>', p_text_param_<name>);
    
    /*
    PERFORM log.p_log_numeric_param(l_log_record, 'l_loadid', l_loadid);
    PERFORM log.p_log_numeric_param(l_log_record, 'l_fahrplanjahr', l_fahrplanjahr);

    */

    -- Info l_log_record schreiben 	 
    l_log_record.log_message = format('<....>');
    PERFORM log.p_log_info(l_log_record);
 
    l_start_time = clock_timestamp();	 
   
    /* -----------------------------------------------------------------------------------------------------------

    Code hierhin!

    -------------------------------------------------------------------------------------------------------------*/

    GET DIAGNOSTICS l_row_count = ROW_COUNT;
    
    -- Calculating of runtime stats 
    l_end_time = clock_timestamp();		
    l_duration = extract(epoch from l_end_time) - extract(epoch from l_start_time);	
    l_row_count_all = l_row_count_all + l_row_count;
    
    l_log_record.rows_processed = l_row_count;
    l_log_record.execution_time_in_s = l_duration;
    
    l_log_record.log_message = format('<....>');
    PERFORM log.p_log_execution(l_log_record);

    l_log_record.log_message = NULL;
    l_log_record.rows_processed  = NULL;
    l_log_record.execution_time_in_s = NULL;

    l_start_time = clock_timestamp();

    EXCEPTION WHEN others THEN

           GET STACKED DIAGNOSTICS l_stack_msg = MESSAGE_TEXT,
                                   l_stack_detail = PG_EXCEPTION_CONTEXT,
                                   l_stack_sqlstate = RETURNED_SQLSTATE;

           l_stack = 'Fehlermeldung: ' || l_stack_msg || ' Detail: ' || l_stack_detail || ' SQLSTATE: ' || l_stack_sqlstate ;

           l_log_record.log_message = l_stack;

           l_log_record.rows_processed = 0;
           l_log_record.execution_time_in_s = 0;

           PERFORM log.p_log_error(l_log_record);

           --CLOSE db_cursor;
           RAISE EXCEPTION E'--- Call Stack ---\n%', l_stack;


END;
$function$
;
