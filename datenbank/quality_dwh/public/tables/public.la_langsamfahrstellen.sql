CREATE TABLE public.la_langsamfahrstellen
  (
    art_der_la                  VARCHAR(15),
    ge                          VARCHAR(10),
    rb                          VARCHAR(15),
    pd_rn                       VARCHAR(40),
    streckennummer              INT2,
    begrenzende_betriebsstellen VARCHAR(50),
    richtung                    INT2,
    von_km                      DECIMAL(7,3),
    bis_km                      DECIMAL(7,3),
    laenge                      DECIMAL(7,3),
    v_ist                       VARCHAR(10),
    v_la                        VARCHAR(10),
    einrichtungsdatum           DATE,
    beseitigungsdatum           DATE,
    grund                       VARCHAR(50),
    begruendung                 VARCHAR(550),
    fehlerart_mangel            VARCHAR(60),
    ist_la_tage                 INT2,
    zu_erwartende_la_tage       INT2,
    vsl_beseitigung_in_kw       INT2,
    datum_von                   DATE NOT NULL,
    load_id                     INT8 NOT NULL,
    pk_la                       INT8 NOT NULL,
    CONSTRAINT pk_la_langsamfahrstellen PRIMARY KEY 
   (
    pk_la
   )
);
