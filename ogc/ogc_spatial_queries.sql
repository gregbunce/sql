-- Note: This files contains some common ogc sql spatial queries
________________________________________________________________

-- Get the voting precint that intersects an address point
SELECT
  *
FROM 
  political.vista_ballot_areas AS a, 
  location.address_points AS b 
WHERE 
  b.fulladd = '550 S GUARDSMAN WAY' 
  AND b.zipcode = '84108' 
  AND ST_Intersects(a.shape, b.shape)


-- Get the length of roads fully contained within each municipality.
SELECT
  m.name,
  sum(ST_Length(r.shape))/1000 AS roads_km
FROM
  transportation.roads AS r,
  boundaries.municipal_boundaries AS m
WHERE
  ST_Contains(m.shape, r.shape)
GROUP BY m.name
ORDER BY roads_km;


-- Get the largest municipality polygon that has a hole.
SELECT 
  countynbr, 
  name, 
  ST_Area(shape) AS area
FROM 
  boundaries.municipal_boundaries
WHERE 
  ST_NRings(shape) > 1
ORDER BY 
  area DESC LIMIT 1;
  
  
-- Get the extent (the bounding box) of a geometry by layer name.
SELECT 
  ST_Extent(shape) AS extent
FROM 
  cadastre.beaver_county_parcels


-- Get the 2-dimensional cartesian minimum distacne between two points
SELECT 
	ST_Distance(a.shape, b.shape)
FROM 
	location.address_points a, location.address_points b
WHERE 
	a.utaddptid='SALT LAKE CITY | 2468 N PINECREST CANYON RD' AND b.utaddptid='SALT LAKE CITY | 36 S WASATCH DR';
