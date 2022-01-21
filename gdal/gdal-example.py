#!bin/python3

# Small example on how to work with GDAL and ARC CURVES.

#https://gdal.org/api/python.html

from osgeo import gdal
from osgeo import ogr
from osgeo import osr
from osgeo import gdal_array
from osgeo import gdalconst

# Source: https://gdal.org/development/rfc/rfc49_curve_geometries.html

## Union:
g1 = ogr.CreateGeometryFromWkt('CURVEPOLYGON(COMPOUNDCURVE(CIRCULARSTRING (0 0,1 1,2 0),(2 0,0 0)))')
g2 = ogr.CreateGeometryFromWkt('CURVEPOLYGON(COMPOUNDCURVE(CIRCULARSTRING (0 0,1 -1,2 0),(2 0,0 0)))')
g3 = g1.Union(g2)
assert g3.ExportToWkt() == 'CURVEPOLYGON (CIRCULARSTRING (0 0,1 1,2 0,1 -1,0 0))'
print(g1)
print(g2)
print('UNION: ', end="")
print(g3)
print("")

## Buffer:
g1 = ogr.CreateGeometryFromWkt('POINT(1 2)')
g2 = g1.Buffer(0.5)
g3 = g2.GetCurveGeometry()
assert g3.ExportToWkt() == 'CURVEPOLYGON (CIRCULARSTRING (1.5 2.0,0.5 2.0,1.5 2.0))'
print(g1)
print('BUFFER.GetCurveGeometry: ', end="")
print(g3)
print("")

## Square, punch a circular hole in it:
g1 = ogr.CreateGeometryFromWkt('POLYGON((0 0, 0 4, 4 4, 4 0, 0 0))')
g2 = ogr.CreateGeometryFromWkt('CURVEPOLYGON(CIRCULARSTRING (2 1, 2 3, 2 1))')
g3 = g1.Difference(g2)
assert g3.ExportToWkt() == 'CURVEPOLYGON ((0 0,0 4,4 4,4 0,0 0),CIRCULARSTRING (2 1,2 3,2 1))'
print("Punching a circle out of a square:")
print(g3)


