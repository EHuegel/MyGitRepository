CREATE TABLE public.fredleidis( 
    load_id			BIGINT       NOT NULL,
	fred_load_id	BIGINT		 NOT NULL,
	leidis_load_id	BIGINT		 NOT NULL,
	datenabzug		timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NOT NULL,
	fahrplanjahr	SMALLINT	 NOT NULL,
    betriebstag		timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NULL,
    fahrzeugnr		CHARACTER VARYING (50) NOT NULL,
    zuglauf_id		INT          NOT NULL,
    zug_nr			INT          NULL,
    start_zeit		timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NULL,
    end_zeit		timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NULL,
    start_ds100		CHARACTER VARYING (7)  NULL,
    end_ds100		CHARACTER VARYING (7)  NULL,
    fahrttyp		CHARACTER VARYING (7)  NULL,
    leidis_zugtyp	CHARACTER VARYING (3)  NULL,
    fahrzeugtyp		CHARACTER VARYING (3)  NULL,
	gps_fahrzeugnr	BIGINT		 NULL,
	has_fluegel		INT			 NULL,
	distanz			DOUBLE PRECISION		 NULL,
	is_overlapping	INT			 NULL,
	baureihe		CHARACTER VARYING(10)  NULL
)
PARTITION BY LIST (fahrplanjahr);

COMMENT ON COLUMN public.fredleidis.fahrzeugnr IS 'Falls keine Fahrzeugnr vorhanden ist: -';
COMMENT ON COLUMN public.fredleidis.gps_fahrzeugnr IS 'In GPS-Daten ist die Fahrzeugnr rein numerisch ohne Bindestriche, z.B. Fred 618019-95219-0, GPS 618019952190. Diese Spalte gibt es, um effizient mit GPS zu Joinen';
COMMENT ON COLUMN public.fredleidis.is_overlapping IS 'Hiermit markierte Eintraege besitzen einen anderen Eintrag mit der gleichen Fahrzeugnr und ueberschneidetem Zeitintervall';

CREATE TABLE public.fredleidis_2014 PARTITION OF public.fredleidis FOR VALUES IN ('2014');
CREATE INDEX ix_fredleidis_datenabzug_2014 ON public.fredleidis_2014 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2014 ON public.fredleidis_2014 (betriebstag ASC);

CREATE TABLE public.fredleidis_2015 PARTITION OF public.fredleidis FOR VALUES IN ('2015');
CREATE INDEX ix_fredleidis_datenabzug_2015 ON public.fredleidis_2015 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2015 ON public.fredleidis_2015 (betriebstag ASC);

CREATE TABLE public.fredleidis_2016 PARTITION OF public.fredleidis FOR VALUES IN ('2016');
CREATE INDEX ix_fredleidis_datenabzug_2016 ON public.fredleidis_2016 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2016 ON public.fredleidis_2016 (betriebstag ASC);

CREATE TABLE public.fredleidis_2017 PARTITION OF public.fredleidis FOR VALUES IN ('2017');
CREATE INDEX ix_fredleidis_datenabzug_2017 ON public.fredleidis_2017 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2017 ON public.fredleidis_2017 (betriebstag ASC);

CREATE TABLE public.fredleidis_2018 PARTITION OF public.fredleidis FOR VALUES IN ('2018');
CREATE INDEX ix_fredleidis_datenabzug_2018 ON public.fredleidis_2018 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2018 ON public.fredleidis_2018 (betriebstag ASC);

CREATE TABLE public.fredleidis_2019 PARTITION OF public.fredleidis FOR VALUES IN ('2019');
CREATE INDEX ix_fredleidis_datenabzug_2019 ON public.fredleidis_2019 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2019 ON public.fredleidis_2019 (betriebstag ASC);

CREATE TABLE public.fredleidis_2020 PARTITION OF public.fredleidis FOR VALUES IN ('2020');
CREATE INDEX ix_fredleidis_datenabzug_2020 ON public.fredleidis_2020 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2020 ON public.fredleidis_2020 (betriebstag ASC);

CREATE TABLE public.fredleidis_2021 PARTITION OF public.fredleidis FOR VALUES IN ('2021');
CREATE INDEX ix_fredleidis_datenabzug_2021 ON public.fredleidis_2021 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2021 ON public.fredleidis_2021 (betriebstag ASC);

CREATE TABLE public.fredleidis_2022 PARTITION OF public.fredleidis FOR VALUES IN ('2022');
CREATE INDEX ix_fredleidis_datenabzug_2022 ON public.fredleidis_2022 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2022 ON public.fredleidis_2022 (betriebstag ASC);

CREATE TABLE public.fredleidis_2023 PARTITION OF public.fredleidis FOR VALUES IN ('2023');
CREATE INDEX ix_fredleidis_datenabzug_2023 ON public.fredleidis_2023 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2023 ON public.fredleidis_2023 (betriebstag ASC);

CREATE TABLE public.fredleidis_2024 PARTITION OF public.fredleidis FOR VALUES IN ('2024');
CREATE INDEX ix_fredleidis_datenabzug_2024 ON public.fredleidis_2024 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2024 ON public.fredleidis_2024 (betriebstag ASC);

CREATE TABLE public.fredleidis_2025 PARTITION OF public.fredleidis FOR VALUES IN ('2025');
CREATE INDEX ix_fredleidis_datenabzug_2025 ON public.fredleidis_2025 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2025 ON public.fredleidis_2025 (betriebstag ASC);

CREATE TABLE public.fredleidis_2026 PARTITION OF public.fredleidis FOR VALUES IN ('2026');
CREATE INDEX ix_fredleidis_datenabzug_2026 ON public.fredleidis_2026 (datenabzug ASC);
CREATE INDEX ix_fredleidis_betriebstag_2026 ON public.fredleidis_2026 (betriebstag ASC);

