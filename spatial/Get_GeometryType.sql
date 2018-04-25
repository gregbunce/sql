-- Determine Geometry Type in SQL Spatial for Features
SELECT count(SHAPE.STGeometryType()), SHAPE.STGeometryType() FROM UTRANS_STREETS 
group by SHAPE.STGeometryType();
