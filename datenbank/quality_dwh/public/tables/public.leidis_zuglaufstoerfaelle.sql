-- DROP TABLE public.leidis_zuglaufstoerfaelle

CREATE TABLE public.leidis_zuglaufstoerfaelle (
	fahrplanjahr int4 NOT NULL,
	betriebstag date NOT NULL,
	load_id int8 NOT NULL,
	niederlassung varchar(3) NULL,
	stoerfall_nr int4 NULL,
	betriebsstelle varchar(7) NULL,
	betroffene_nl varchar(20) NULL,
	stoerungsbeginn timestamp with time zone NULL,
	stoerungsende timestamp with time zone NULL,
	verspaetungsursache int4 NULL,
	verursacher_zugnummer varchar(9) NULL,
	anzahl_zuglaeufe int4 NULL,
	summe_verspaetungen int4 NULL	
)   PARTITION BY LIST (fahrplanjahr)
;
-- Partitions 

CREATE TABLE public.leidis_zuglaufstoerfaelle_2018 PARTITION OF public.leidis_zuglaufstoerfaelle FOR VALUES IN (2018);
CREATE TABLE public.leidis_zuglaufstoerfaelle_2019 PARTITION OF public.leidis_zuglaufstoerfaelle FOR VALUES IN (2019);
CREATE TABLE public.leidis_zuglaufstoerfaelle_2020 PARTITION OF public.leidis_zuglaufstoerfaelle FOR VALUES IN (2020);

-- Indices 

CREATE INDEX ix_leidis_zuglaufstoerfaelle_betriebstag_2018
    ON public.leidis_zuglaufstoerfaelle_2018 USING btree(betriebstag);
CREATE INDEX ix_leidis_zuglaufstoerfaelle_betriebstag_2019
    ON public.leidis_zuglaufstoerfaelle_2019 USING btree(betriebstag);	
CREATE INDEX ix_leidis_zuglaufstoerfaelle_betriebstag_2020
    ON public.leidis_zuglaufstoerfaelle_2020 USING btree(betriebstag);	