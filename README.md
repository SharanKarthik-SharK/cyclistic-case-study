# cyclistic-case-study

# Google Data Analytics Capstone: Cyclistic Case Study

Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

---

## Introduction

In this case study, I perform real-world data analysis as a junior analyst at Cyclistic, a fictional Chicago bike-share company. Cyclistic, a bike-share program in Chicago, seeks to convert more casual riders into annual members to secure sustainable growth. The marketing director believes increasing annual memberships will drive long-term profitability. This case study analyzes internal ride data to identify the behavioral and usage patterns that differentiate annual members from casual riders, supporting data-driven marketing recommendations and I will follow the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

---

## Quick links

- **Data Source:** [divvy_tripdata](#)
- **SQL Queries:** [01. Combining](#sql-queries-combining), [02. Exploration](#sql-queries-exploration), [03. Cleaning](#sql-queries-cleaning), [04. Analysis](#sql-queries-analysis)
- **Tableau Visualizations:** see Analysis section

---

## Table of Contents

- [Ask](#ask)
- [Prepare](#prepare)
- [Process](#process)
- [Analyze](#analyze)
- [Share](#share)
- [Act](#act)
...


## Ask

Cyclistic’s marketing team wants to convert more casual riders into annual members for sustained growth.  

**Key Analysis Question:**  
- How do annual members and casual riders use Cyclistic bikes differently?

## Prepare

The data consists of 2022 ride records from Cyclistic’s public [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html), with attributes including ride dates, rider type, station info, and bike type. Personally identifiable information was excluded to protect rider privacy.

### SQL Query:  [01. Combining](#sql-queries-combining),
12 csv files are uploaded as tables in the dataset '2022_tripdata'. Another table named "combined_data" is created, containing 5,667,717 rows of data for the entire year.

 [01. Combining](#sql-queries-combining),
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


## Process

### Data Exploration

Before cleaning, the combined dataset contains **[insert row count]** rows.  
Key columns include: ride_id, started_at, ended_at, rideable_type, start_station_name, end_station_name, member_casual, and coordinates.

- **Check for missing values and record types:**  


