--count riders per day_name
SELECT day_name, member_casual, COUNT(member_casual) as riders_count,
	CASE
		WHEN member_casual = 'member' THEN CONCAT('There are ', COUNT(member_casual),' ', member_casual, ' riders on ', day_name)
		WHEN member_casual = 'casual' THEN CONCAT('There are ', COUNT(member_casual), ' ',member_casual, ' riders on ', day_name)
	END as statement_summary
FROM cyclistic..cyclic_all
GROUP BY member_casual, day_name
ORDER BY
	CASE
		WHEN day_name = 'Sunday' THEN 1
		WHEN day_name = 'Monday' THEN 2
		WHEN day_name = 'Tuesday' THEN 3
		WHEN day_name = 'Wednesday' THEN 4
		WHEN day_name = 'Thursday' THEN 5
		WHEN day_name = 'Friday' THEN 6
		WHEN day_name = 'Saturday' THEN 7
	END

--count riders per month
SELECT month_name, member_casual, COUNT(member_casual) as riders_count,
	CASE
		WHEN member_casual = 'member' THEN CONCAT('There are ', COUNT(member_casual),' ', member_casual, ' riders on ', month_name)
		WHEN member_casual = 'casual' THEN CONCAT('There are ', COUNT(member_casual), ' ',member_casual, ' riders on ', month_name)
	END as statement_summary
FROM cyclistic..cyclic_all
GROUP BY member_casual, month_name
ORDER BY
	CASE
		WHEN month_name = 'January' THEN 1
		WHEN month_name = 'February' THEN 2
		WHEN month_name = 'March' THEN 3
		WHEN month_name = 'April' THEN 4
		WHEN month_name = 'May' THEN 5
		WHEN month_name = 'June' THEN 6
		WHEN month_name = 'July' THEN 7
		WHEN month_name = 'August' THEN 8
		WHEN month_name = 'September' THEN 9
		WHEN month_name = 'October' THEN 10
		WHEN month_name = 'November' THEN 11
		WHEN month_name = 'December' THEN 12
	END


-- select unique start stations and assign one start lat and start lng for each one to be used in visualizations later
WITH top_stations AS
(
    SELECT *, row_number() OVER(PARTITION BY start_station_name ORDER BY start_station_name) AS row_n
    FROM cyclistic..cyclic_all
)
SELECT
   start_station_name, start_lat, start_lng
FROM top_stations
WHERE row_n = 1 AND start_station_name IS NOT NULL
ORDER BY start_station_name

-- select top 20 start stations
SELECT TOP 20 start_station_name, COUNT(ride_id) as riders_count
FROM cyclistic..cyclic_all
WHERE start_station_name is not null AND start_lat is not null AND member_casual='casual'
GROUP BY start_station_name
--ORDER BY start_station_name
ORDER BY riders_count DESC

-- select unique end stations and assign one end lat and end lng for each station to be used in visualizations later
WITH top_estations AS
(
    SELECT *, row_number() OVER(PARTITION BY end_station_name ORDER BY end_station_name) AS row_n
    FROM cyclistic..cyclic_all
)
SELECT
   end_station_name, end_lat, end_lng
FROM top_estations
WHERE row_n = 1 AND end_station_name IS NOT NULL
ORDER BY end_station_name

-- select top 20 end stations
SELECT end_station_name, COUNT(ride_id) as riders_count
FROM cyclistic..cyclic_all
WHERE end_station_name is not null AND end_lat is not null AND end_lng is not null
GROUP BY end_station_name
ORDER BY end_station_name
--ORDER BY riders_count DESC