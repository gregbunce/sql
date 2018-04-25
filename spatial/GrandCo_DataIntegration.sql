-- create a buffer around a road segment
DECLARE @g geometry = (select Shape.STBuffer(30) as buffer from GRAND_COUNTY where OBJECTID = 2535);
--SELECT @g;
-- see if another road segment falls within the buffer
SELECT * FROM MOAB_CITY where Shape.STWithin(@g) = 1;


--SELECT count(SHAPE.STGeometryType()), SHAPE.STGeometryType() FROM UTRANS_STREETS
--group by SHAPE.STGeometryType();

--DECLARE @g geometry  
--DECLARE @h geometry;  
--SET @g = geometry::STGeomFromText('LINESTRING(0 2, 2 0, 4 2)', 0);  
--SET @h = geometry::STGeomFromText('MULTILINESTRING((4 2, 2 0), (0 2, 2 0))', 0);  
--SELECT @g.STEquals(@h);

--DECLARE @g geometry;  
--DECLARE @h geometry;  
--SET @g = geometry::STGeomFromText('LINESTRING(0 2, 2 0, 4 2)', 0);  
--SET @h = geometry::STGeomFromText('MULTILINESTRING((4 4, 2 0), (0 2, 2 0))', 0);  
--SELECT @g.STDifference(@h).ToString();

--DECLARE @g geometry;  
--SET @g = geometry::STGeomFromText('LINESTRING(0 0, 2 2, 1 0)', 0);  
--SELECT @g.STNumPoints();

-- create a buffer around a road segment
DECLARE @g geometry = (select Shape.STBuffer(80) as buffer from MOAB_CITY_SUB where OBJECTID_12 = 726);
SELECT * FROM MOAB_CITY_SUB WHERE OBJECTID_12 = 726;
SELECT @g.STCentroid().ToString() as myCentroid;
SELECT @g.STStartPoint().ToString() as myStartPoint;
SELECT @g.STEndPoint().ToString() as myEndPoint;
-- see if another road segment falls within the buffer
SELECT * FROM UTRANS_STREETS where Shape.STWithin(@g) = 1;

DECLARE @gg geometry = (SELECT SHAPE from UTRANS_STREETS where OBJECTID = 290220);
SELECT @gg.STCentroid().ToString() as myCentroid;
SELECT @gg.STStartPoint().ToString() as myStartPoint;
SELECT @gg.STEndPoint().ToString() as myEndPoint;