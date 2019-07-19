-- Extensions
-- ---------------------------------------------------------------------
--\i ./extensions/dblink.sql
--\i ./extensions/pg_stat_statements.sql
--\i ./extensions/postgres_fdw.sql

-- public
-- ---------------------------------------------------------------------
\echo 'Create database quality_dwh'
---- Tables
\i ./public/tables/public.gps.sql
\i ./public/tables/public.fred.sql
\i ./public/tables/public.fredleidis.sql
\i ./public/tables/public.execution_log.sql

\i ./public/tables/public.leidis_zuglauf.sql

\i ./public/tables/public.leidis_zuglaufmeldungen.sql

\i ./public/tables/public.leidis_zuglaufverspaetungsmeldungen.sql

\i ./public/tables/public.leidis_zuglaufstoerfaelle.sql
\i ./public/tables/public.zuglaufpositionsmeldungen.sql
\i ./public/tables/public.zuglaufpositionsmeldungen_vzgv.sql

\i ./public/tables/public.gfd_zugrouten.sql

\i ./public/tables/public.la_langsamfahrstellen.sql

---- Functions

-- log
---------------------------------------------------------------------
-- Schema
-- \i ./log/log.sql

-- Types
-- \i ./log/types/log.execution_log.sql
-- \i ./log/types/log.t_execution_log.sql

-- Tables
-- \i ./log/functions/log.p_init_log.sql
-- \i ./log/functions/log.p_log_error.sql
-- \i ./log/functions/log.p_log_execution.sql
-- \i ./log/functions/log.p_log_info.sql
-- \i ./log/functions/log.p_log_param.sql

-- CNTRL 
-- ---------------------------------------------------------------------
---- Schema
\i ./cntrl/cntrl.sql

---- Tables
\i ./cntrl/tables/cntrl.import_control.sql
\i ./cntrl/tables/cntrl.leidis_quality_control.sql
\i ./cntrl/tables/cntrl.leidis_quality_control_parameters.sql
\i ./cntrl/tables/cntrl.leidis_quality_control_parameters_jahr.sql
\i ./cntrl/tables/cntrl.leidis_quality_control_version.sql

---- Functions
\i ./cntrl/functions/cntrl.p_get_new_load_id.sql
\i ./cntrl/functions/cntrl.p_leidis_process_betriebstag.sql
\i ./cntrl/functions/cntrl.p_start_load.sql

-- META 
-- ---------------------------------------------------------------------
---- Schema
\i ./meta/meta.sql

---- Tables
\i ./meta/tables/meta.visum_strecken.sql
\i ./meta/tables/meta.visum_strecken_2014.sql
\i ./meta/tables/meta.visum_strecken_2015.sql
\i ./meta/tables/meta.visum_strecken_2016.sql
\i ./meta/tables/meta.visum_strecken_2017.sql
\i ./meta/tables/meta.visum_strecken_2018.sql
\i ./meta/tables/meta.visum_strecken_2019.sql
\i ./meta/tables/meta.visum_strecken_2020.sql

\i ./meta/tables/meta.visum_knoten.sql
\i ./meta/tables/meta.visum_streckenpoly.sql
\i ./meta/tables/meta.visum_abbiegebeziehungen.sql
\i ./meta/tables/meta.fred_mapping_fahrzeugnr.sql


-- Grants
--------------------------------------------------------------------------
\i ./grants.sql

-- Custom
--------------------------------------------------------------------------
\i ./custom.sql
\echo 'Done with quality_dwh'

Test
Test2
