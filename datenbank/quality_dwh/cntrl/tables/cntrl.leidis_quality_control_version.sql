-- Table: cntrl.leidis_quality_control_version

-- DROP TABLE cntrl.leidis_quality_control_version;

CREATE TABLE cntrl.leidis_quality_control_version
(
    version_nr integer NOT NULL,
    fahrplanjahr_von smallint NOT NULL,
    fahrplanjahr_bis smallint NOT NULL,
    processing_flag integer NOT NULL,
    CONSTRAINT leidis_quality_control_version_pkey PRIMARY KEY (version_nr)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE cntrl.leidis_quality_control_version
    OWNER to t_quality_dwh_admin;

GRANT ALL ON TABLE cntrl.leidis_quality_control_version TO t_quality_dwh_admin;

GRANT SELECT ON TABLE cntrl.leidis_quality_control_version TO t_quality_dwh_r;

GRANT ALL ON TABLE cntrl.leidis_quality_control_version TO t_quality_dwh_rw;