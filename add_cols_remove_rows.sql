SELECT * FROM cyclistic..cyclic_all

--Add three columns for ride length, day name and month name
ALTER TABLE cyclistic..cyclic_all DROP COLUMN IF EXISTS ride_length, day_name, month_name;

ALTER TABLE cyclistic..cyclic_all
ADD ride_length INT, month_name NVARCHAR(255), day_name NVARCHAR(255);

UPDATE cyclistic..cyclic_all
SET ride_length=DATEDIFF(SECOND, started_at, ended_at),
day_name=DATENAME(dw,started_at),
month_name= DATENAME(month,started_at)

SELECT TOP 20 started_at, ended_at, DATEDIFF(minute, started_at, ended_at), member_casual
FROM cyclistic..cyclic_all
ORDER BY ride_length DESC


--Check rows need to be dropped

--Remove rows with negative ride lenghts
SELECT *
FROM cyclistic..cyclic_all
WHERE ride_length < 60

SELECT * FROM cyclistic..cyclic_all
WHERE ride_length < 0
--147 rows
DELETE FROM cyclistic..cyclic_all
WHERE ride_length < 0

--Drop entries that went to the repair station or test stations
SELECT * FROM cyclistic..cyclic_all
WHERE end_station_name = 'DIVVY CASSETTE REPAIR MOBILE STATION' OR start_station_name = 'DIVVY CASSETTE REPAIR MOBILE STATION'
--4 rows
DELETE FROM cyclistic..cyclic_all
WHERE end_station_name = 'DIVVY CASSETTE REPAIR MOBILE STATION'

SELECT * FROM cyclistic..cyclic_all
WHERE end_station_id = 'Hubbard Bike-checking (LBS-WH-TEST)' OR start_station_id = 'Hubbard Bike-checking (LBS-WH-TEST)'
--667 rows
DELETE FROM cyclistic..cyclic_all
WHERE end_station_id = 'Hubbard Bike-checking (LBS-WH-TEST)' OR start_station_id = 'Hubbard Bike-checking (LBS-WH-TEST)'