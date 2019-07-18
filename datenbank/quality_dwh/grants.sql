-- Grants quality_dwh

-- schema public
--------------------------------------------------------------------------------------
GRANT ALL ON ALL TABLES IN SCHEMA public TO t_quality_dwh_rw;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO t_quality_dwh_r;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO t_quality_dwh_rw;
-- in public sind Functions von postgres, die nicht gegranted werden koennen
-- GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO t_quality_dwh_rw;

-- schema cntrl
--------------------------------------------------------------------------------------
GRANT ALL ON ALL TABLES IN SCHEMA cntrl TO t_quality_dwh_rw;
GRANT SELECT ON ALL TABLES IN SCHEMA cntrl TO t_quality_dwh_r;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA cntrl TO t_quality_dwh_rw;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA cntrl TO t_quality_dwh_rw;

-- schema meta
---------------------------------------------------------------------------------------
-- usage on schema
GRANT ALL ON ALL TABLES IN SCHEMA meta TO t_quality_dwh_rw;
GRANT SELECT ON ALL TABLES IN SCHEMA meta TO t_quality_dwh_r;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA meta TO t_quality_dwh_rw;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA meta TO t_quality_dwh_rw;
