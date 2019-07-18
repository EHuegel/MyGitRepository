CREATE TABLE public.gps_leidis_zuglaufpositionsmeldungen_vzgv (
    fahrplanjahr            SMALLINT                       NOT NULL,
    datentag                DATE                           NOT NULL,
    source_load_id          BIGINT                         NOT NULL,
    load_id                 BIGINT                         NOT NULL,
    zuglauf_id              INT                            NOT NULL,
    von_knoten              INT                            NOT NULL,
    nach_knoten             INT                            NOT NULL,
    messzeitpunkt           TIMESTAMP WITH TIME ZONE       NOT NULL DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin'),
    gps_index               BIGINT                         NOT NULL,
    geschwindigkeit         float8                         NULL,
    km                      FLOAT                          NULL,
    strecken_nr             INT                            NULL,
    vzg_geschwindigkeit     INT                            NULL
) PARTITION BY LIST (fahrplanjahr)
;

-- Partitions 
CREATE TABLE public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2014 PARTITION OF public.gps_leidis_zuglaufpositionsmeldungen_vzgv FOR VALUES IN (2014); 
CREATE TABLE public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2015 PARTITION OF public.gps_leidis_zuglaufpositionsmeldungen_vzgv FOR VALUES IN (2015);
CREATE TABLE public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2016 PARTITION OF public.gps_leidis_zuglaufpositionsmeldungen_vzgv FOR VALUES IN (2016);
CREATE TABLE public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2017 PARTITION OF public.gps_leidis_zuglaufpositionsmeldungen_vzgv FOR VALUES IN (2017);
CREATE TABLE public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2018 PARTITION OF public.gps_leidis_zuglaufpositionsmeldungen_vzgv FOR VALUES IN (2018);
CREATE TABLE public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2019 PARTITION OF public.gps_leidis_zuglaufpositionsmeldungen_vzgv FOR VALUES IN (2019);
CREATE TABLE public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2020 PARTITION OF public.gps_leidis_zuglaufpositionsmeldungen_vzgv FOR VALUES IN (2020);

-- Indizes

/*alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2014 add  primary key (fahrplanjahr,zuglauf_id,idx); 
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2015 add  primary key (fahrplanjahr,zuglauf_id,idx); 
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2016 add  primary key (fahrplanjahr,zuglauf_id,idx); 
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2017 add  primary key (fahrplanjahr,zuglauf_id,idx); 
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2018 add  primary key (fahrplanjahr,zuglauf_id,idx); 
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2019 add  primary key (fahrplanjahr,zuglauf_id,idx); 
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2020 add  primary key (fahrplanjahr,zuglauf_id,idx); 

alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2014 add  foreign key (fahrplanjahr,zuglauf_id,idx) references public.zuglaufmeldungen_2014(fahrplanjahr,zuglauf_id,idx) ; 
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2015 add  foreign key (fahrplanjahr,zuglauf_id,idx) references public.zuglaufmeldungen_2015(fahrplanjahr,zuglauf_id,idx) ; 
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2016 add  foreign key (fahrplanjahr,zuglauf_id,idx) references public.zuglaufmeldungen_2016(fahrplanjahr,zuglauf_id,idx) ;
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2017 add  foreign key (fahrplanjahr,zuglauf_id,idx) references public.zuglaufmeldungen_2017(fahrplanjahr,zuglauf_id,idx) ;
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2018 add  foreign key (fahrplanjahr,zuglauf_id,idx) references public.zuglaufmeldungen_2018(fahrplanjahr,zuglauf_id,idx) ; 
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2019 add  foreign key (fahrplanjahr,zuglauf_id,idx) references public.zuglaufmeldungen_2019(fahrplanjahr,zuglauf_id,idx) ;; 
alter table public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2020 add  foreign key (fahrplanjahr,zuglauf_id,idx) references public.zuglaufmeldungen_2020(fahrplanjahr,zuglauf_id,idx) ; 
*/
create index ix_gps_leidis_zuglaufpositionsmeldungen_vzgv_betriebstag_2014 on public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2014(datentag); 
create index ix_gps_leidis_zuglaufpositionsmeldungen_vzgv_betriebstag_2015 on public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2015(datentag);
create index ix_gps_leidis_zuglaufpositionsmeldungen_vzgv_betriebstag_2016 on public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2016(datentag);
create index ix_gps_leidis_zuglaufpositionsmeldungen_vzgv_betriebstag_2017 on public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2017(datentag);
create index ix_gps_leidis_zuglaufpositionsmeldungen_vzgv_betriebstag_2018 on public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2018(datentag);
create index ix_gps_leidis_zuglaufpositionsmeldungen_vzgv_betriebstag_2019 on public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2019(datentag);
create index ix_gps_leidis_zuglaufpositionsmeldungen_vzgv_betriebstag_2020 on public.gps_leidis_zuglaufpositionsmeldungen_vzgv_2020(datentag);
