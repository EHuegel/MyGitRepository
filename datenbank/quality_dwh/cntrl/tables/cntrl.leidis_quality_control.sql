-- Table: cntrl.leidis_quality_control

-- DROP TABLE cntrl.leidis_quality_control;

CREATE TABLE cntrl.leidis_quality_control
(
    load_id bigint NOT NULL,
    produkt character varying(50) COLLATE pg_catalog."default" NOT NULL,
    kpi_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    kpi_value double precision NOT NULL,
    kpi_value_class character varying(50) COLLATE pg_catalog."default" NOT NULL,
    id bigint NOT NULL,
    comment character varying(255) COLLATE pg_catalog."default",
    is_approved integer,
    betriebstag date,
    version_nr bigint,
    CONSTRAINT leidis_quality_control_pkey PRIMARY KEY (load_id, produkt, kpi_name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE cntrl.leidis_quality_control
    OWNER to t_quality_dwh_admin;

