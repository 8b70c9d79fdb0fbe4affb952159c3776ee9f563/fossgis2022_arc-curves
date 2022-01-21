

CREATE TABLE fossgis_circularstring (id serial PRIMARY KEY, name VARCHAR NOT NULL, description VARCHAR);
SELECT AddGeometryColumn('','fossgis_circularstring','geom','25832','CIRCULARSTRING',2);
-- DROP TABLE fossgis_circularstring;

CREATE TABLE fossgis_curvepolygon(id serial PRIMARY KEY, name VARCHAR NOT NULL, description VARCHAR);
SELECT AddGeometryColumn('','fossgis_curvepolygon','geom','25832','CURVEPOLYGON',2);
-- DROP TABLE fossgis_curvepolygon;

CREATE TABLE fossgis_geometry (id serial PRIMARY KEY, name VARCHAR NOT NULL, description VARCHAR);
SELECT AddGeometryColumn('','fossgis_geometry','geom','25832','GEOMETRY',2);
-- DROP TABLE fossgis_geometry;

CREATE TABLE fossgis_polygon (id serial PRIMARY KEY, name VARCHAR NOT NULL, description VARCHAR);
SELECT AddGeometryColumn('','fossgis_polygon','geom','25832','POLYGON',2);



INSERT INTO fossgis_curvepolygon(name, geom) VALUES
('rectangle100',
ST_Translate(
    St_GeomFromEWKT('SRID=25832;CURVEPOLYGON(COMPOUNDCURVE((100 100, 100 120, 200 120, 200 100, 100 100 )))')
    ,484000, 5628700)
);


INSERT INTO fossgis_curvepolygon(name, geom) VALUES
('circle',
ST_Translate(
    St_GeomFromEWKT('SRID=25832;CURVEPOLYGON(COMPOUNDCURVE(CIRCULARSTRING(185 105, 185 115, 185 105)))')
    ,484000, 5628700)
);

INSERT INTO fossgis_curvepolygon(name, geom) VALUES
('circle2',
ST_Translate(
    St_GeomFromEWKT('SRID=25832;CURVEPOLYGON(CIRCULARSTRING(105 110, 110 115, 115 110, 110 105, 105 110))')
    ,484000, 5628700)
);


INSERT INTO fossgis_curvepolygon(name, geom) VALUES
('square',
ST_Translate(
    St_GeomFromEWKT('SRID=25832;CURVEPOLYGON(COMPOUNDCURVE((105 105, 105 115, 115 115, 115 105, 105 105 )))')
    ,484000, 5628700)
);
