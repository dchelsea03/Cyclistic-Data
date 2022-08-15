ALTER TABLE cyclistic..cyclistic_jan$
ALTER COLUMN start_station_id NVARCHAR(255)

ALTER TABLE cyclistic..cyclistic_feb$
ALTER COLUMN start_station_id NVARCHAR(255)

ALTER TABLE cyclistic..cyclistic_mar$
ALTER COLUMN start_station_id NVARCHAR(255)

ALTER TABLE cyclistic..cyclistic_apr$
ALTER COLUMN end_station_id NVARCHAR(255)

ALTER TABLE cyclistic..cyclistic_jul$
ALTER COLUMN start_station_id NVARCHAR(255)

ALTER TABLE cyclistic..cyclistic_jul$
ALTER COLUMN end_station_id NVARCHAR(255)

ALTER TABLE cyclistic..cyclistic_nov$
ALTER COLUMN start_station_id NVARCHAR(255)

 --CREATE TABLE all_cyclistic AS SELECT * FROM
	SELECT * FROM cyclistic..cyclistic_jan$
	UNION ALL
	SELECT * FROM cyclistic..cyclistic_feb$
	UNION ALL
	SELECT * FROM cyclistic..cyclistic_mar$
	UNION ALL
	SELECT * FROM cyclistic..cyclistic_apr$
	UNION ALL
	SELECT * FROM cyclistic..cyclistic_may$
	UNION ALL
	SELECT * FROM cyclistic..cyclistic_jun$
	UNION ALL
	SELECT * FROM cyclistic..cyclistic_jul$
	UNION ALL
	SELECT * FROM cyclistic..cyclistic_aug$
	UNION ALL
	SELECT * FROM cyclistic..cyclistic_sep$
	UNION ALL
	SELECT * FROM cyclistic..cyclistic_oct$
	UNION ALL
	SELECT * FROM cyclistic..cyclistic_nov$
	UNION ALL
	SELECT * FROM cyclistic..cyclistic_dec$

DROP TABLE IF EXISTS cyclic_all
CREATE TABLE cyclic_all(
	ride_id NVARCHAR(255),
	rideable_type NVARCHAR(255),
	started_at DATETIME,
	ended_at DATETIME,
	start_station_name NVARCHAR(255),
	start_station_id NVARCHAR(255),
	end_station_name NVARCHAR(255),
	end_station_id NVARCHAR(255),
	start_lat FLOAT,
	start_lng FLOAT,
	end_lat FLOAT,
	end_lng FLOAT,
	member_casual NVARCHAR(255)
)

INSERT INTO cyclic_all(ride_id, rideable_type,started_at,ended_at,start_station_name,start_station_id,end_station_name,end_station_id,start_lat,start_lng,end_lat,end_lng,member_casual)
SELECT * FROM cyclistic..cyclistic_jan$
UNION ALL
SELECT * FROM cyclistic..cyclistic_feb$
UNION ALL
SELECT * FROM cyclistic..cyclistic_mar$
UNION ALL
SELECT * FROM cyclistic..cyclistic_apr$
UNION ALL
SELECT * FROM cyclistic..cyclistic_may$
UNION ALL
SELECT * FROM cyclistic..cyclistic_jun$
UNION ALL
SELECT * FROM cyclistic..cyclistic_jul$
UNION ALL
SELECT * FROM cyclistic..cyclistic_aug$
UNION ALL
SELECT * FROM cyclistic..cyclistic_sep$
UNION ALL
SELECT * FROM cyclistic..cyclistic_oct$
UNION ALL
SELECT * FROM cyclistic..cyclistic_nov$
UNION ALL
SELECT * FROM cyclistic..cyclistic_dec$

SELECT COUNT(*) AS row_num FROM cyclic_all

