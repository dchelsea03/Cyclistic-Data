SELECT COUNT(*) AS row_num FROM cyclic_all

--Checking for duplicates
SELECT ride_id, COUNT(ride_id)
FROM cyclistic..cyclic_all
GROUP BY ride_id
HAVING COUNT(ride_id) > 1

SELECT ride_id, start_station_name, end_station_name, COUNT(*)
FROM cyclistic..cyclic_all
GROUP BY ride_id, start_station_name, end_station_name
HAVING COUNT(*) > 1

SELECT tb1.*
FROM cyclistic..cyclic_all tb1
JOIN (SELECT ride_id, COUNT(*) countthis
FROM cyclistic..cyclic_all
GROUP BY ride_id
HAVING count(*)>1) tb2
ON tb1.ride_id=tb2.ride_id
ORDER BY ride_id
--Results: No duplicates even though some ride_ids are the same. Different start time, station names and others

--Check for NULL VALUES

--ride_ids
SELECT * FROM cyclic_all
WHERE ride_id IS NULL

SELECT SUM(CASE WHEN ride_id IS NULL THEN 1 ELSE 0 END) AS null_vals,
COUNT(ride_id) AS non_null_vals
FROM cyclistic..cyclic_all

--rideable_type
SELECT * FROM cyclic_all
WHERE rideable_type IS NULL
--check what bike types there are
--there are three types: electric, class, docked
SELECT DISTINCT rideable_type, COUNT(rideable_type)
FROM cyclistic..cyclic_all
GROUP BY rideable_type

--start time
SELECT * FROM cyclic_all
WHERE started_at IS NULL

--end time
SELECT * FROM cyclic_all
WHERE ended_at IS NULL

--start_station_name
SELECT * FROM cyclic_all
WHERE start_station_name IS NULL

--Counting null values in every row
SELECT
SUM(CASE WHEN ride_id IS NULL THEN 1 ELSE 0 END) AS ride_id_null,
SUM(CASE WHEN rideable_type IS NULL THEN 1 ELSE 0 END) AS ride_type_null,
SUM(CASE WHEN start_station_name IS NULL THEN 1 ELSE 0 END) AS start_station_name_null,
SUM(CASE WHEN start_station_id IS NULL THEN 1 ELSE 0 END) AS start_station_id_null,
SUM(CASE WHEN end_station_name IS NULL THEN 1 ELSE 0 END) AS end_station_name_null,
SUM(CASE WHEN end_station_id IS NULL THEN 1 ELSE 0 END) AS end_station_id_null,
SUM(CASE WHEN end_station_id IS NULL THEN 1 ELSE 0 END) AS end_station_id_null,
SUM(CASE WHEN start_lat IS NULL THEN 1 ELSE 0 END) AS start_lat_null,
SUM(CASE WHEN start_lng IS NULL THEN 1 ELSE 0 END) AS start_lng_null,
SUM(CASE WHEN end_lat IS NULL THEN 1 ELSE 0 END) AS end_lat_null,
SUM(CASE WHEN end_lng IS NULL THEN 1 ELSE 0 END) AS end_lng_null,
SUM(CASE WHEN member_casual IS NULL THEN 1 ELSE 0 END) AS mem_cas_null
FROM cyclistic..cyclic_all

--Checking station names and IDs
SELECT end_station_name, end_station_id, COUNT(*) AS null_num
FROM cyclistic..cyclic_all
WHERE end_station_id IS NULL
GROUP BY end_station_name, end_station_id

SELECT start_station_name, start_station_id, COUNT(start_station_name) 
FROM cyclistic..cyclic_all
WHERE start_station_name IS NOT NULL and start_station_id IS NOT NULL
GROUP BY start_station_name, start_station_id


SELECT DISTINCT(start_station_name) FROM cyclistic..cyclic_all
ORDER BY start_station_name

SELECT DISTINCT(end_station_name) FROM cyclistic..cyclic_all
ORDER BY end_station_name

SELECT start_station_name from cyclistic..cyclic_all
WHERE start_station_name NOT IN (SELECT DISTINCT start_station_name FROM cyclistic..cyclic_all
WHERE start_station_name IS NOT NULL)
 
SELECT DISTINCT start_station_name,start_station_id FROM cyclistic..cyclic_all
WHERE start_station_name IS NOT NULL AND start_station_id IS NOT NULL

SELECT DISTINCT end_station_name, end_station_id FROM cyclistic..cyclic_all
--WHERE end_station_id is NULL
WHERE end_station_id IS NOT NULL AND end_station_name IS NOT NULL


--Checking stations
/*
select * FROM cyclistic..cyclic_all
WHERE start_station_id='13221' OR
start_station_id='20215' OR
start_station_id='WL-008'

SELECT * FROM cyclistic..cyclic_all
WHERE start_station_name='DIVVY CASSETTE REPAIR MOBILE STATION' OR
end_station_name='DIVVY CASSETTE REPAIR MOBILE STATION'

SELECT * FROM cyclistic..cyclic_all
WHERE start_station_name='Western Ave & 28th St' OR
end_station_name='Western Ave & 28th St'

SELECT * FROM cyclistic..cyclic_all
WHERE start_station_name='Halsted St & 63rd St' OR
end_station_name='Halsted St & 63rd St'
*/