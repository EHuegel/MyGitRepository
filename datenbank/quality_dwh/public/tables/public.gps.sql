CREATE TABLE public.gps_raw(
	load_id bigint NOT NULL,
	datentag date NOT NULL,
	fahrplanjahr smallint NOT NULL,
	messzeitpunkt TIMESTAMP WITH TIME ZONE DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NOT NULL,
	zug_nr int NULL,
	gps_fahrzeugnr bigint NOT NULL,
	fahrzeugnr varchar(50) NULL,
	gps_breite float NULL,
	gps_laenge float NULL,
	gps_geschwindigkeit float NULL,
	gps_richtung float NULL,
	naechste_bst_ds_100 varchar(7) NULL,
	distanz_naechste_bst float NULL,
	baureihe varchar(10) NULL
)
PARTITION BY LIST (fahrplanjahr);

CREATE TABLE public.gps_raw_2014 PARTITION OF public.gps_raw FOR VALUES IN ('2014');
CREATE INDEX ix_gps_datentag_2014 ON public.gps_raw_2014 (datentag ASC);
CREATE INDEX ix_gps_fahrzeugnr_messzeitpunkt_2014 ON public.gps_raw_2014(	gps_fahrzeugnr ASC,	messzeitpunkt ASC);

CREATE TABLE public.gps_raw_2015 PARTITION OF public.gps_raw FOR VALUES IN ('2015');
CREATE INDEX ix_gps_datentag_2015 ON public.gps_raw_2015 (datentag ASC);
CREATE INDEX ix_gps_fahrzeugnr_messzeitpunkt_2015 ON public.gps_raw_2015(	gps_fahrzeugnr ASC,	messzeitpunkt ASC);

CREATE TABLE public.gps_raw_2016 PARTITION OF public.gps_raw FOR VALUES IN ('2016');
CREATE INDEX ix_gps_datentag_2016 ON public.gps_raw_2016 (datentag ASC);
CREATE INDEX ix_gps_fahrzeugnr_messzeitpunkt_2016 ON public.gps_raw_2016(	gps_fahrzeugnr ASC,	messzeitpunkt ASC);

CREATE TABLE public.gps_raw_2017 PARTITION OF public.gps_raw FOR VALUES IN ('2017');
CREATE INDEX ix_gps_datentag_2017 ON public.gps_raw_2017 (datentag ASC);
CREATE INDEX ix_gps_fahrzeugnr_messzeitpunkt_2017 ON public.gps_raw_2017(	gps_fahrzeugnr ASC,	messzeitpunkt ASC);

CREATE TABLE public.gps_raw_2018 PARTITION OF public.gps_raw FOR VALUES IN ('2018');
CREATE INDEX ix_gps_datentag_2018 ON public.gps_raw_2018 (datentag ASC);
CREATE INDEX ix_gps_fahrzeugnr_messzeitpunkt_2018 ON public.gps_raw_2018(	gps_fahrzeugnr ASC,	messzeitpunkt ASC);

CREATE TABLE public.gps_raw_2019 PARTITION OF public.gps_raw FOR VALUES IN ('2019');
CREATE INDEX ix_gps_datentag_2019 ON public.gps_raw_2019 (datentag ASC);
CREATE INDEX ix_gps_fahrzeugnr_messzeitpunkt_2019 ON public.gps_raw_2019(	gps_fahrzeugnr ASC,	messzeitpunkt ASC);

CREATE TABLE public.gps_raw_2020 PARTITION OF public.gps_raw FOR VALUES IN ('2020');
CREATE INDEX ix_gps_datentag_2020 ON public.gps_raw_2020 (datentag ASC);
CREATE INDEX ix_gps_fahrzeugnr_messzeitpunkt_2020 ON public.gps_raw_2020(	gps_fahrzeugnr ASC,	messzeitpunkt ASC);

-- grant all on table public.gps to t_quality_dwh_rw;