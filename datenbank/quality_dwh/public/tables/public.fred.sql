CREATE TABLE public.fred( 
	load_id bigint NOT NULL,
	fahrplanjahr smallint NOT NULL,
	valid_from timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NOT NULL,
	valid_to timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NOT NULL,
	datenabzug timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NOT NULL,
	betriebstag date NULL,
	zugabnl character varying(50) NULL,
	zugnummer numeric(10, 0) NULL,
	leistung character varying(255) NULL,
	ab_plan timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NULL,
	an_plan timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NULL,
	ab_ist timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NULL,
	an_ist timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NULL,
	zusi character varying(50) NULL,
	fz_position numeric(10, 0) NULL,
	von character varying(50) NULL,
	nach character varying(50) NULL,
	strecke numeric(10, 0) NULL,
	kennung character varying(45) NULL,
	uic_code character varying(2) NULL,
	fahrzeugnr character varying(50) NULL,
	gattung_fred character varying(50) NULL,
	bauart_fred character varying(50) NULL,
	verbund character varying(50) NULL,
	lp_art character varying(10) NULL,
	lp_trans_bereich character varying(10) NULL,
	lp_tag numeric(10, 0) NULL,
	lp_nr character varying(10) NULL,
	laufplan_datum timestamptz DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NULL,
	lp_lb numeric(10, 0) NULL,
	heimat_bw character varying(50) NULL,
	bs_fzeinsatz character varying(45) NULL,
	bs_name character varying(45) NULL,
	bsnr_mieter character varying(45) NULL,
	bs_name_mieter character varying(45) NULL,
	kz_zugnr_verg character varying(45) NULL,
	kz_leist_verg character varying(45) NULL,
	gps_fahrzeugnr bigint NULL,
	baureihe character varying(10) NULL
)
PARTITION BY LIST (fahrplanjahr);

CREATE TABLE public.fred_2014 PARTITION OF public.fred FOR VALUES IN ('2014');
CREATE INDEX ix_fred_valid_to_2014 ON public.fred_2014 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2014 ON public.fred_2014 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2014 ON public.fred_2014 (betriebstag ASC);

CREATE TABLE public.fred_2015 PARTITION OF public.fred FOR VALUES IN ('2015');
CREATE INDEX ix_fred_valid_to_2015 ON public.fred_2015 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2015 ON public.fred_2015 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2015 ON public.fred_2015 (betriebstag ASC);

CREATE TABLE public.fred_2016 PARTITION OF public.fred FOR VALUES IN ('2016');
CREATE INDEX ix_fred_valid_to_2016 ON public.fred_2016 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2016 ON public.fred_2016 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2016 ON public.fred_2016 (betriebstag ASC);

CREATE TABLE public.fred_2017 PARTITION OF public.fred FOR VALUES IN ('2017');
CREATE INDEX ix_fred_valid_to_2017 ON public.fred_2017 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2017 ON public.fred_2017 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2017 ON public.fred_2017 (betriebstag ASC);

CREATE TABLE public.fred_2018 PARTITION OF public.fred FOR VALUES IN ('2018');
CREATE INDEX ix_fred_valid_to_2018 ON public.fred_2018 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2018 ON public.fred_2018 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2018 ON public.fred_2018 (betriebstag ASC);

CREATE TABLE public.fred_2019 PARTITION OF public.fred FOR VALUES IN ('2019');
CREATE INDEX ix_fred_valid_to_2019 ON public.fred_2019 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2019 ON public.fred_2019 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2019 ON public.fred_2019 (betriebstag ASC);

CREATE TABLE public.fred_2020 PARTITION OF public.fred FOR VALUES IN ('2020');
CREATE INDEX ix_fred_valid_to_2020 ON public.fred_2020 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2020 ON public.fred_2020 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2020 ON public.fred_2020 (betriebstag ASC);

CREATE TABLE public.fred_2021 PARTITION OF public.fred FOR VALUES IN ('2021');
CREATE INDEX ix_fred_valid_to_2021 ON public.fred_2021 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2021 ON public.fred_2021 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2021 ON public.fred_2021 (betriebstag ASC);

CREATE TABLE public.fred_2022 PARTITION OF public.fred FOR VALUES IN ('2022');
CREATE INDEX ix_fred_valid_to_2022 ON public.fred_2022 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2022 ON public.fred_2022 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2022 ON public.fred_2022 (betriebstag ASC);

CREATE TABLE public.fred_2023 PARTITION OF public.fred FOR VALUES IN ('2023');
CREATE INDEX ix_fred_valid_to_2023 ON public.fred_2023 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2023 ON public.fred_2023 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2023 ON public.fred_2023 (betriebstag ASC);

CREATE TABLE public.fred_2024 PARTITION OF public.fred FOR VALUES IN ('2024');
CREATE INDEX ix_fred_valid_to_2024 ON public.fred_2024 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2024 ON public.fred_2024 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2024 ON public.fred_2024 (betriebstag ASC);

CREATE TABLE public.fred_2025 PARTITION OF public.fred FOR VALUES IN ('2025');
CREATE INDEX ix_fred_valid_to_2025 ON public.fred_2025 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2025 ON public.fred_2025 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2025 ON public.fred_2025 (betriebstag ASC);

CREATE TABLE public.fred_2026 PARTITION OF public.fred FOR VALUES IN ('2026');
CREATE INDEX ix_fred_valid_to_2026 ON public.fred_2026 (valid_to ASC);
CREATE INDEX ix_fred_datenabzug_2026 ON public.fred_2026 (datenabzug ASC);
CREATE INDEX ix_fred_betriebstag_2026 ON public.fred_2026 (betriebstag ASC);


