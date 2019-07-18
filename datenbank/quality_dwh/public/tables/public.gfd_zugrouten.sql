-- DROP TABLE public.gfd_zugrouten;

CREATE TABLE public.gfd_zugrouten (
    load_id             BIGINT,
    lieferdatum         DATE,
    liefer_jahr_woche   INT,
    zuglaufindex        BIGINT,
    zugnummer           VARCHAR(20),
    betriebstag         TIMESTAMPTZ DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Berlin') NOT NULL,
    routeindex          INT,
    ds100               VARCHAR(20),
    routeabfahrt        VARCHAR(20),
    routename           VARCHAR(50),
    ankunft             VARCHAR(20),
    abfahrt             VARCHAR(20),
    isthalt             INT,
    istroutingknoten    INT,
    entfernung          VARCHAR(20),
    streckennr          VARCHAR(20),
    visumknotennr       INT,
    fahrplandatenid     BIGINT,
    fahrplanelementid   BIGINT,
    zghnr               INT,
    zgunr               INT
) PARTITION BY LIST (liefer_jahr_woche);

-- Comments
COMMENT ON COLUMN public.gfd_zugrouten.lieferdatum IS 'Datum der Erzeugung der der Datem';
COMMENT ON COLUMN public.gfd_zugrouten.liefer_jahr_woche IS 'Jahr und Monat als Integer aus der Spalte lieferdatum fuer die Partitionierung';

-- Partitions
/* SQL zur Codegenerierung:
select 'CREATE TABLE public.gfd_zugrouten_2019'||trim(to_char(n, '00'))||' PARTITION OF public.gfd_zugrouten FOR VALUES IN (2019'||trim(to_char(n, '00'))|| ');'
from generate_series(1, 52) as a(n);
*/
CREATE TABLE public.gfd_zugrouten_201901 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201901);
CREATE TABLE public.gfd_zugrouten_201902 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201902);
CREATE TABLE public.gfd_zugrouten_201903 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201903);
CREATE TABLE public.gfd_zugrouten_201904 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201904);
CREATE TABLE public.gfd_zugrouten_201905 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201905);
CREATE TABLE public.gfd_zugrouten_201906 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201906);
CREATE TABLE public.gfd_zugrouten_201907 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201907);
CREATE TABLE public.gfd_zugrouten_201908 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201908);
CREATE TABLE public.gfd_zugrouten_201909 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201909);
CREATE TABLE public.gfd_zugrouten_201910 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201910);
CREATE TABLE public.gfd_zugrouten_201911 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201911);
CREATE TABLE public.gfd_zugrouten_201912 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201912);
CREATE TABLE public.gfd_zugrouten_201913 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201913);
CREATE TABLE public.gfd_zugrouten_201914 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201914);
CREATE TABLE public.gfd_zugrouten_201915 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201915);
CREATE TABLE public.gfd_zugrouten_201916 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201916);
CREATE TABLE public.gfd_zugrouten_201917 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201917);
CREATE TABLE public.gfd_zugrouten_201918 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201918);
CREATE TABLE public.gfd_zugrouten_201919 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201919);
CREATE TABLE public.gfd_zugrouten_201920 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201920);
CREATE TABLE public.gfd_zugrouten_201921 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201921);
CREATE TABLE public.gfd_zugrouten_201922 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201922);
CREATE TABLE public.gfd_zugrouten_201923 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201923);
CREATE TABLE public.gfd_zugrouten_201924 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201924);
CREATE TABLE public.gfd_zugrouten_201925 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201925);
CREATE TABLE public.gfd_zugrouten_201926 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201926);
CREATE TABLE public.gfd_zugrouten_201927 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201927);
CREATE TABLE public.gfd_zugrouten_201928 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201928);
CREATE TABLE public.gfd_zugrouten_201929 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201929);
CREATE TABLE public.gfd_zugrouten_201930 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201930);
CREATE TABLE public.gfd_zugrouten_201931 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201931);
CREATE TABLE public.gfd_zugrouten_201932 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201932);
CREATE TABLE public.gfd_zugrouten_201933 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201933);
CREATE TABLE public.gfd_zugrouten_201934 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201934);
CREATE TABLE public.gfd_zugrouten_201935 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201935);
CREATE TABLE public.gfd_zugrouten_201936 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201936);
CREATE TABLE public.gfd_zugrouten_201937 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201937);
CREATE TABLE public.gfd_zugrouten_201938 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201938);
CREATE TABLE public.gfd_zugrouten_201939 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201939);
CREATE TABLE public.gfd_zugrouten_201940 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201940);
CREATE TABLE public.gfd_zugrouten_201941 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201941);
CREATE TABLE public.gfd_zugrouten_201942 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201942);
CREATE TABLE public.gfd_zugrouten_201943 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201943);
CREATE TABLE public.gfd_zugrouten_201944 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201944);
CREATE TABLE public.gfd_zugrouten_201945 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201945);
CREATE TABLE public.gfd_zugrouten_201946 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201946);
CREATE TABLE public.gfd_zugrouten_201947 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201947);
CREATE TABLE public.gfd_zugrouten_201948 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201948);
CREATE TABLE public.gfd_zugrouten_201949 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201949);
CREATE TABLE public.gfd_zugrouten_201950 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201950);
CREATE TABLE public.gfd_zugrouten_201951 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201951);
CREATE TABLE public.gfd_zugrouten_201952 PARTITION OF public.gfd_zugrouten FOR VALUES IN (201952);

-- Constraints
-- Die Kombi liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex ist eindeutig und koennte als PK verwendet werden
-- um Platz zu sparen wird aktuell darauf verzichtet
-- ALTER TABLE public.gfd_zugrouten_201901 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201902 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201903 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201904 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201905 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201906 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201907 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201908 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201909 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201910 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201911 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201912 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201913 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201914 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201915 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201916 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201917 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201918 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201919 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201920 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201921 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201922 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201923 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201924 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201925 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201926 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201927 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201928 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201929 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201930 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201931 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201932 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201933 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201934 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201935 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201936 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201937 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201938 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201939 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201940 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201941 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201942 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201943 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201944 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201945 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201946 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201947 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201948 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201949 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201950 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201951 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);
-- ALTER TABLE public.gfd_zugrouten_201952 ADD PRIMARY KEY (liefer_jahr_monat, betriebstag, zugnummer, zghnr, zgunr, zuglaufindex);