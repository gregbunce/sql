-- Note: This files contains sample OGC SQL spatial queries.
-- They were created to test on Utah's Public SGID on PostgreSQL/PostGIS DB.
____________________________________________________________________________

-- Get total length of roads by DOT Class in Jurisdiction by Mile and Meter
select 
    dot_class, incmuni_l, SUM(ST_Length(shape))/1609.344 as total_miles, SUM(ST_Length(shape)) as total_meters 
from 
    transportation.roads r 
where 
    dot_class in ('A','B','C','D') and incmuni_l = 'Rockville'
group by 
    dot_class, incmuni_l 
order by 
    dot_class


-- Get the voting precint that intersects an address point
SELECT
  *
FROM 
  political.vista_ballot_areas AS a, 
  location.address_points AS b 
WHERE 
  b.fulladd = '550 S GUARDSMAN WAY' 
  AND b.zipcode = '84108' 
  AND ST_Intersects(a.shape, b.shape);

  
-- Get the extent (the bounding box) of a geometry by layer name.
SELECT 
  ST_Extent(shape) AS extent
FROM 
  cadastre.beaver_county_parcels;


-- Get the 2-dimensional cartesian minimum distacne between two points.
SELECT 
  ST_Distance(a.shape, b.shape)
FROM 
  location.address_points a, 
  location.address_points b
WHERE 
  a.utaddptid='SALT LAKE CITY | 350 N STATE ST' 
  AND b.utaddptid='SALT LAKE CITY | 36 S WASATCH DR';


-- Get well-known text of feature.
SELECT 
  ST_AsText(shape)
FROM
  location.address_points
WHERE
  utaddptid = 'SALT LAKE CITY | 350 N STATE ST';
  

-- Transform/Reproject a feature to a new SRID/Projection.
SELECT
  ST_AsText(ST_Transform(a.shape, 4326))
FROM
  location.address_points a
WHERE
  a.utaddptid='SALT LAKE CITY | 350 N STATE ST';


-- GeoHash a feature (but, first it must be reprojected to lat/long).
SELECT
  ST_GeoHash(ST_AsText(ST_Transform(a.shape, 4326)))
FROM
  location.address_points a
WHERE
  a.utaddptid='SALT LAKE CITY | 350 N STATE ST';
  
  
-- Get geometry point from existing GeoHash
SELECT ST_AsText(ST_PointFromGeoHash('9x0rvzm82pnm0d0pptgr'));

-- Get geometry polygon from existing GeoHash (geometry will be a polygon representing the GeoHash bounds)
SELECT ST_AsText(ST_GeomFromGeoHash('9x0rvzm82pnm0d0pptgr'));


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
  
-- Reproject the results (if data is not stored in 4326) on-the-fly so you can view the features in the built-in pgAdmin or DBeaver map viewer (the basemaps in these applications use SRID 4326) 
select *, ST_Transform(shape, 4326) from water.watersheds_area wa where wa.hu_8_name like 'Jordan'

-- Get spatial reference id (SRID) for table
select distinct ST_SRID(shape) from transportation.roads;
                
-- select geom (shape in our case) as text, geojson, kml, gml
SELECT st_astext(shape), st_asgeojson(shape), st_askml(shape), st_asgml(shape)
FROM location.address_points limit 1;
