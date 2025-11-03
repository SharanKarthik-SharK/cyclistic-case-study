-- Data Exploration

-- 1. Check column types
SELECT column_name, data_type
FROM cyclistic_data.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'combined_data';

-- 2. Check for number of NULLs in all columns
SELECT COUNT(*) - COUNT(ride_id) AS ride_id,
 COUNT(*) - COUNT(rideable_type) AS rideable_type,
 COUNT(*) - COUNT(started_at) AS started_at,
 COUNT(*) - COUNT(ended_at) AS ended_at,
 COUNT(*) - COUNT(start_station_name) AS start_station_name,
 COUNT(*) - COUNT(start_station_id) AS start_station_id,
 COUNT(*) - COUNT(end_station_name) AS end_station_name,
 COUNT(*) - COUNT(end_station_id) AS end_station_id,
 COUNT(*) - COUNT(start_lat) AS start_lat,
 COUNT(*) - COUNT(start_lng) AS start_lng,
 COUNT(*) - COUNT(end_lat) AS end_lat,
 COUNT(*) - COUNT(end_lng) AS end_lng,
 COUNT(*) - COUNT(member_casual) AS member_casual
FROM cyclistic_data.combined_data;

-- 3. Check for duplicate rows (by ride_id)
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM cyclistic_data.combined_data;

-- 4. ride_id - all have length of 16
SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS no_of_rows
FROM cyclistic_data.combined_data
GROUP BY length_ride_id;

-- 5. rideable_type - unique types
SELECT rideable_type, COUNT(rideable_type) AS no_of_trips
FROM cyclistic_data.combined_data
GROUP BY rideable_type;

-- 6. Sample of started_at and ended_at
SELECT started_at, ended_at
FROM cyclistic_data.combined_data
LIMIT 10;

-- 7. Count trips longer than a day (>= 1440 minutes)
SELECT COUNT(*) AS longer_than_a_day
FROM cyclistic_data.combined_data
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;

-- 8. Count trips less than or equal to one minute
SELECT COUNT(*) AS less_than_a_minute
FROM cyclistic_data.combined_data
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1;

-- 9. Distinct start station names
SELECT DISTINCT start_station_name
FROM cyclistic_data.combined_data
ORDER BY start_station_name;

-- 10. Rows with start station missing
SELECT COUNT(ride_id) AS rows_with_start_station_null
FROM cyclistic_data.combined_data
WHERE start_station_name IS NULL OR start_station_id IS NULL;

-- 11. Distinct end station names
SELECT DISTINCT end_station_name
FROM cyclistic_data.combined_data
ORDER BY end_station_name;

-- 12. Rows with end station missing
SELECT COUNT(ride_id) AS rows_with_null_end_station
FROM cyclistic_data.combined_data
WHERE end_station_name IS NULL OR end_station_id IS NULL;

-- 13. Rows with end lat/lng missing
SELECT COUNT(ride_id) AS rows_with_null_end_loc
FROM cyclistic_data.combined_data
WHERE end_lat IS NULL OR end_lng IS NULL;

-- 14. member_casual - 2 unique values - member and casual
SELECT member_casual, COUNT(member_casual) AS no_of_trips
FROM cyclistic_data.combined_data
GROUP BY member_casual;
