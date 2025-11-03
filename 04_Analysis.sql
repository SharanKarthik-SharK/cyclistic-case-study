-- Data Analysis

-- Number of rides by user type

SELECT member_casual, COUNT(*) AS total_rides
FROM cyclistic_data.cleaned_combined_data
GROUP BY member_casual;

-- Average ride duration by user type

SELECT member_casual, AVG(ride_length) AS avg_ride_length_min
FROM cyclistic_data.cleaned_combined_data
GROUP BY member_casual;

-- Trips by Day of Week (for both user types)

SELECT member_casual, day_of_week, COUNT(*) AS num_rides
FROM cyclistic_data.cleaned_combined_data
GROUP BY member_casual, day_of_week
ORDER BY member_casual, 
  CASE day_of_week
    WHEN 'SUN' THEN 1 WHEN 'MON' THEN 2 WHEN 'TUES' THEN 3
    WHEN 'WED' THEN 4 WHEN 'THURS' THEN 5 WHEN 'FRI' THEN 6
    WHEN 'SAT' THEN 7 ELSE 0 END;

-- Trips by Month (for seasonality)

SELECT member_casual, month, COUNT(*) AS num_rides
FROM cyclistic_data.cleaned_combined_data
GROUP BY member_casual, month
ORDER BY member_casual, 
  CASE month
    WHEN 'JAN' THEN 1 WHEN 'FEB' THEN 2 WHEN 'MAR' THEN 3
    WHEN 'APR' THEN 4 WHEN 'MAY' THEN 5 WHEN 'JUN' THEN 6
    WHEN 'JUL' THEN 7 WHEN 'AUG' THEN 8 WHEN 'SEP' THEN 9
    WHEN 'OCT' THEN 10 WHEN 'NOV' THEN 11 WHEN 'DEC' THEN 12 ELSE 0 END;

-- Popular Start Stations (Top 10)

SELECT start_station_name, COUNT(*) AS num_rides
FROM cyclistic_data.cleaned_combined_data
GROUP BY start_station_name
ORDER BY num_rides DESC
LIMIT 10;

-- rideable type

SELECT rideable_type, COUNT(*) AS num_rides
FROM cyclistic_data.cleaned_combined_data
GROUP BY rideable_type;

-- Members vs Casuals

SELECT member_casual, rideable_type, COUNT(*) AS num_rides
FROM cyclistic_data.cleaned_combined_data
GROUP BY member_casual, rideable_type;
