-- Table: cntrl.leidis_quality_control_parameters

-- DROP TABLE cntrl.leidis_quality_control_parameters;

CREATE TABLE cntrl.leidis_quality_control_parameters
(
    version_nr integer NOT NULL,
    wochentag character varying(50) COLLATE pg_catalog."default" NOT NULL,
    produkt character varying(50) COLLATE pg_catalog."default" NOT NULL,
    control_type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    control_value double precision NOT NULL,
    untergrenze_gruen double precision NOT NULL,
    obergrenze_gruen double precision NOT NULL,
    untergrenze_gelb double precision NOT NULL,
    obergrenze_gelb double precision NOT NULL,
    anzahl_codierung bigint,
    processing_flag integer NOT NULL,
    CONSTRAINT leidis_quality_control_parameters_pkey PRIMARY KEY (version_nr, wochentag, produkt, control_type)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE cntrl.leidis_quality_control_parameters
    OWNER to t_quality_dwh_admin;

GRANT ALL ON TABLE cntrl.leidis_quality_control_parameters TO t_quality_dwh_admin;

GRANT SELECT ON TABLE cntrl.leidis_quality_control_parameters TO t_quality_dwh_r;

GRANT ALL ON TABLE cntrl.leidis_quality_control_parameters TO t_quality_dwh_rw;