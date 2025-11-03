# cyclistic-case-study

# Google Data Analytics Capstone: Cyclistic Case Study

Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

---

## Introduction

In this case study, I perform real-world data analysis as a junior analyst at Cyclistic, a fictional Chicago bike-share company. Cyclistic, a bike-share program in Chicago, seeks to convert more casual riders into annual members to secure sustainable growth. The marketing director believes increasing annual memberships will drive long-term profitability. This case study analyzes internal ride data to identify the behavioral and usage patterns that differentiate annual members from casual riders, supporting data-driven marketing recommendations and I will follow the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

---

## Quick links

- **Data Source:** [divvy_tripdata](#)
- **SQL Queries:** [01. Data Combining](01.Data%20combining.sql), [02. Data Exploration](02.Data%20exploration.sql), [03. Cleaning](03.Data%20cleaning.sql), [04. Analysis](04.Data%20Analysis.sql)
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

### About Data
The data consists of 2022 ride records from Cyclistic’s public [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html), with attributes including ride dates, rider type, station info, and bike type. Personally identifiable information was excluded to protect rider privacy.

### Data Organization
There are 12 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.


 

## Process

BigQuery is used to combine the various datasets into one dataset and clean it.
Reason:
A worksheet can only have 1,048,576 rows in Microsoft Excel because of its inability to manage large amounts of data. Because the Cyclistic dataset has more than 5.6 million rows, it is essential to use a platform like BigQuery that supports huge volumes of data.

### Combining Data 
SQL Queries:  [01. Data Combining](01.Data%20combining.sql)

12 csv files are uploaded as tables in the dataset '2022_tripdata'. Another table named "combined_data" is created, containing 5,667,717 rows of data for the entire year.

### Data Exploration
SQL Queries:  [02. Data Exploration](02.Data%20exploration.sql)

 
Before cleaning the combined data which contains 5,667,717 Rows  , I am familiarizing myself with the data to find the inconsistencies.
Key columns include: ride_id, started_at, ended_at, rideable_type, start_station_name, end_station_name, member_casual, and coordinates.

Observations:

  1. The table below shows the all column names and their data types. The ride_id column is our primary key.


     <img width="700" height="700" alt="DataTypes" src="https://github.com/user-attachments/assets/9f1667ee-9087-4870-bfb0-62e0d6ddd6e9" />

  2. The following table shows number of null values in each column.


<img width="975" height="49" alt="null values" src="https://github.com/user-attachments/assets/4cbd530f-6a74-498d-941e-d9c54031c8ac" />
     Note that some columns have same number of missing values. This may be due to missing information in the same row i.e. station's name and id for the same station and latitude and longitude for the same ending station.

  3. As ride_id has no null values, let's use it to check for duplicates.

<img width="484" height="39" alt="Checking Duplicates" src="https://github.com/user-attachments/assets/49063c66-9fb3-4039-9114-e893812d0348" />

     There are no duplicate rows in the data.

  4. All ride_id values have length of 16 so no need to clean it.
  5. There are 3 unique types of bikes(rideable_type) in our data.

  
     
      <img width="390" height="227" alt="rideable_type" src="https://github.com/user-attachments/assets/412d6e87-db57-4442-8ce1-472202368220" />


    
  6. The started_at and ended_at shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format. New column ride_length can be created to find the total trip duration. There are 5360 trips which has duration longer than a day and 122283 trips having less than a minute duration or having end time earlier than start time so need to remove them. Other columns day_of_week and month can also be helpful in analysis of trips at different times in a year.
  
  7. Total of 833064 rows have both start_station_name and start_station_id missing which needs to be removed.
  
  8. Total of 892742 rows have both end_station_name and end_station_id missing which needs to be removed.
  
  9. Total of 5858 rows have both end_lat and end_lng missing which needs to be removed.
  
  10. member_casual column has 2 uniqued values as member or casual rider.


    

 
      <img width="412" height="233" alt="Mem   Cas bef Clean" src="https://github.com/user-attachments/assets/304495d5-a622-42af-9880-bce3de68943f" />


   11. Columns that need to be removed are start_station_id and end_station_id as they do not add value to analysis of our current problem. Longitude and latitude location columns may not be used in analysis but can be used to visualise a map.





### Data Cleaning

SQL Queries: [03. Cleaning](03.Data%20cleaning.sql)

(a) Removed duplicate ride records to ensure each entry is unique.

(b) Filtered out entries with missing latitude or longitude values.

(c) Corrected wrongly formatted timestamps for start and end times.

(d) Replaced blank or null station names with "Unknown".

(e) Standardized the rideable_type values to match the dataset schema.

(f) Verified and fixed inconsistencies in member status detection.

(g) Ensured all IDs are in string format for merging and analysis.



## Analyze
SQL Queries: [04. Analysis](04.Data%20Analysis.sql)




  The dataset has now been successfully organized and is ready for analysis. Various tables were generated and later visualized using Tableau to explore key patterns.

As part of the analysis, the following core question was considered: In what ways do annual subscribers and casual users differ in their use of Cyclistic bikes?

With the data cleaned and formatted, I queried essential tables to aid my analysis, visualizing comparisons between different rider types in Tableau.

For this analysis, the main focus was: How do the trip behaviors of members contrast with those of casual riders using the Cyclistic system?


### 1. Number of Rides by User Type

   
   ![1 Bar Chart for Rides by User type](https://github.com/user-attachments/assets/a35300aa-59a9-4b69-929b-a3568edd6632)


    Insight:
 Members make up a larger total of rides than casuals, but the casual segment represents a
 major opportunity for growth






