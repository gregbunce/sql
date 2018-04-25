--SELECT NEARBY ADDRESS POINTS
Selecting nearby address points via buffer
DECLARE @G geometry;
SET @G = (SELECT SHAPE.STBuffer(100) as buffer FROM ADDRPTNS_COUNTYGDB WHERE OBJECTID = 1)
--select @G.ToString() as WKT;
--select @G as WKB;

select * from ADDRPTNS_COUNTYGDB where Shape.STWithin(@G) = 1;

--Selecting nearby address points via distance
DECLARE @g geometry = (select Shape from Location.ADDRESSPOINTS where OBJECTID = 3132210);
SELECT TOP(1) Shape.STDistance(@g) as DISTANCE, OBJECTID, UTAddPtID  FROM Location.ADDRESSPOINTS
WHERE Shape.STDistance(@g) is not null and Shape.STDistance(@g) < 30
ORDER BY Shape.STDistance(@g);



--SELECTING NEAREST ROAD FROM ADDRESS POINT
DECLARE @g geometry = (select Shape from location.ADDRESSPOINTS where OBJECTID = 3132211);
SELECT TOP(1) Shape.STDistance(@g) as DISTANCE, L_F_ADD, L_T_ADD, R_F_ADD, R_T_ADD, OBJECTID  FROM Transportation.ROADS
WHERE Shape.STDistance(@g) is not null and Shape.STDistance(@g) < 29 and STREETNAME = 'CHARDONNAY' and STREETTYPE = 'CIR'
ORDER BY Shape.STDistance(@g);




--ADD A NEW POINT TO THE FEATURE CLASS FROM EXISTING POINT
-- CREATE AN OBJECTID FOR THE NEW POINT
declare @OID as int;
set @OID = (select Max(OBJECTID) FROM ADDRPTNS_COUNTYGDB) + 1;

-- GET GEOM FROM EXISTING POINT and ATTRIBUTES
DECLARE @G geometry;
DECLARE @FULLNAME VARCHAR(MAX);
set @FULLNAME = (SELECT FullAdd FROM ADDRPTNS_COUNTYGDB WHERE OBJECTID = 98)
SET @G = (SELECT SHAPE FROM ADDRPTNS_COUNTYGDB WHERE OBJECTID = 98)
--select @G.ToString() as WKT;

-- INSERT THE NEW POINT AND IT’S ATTRIBUTES
INSERT INTO ADDRPTNS_COUNTYGDB (OBJECTID, Shape,FullAdd)
VALUES (@OID, @G, @FULLNAME)


