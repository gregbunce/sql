-- select nearest road from address point
DECLARE @g geometry = (select Shape from ADDRESSPOINTS where OBJECTID = 401823);
SELECT TOP(1) Shape.STDistance(@g) as DISTANCE, L_F_ADD, L_T_ADD, R_F_ADD, R_T_ADD, OBJECTID  FROM UTRANS_STREETS
WHERE Shape.STDistance(@g) is not null and and Shape.STDistance(@g) < 30 and STREETNAME = 'OGDEN' and STREETTYPE = 'AVE'
ORDER BY Shape.STDistance(@g);

--select * from ADDRESSPOINTS where OBJECTID = 401823



-- select nearest ADDRESS POINTS to ADDRESS POINTS 
DECLARE @g geometry = (select Shape from PIUTE_FROMCOUNTY where OBJECTID = 6);
SELECT TOP(1) Shape.STDistance(@g) as DISTANCE, OBJECTID, UTAddPtID  FROM PIUTE_TOSGID
WHERE Shape.STDistance(@g) is not null and Shape.STDistance(@g) < 30
ORDER BY Shape.STDistance(@g);


DECLARE @g geometry = (select Shape from @InputLayerName where OBJECTID = @InuptLayerOID);
SELECT TOP(1) Shape.STDistance(@g) as DISTANCE, *  FROM @ClosestAddrLayerName
WHERE Shape.STDistance(@g) is not null and Shape.STDistance(@g) < 30
ORDER BY Shape.STDistance(@g);



-- call the stored procedure that gets the nearest address point from supplied OID
EXECUTE uspGetNearestAddressPointFromPoint @InputLayerOID = 5;
