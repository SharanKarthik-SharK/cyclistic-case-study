-- Data Combining

DROP TABLE IF EXISTS `cyclistic_data.combined_data`;

-- combining all the 12 months data tables into a single table containing data from Jan 2022 to Dec 2022.

CREATE TABLE IF NOT EXISTS `cyclistic_data.combined_data` AS (
SELECT * FROM cyclistic_data.tripdata_202201
UNION ALL
SELECT * FROM cyclistic_data.tripdata_202202
UNION ALL
SELECT * FROM cyclistic_data.tripdata_202203
UNION ALL
SELECT * FROM cyclistic_data.tripdata_202204
UNION ALL
SELECT * FROM cyclistic_data.tripdata_202205
UNION ALL
SELECT * FROM cyclistic_data.tripdata_202206
UNION ALL
SELECT * FROM cyclistic_data.tripdata_202207
UNION ALL
SELECT * FROM cyclistic_data.tripdata_202208
UNION ALL
SELECT * FROM cyclistic_data.tripdata_202209
UNION ALL
SELECT * FROM cyclistic_data.tripdata_202210
UNION ALL
SELECT * FROM cyclistic_data.tripdata_202211
UNION ALL
SELECT * FROM cyclistic_data.tripdata_202212
);

-- checking no of rows which are 5667717

SELECT COUNT(*)
FROM `cyclistic_data.combined_data`;
