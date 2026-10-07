# GeoPulse — Hyper-Local Retail Mobility Analytics

GeoPulse is a geospatial analytics project designed to help retailers understand
how foot traffic and mobility patterns vary across different locations and time periods.

## Project Objective

The project analyzes synthetic mobility/GPS data along with retail store locations
and geographic zones to explore:

- Footfall patterns
- Peak traffic hours
- Store-level activity
- Geographic mobility patterns
- Store proximity
- Potential retail location opportunities

## Current Progress

### Day 1 — Project Initialization & Synthetic Data

- Created the GeoPulse project structure
- Generated synthetic mobility data
- Generated synthetic retail store data
- Generated synthetic geographic zone data
- Created 5,000 mobility records
- Created 10 retail stores
- Created 8 geographic zones
- Performed initial data validation
- Checked missing values
- Checked duplicate records
- Validated latitude and longitude ranges
- Converted timestamps to datetime format

## Datasets

### mobility_pings.csv

Contains 5,000 synthetic GPS/mobility records.

### stores.csv

Contains information about 10 fictional retail stores.

### zones.csv

Contains 8 fictional geographic zones.

## Technology Stack

- Python
- Jupyter Notebook
- Pandas
- NumPy
- PySpark
- Apache Sedona
- Snowflake
- dbt
- Kepler.gl
- React

## Data Disclaimer

The mobility data used in this project is synthetic and generated for
educational and demonstration purposes. It does not represent real individuals
or real-world customer movements.

## Project Status

🚧 Project is currently under development.

Day 1 completed.

## Day 2 — Exploratory Data Analysis (EDA)

### Objective

The objective of Day 2 was to explore the synthetic mobility, store, and
geographic datasets and understand their distributions, temporal patterns,
and geographic characteristics before moving to feature engineering.

### Analysis Performed

- Analyzed mobility pings by movement type
- Calculated movement type percentages
- Analyzed device type distribution
- Analyzed hourly mobility patterns
- Identified the peak mobility hour
- Analyzed mobility by day of the week
- Examined movement type distribution across different hours
- Analyzed store types and daily capacity
- Checked geographic coverage of mobility pings and stores

### Key Findings

The synthetic mobility dataset contains 5,000 mobility records.

Movement type distribution:

- Walking: 2,433 records (48.66%)
- Driving: 1,548 records (30.96%)
- Public Transport: 1,019 records (20.38%)

Walking was the most common movement type in the generated dataset.

Hourly and day-of-week mobility patterns were also analyzed to identify
periods with higher mobility activity.

### Data Scope

The analysis uses synthetic mobility data generated specifically for this
educational project. The results should not be interpreted as real-world
human mobility or customer behavior.

### Day 2 Status

Completed.

The exploratory analysis provides the foundation for feature engineering
and subsequent spatial analytics.


## Day 3 — Feature Engineering

### Objective

The objective of Day 3 was to transform the raw mobility data into a more
analysis-ready dataset by creating useful temporal and categorical features.

### Features Created

- `time_period` for Morning, Afternoon, Evening, and Night classification
- `is_peak_hour` to identify records during the peak mobility hour
- `is_weekend` to identify weekend activity
- `month` extracted from the mobility timestamp
- `week_of_month` derived from the date
- `movement_type_code` for numerical representation of movement categories

### Validation

The newly created features were validated for missing values and consistency.
The original raw dataset was preserved, while the engineered dataset was
saved separately.

### Output Dataset

`mobility_pings_featured.csv`
## Day 4 — PySpark Data Processing

### Objective

The objective of Day 4 was to introduce Apache Spark into the GeoPulse
data-processing workflow and perform analytical operations using PySpark
DataFrames.

### Tasks Completed

- Initialized a local PySpark session
- Loaded the feature-engineered mobility dataset
- Inspected Spark schema and dataset structure
- Performed DataFrame filtering and column selection
- Aggregated mobility by movement type
- Aggregated mobility by time period
- Analyzed hourly mobility activity
- Compared weekday and weekend activity
- Analyzed movement type across time periods
- Validated Spark results against the existing Pandas analysis

### Validation

The Spark DataFrame contained 5,000 mobility records.

Movement-type counts were consistent with the previous Pandas analysis:

- Walking: 2,433
- Driving: 1,548
- Public Transport: 1,019

This confirmed that the Spark processing produced consistent results with
the earlier analysis.

### Day 4 Status

Completed.

The project is now ready to move from general data processing toward
spatial analytics using Apache Sedona.

All mobility data used in this project is synthetic and created for
educational purposes.

This dataset will be used in the upcoming PySpark and spatial analytics
stages of the project.

## Day 5 — Spatial Analytics with Python

### Objective

Perform spatial proximity analysis on synthetic mobility and retail store data using geographic coordinates.

### Work Completed

- Loaded the feature-engineered mobility dataset and retail store dataset
- Used latitude and longitude coordinates for geographic analysis
- Implemented the Haversine formula to calculate geographic distance
- Mapped each mobility ping to its nearest retail store
- Calculated the distance between mobility pings and their nearest stores
- Created distance bands for spatial segmentation
- Created 500-meter and 1-kilometer catchment indicators
- Performed store-level mobility and proximity analysis
- Analyzed mobility patterns across distance bands and movement types
- Analyzed catchment coverage across different time periods
- Combined spatial mobility metrics with store information
- Generated datasets for downstream analytics and visualization

### Key Results

- Total mobility records analyzed: 5,000
- Retail stores analyzed: 10
- Average distance to nearest store: 1.613 km
- Mobility pings within 500 meters of a store: 719
- Mobility pings within 1 kilometer of a store: 2,168

### Output Files

- `mobility_store_proximity.csv`
- `store_spatial_analysis.csv`

### Note

The mobility and retail datasets used in this project are synthetic and are intended for demonstrating spatial analytics workflows. The analysis does not represent real customer or human mobility behavior.


## Day 6 — Store Opportunity & Spatial Competition Analysis

### Objective

Develop store-level business metrics using the spatial analytics outputs created during Day 5.

### Work Completed

- Aggregated mobility activity at store level
- Calculated store mobility intensity
- Calculated 500-meter and 1-kilometer catchment coverage
- Created a combined catchment score
- Calculated a capacity pressure indicator using mobility activity and store capacity
- Calculated distances between retail store pairs
- Identified nearby stores within a 1-kilometer radius
- Created a proximity-based store overlap indicator
- Developed a mobility-based opportunity score
- Ranked stores using the calculated opportunity score
- Created a consolidated store analytics dataset

### Important Note

The cannibalization indicator is a proximity-based analytical indicator and does not represent actual customer cannibalization. Since the mobility dataset is synthetic, the metric is intended only for demonstrating a retail analytics methodology.

### Output

- `store_opportunity_analysis.csv`

## Day 7 — Store Performance & Temporal Pattern Analysis

### Objective

Analyze store-level mobility patterns across time periods, movement types, weekdays, weekends, and peak hours.

### Work Completed

- Analyzed mobility activity by store and time period
- Analyzed movement types across individual stores
- Compared weekday and weekend mobility patterns
- Identified peak-hour and non-peak-hour activity
- Identified the dominant mobility period for each store
- Calculated dominant-period activity concentration
- Combined temporal metrics with Day 6 store opportunity metrics
- Created store performance categories
- Generated a consolidated store performance dataset

### Output

- `store_performance_analysis.csv`

### Analytical Use

## Day 8 — Snowflake Data Warehouse Integration

### Objective

Integrate GeoPulse analytical datasets into a Snowflake data warehouse and create a structured foundation for downstream analytics and visualization.

### Work Completed

- Created the `GEOPULSE_DB` Snowflake database
- Created `RAW` and `ANALYTICS` schemas
- Loaded GeoPulse datasets into Snowflake
- Validated loaded tables and record counts
- Performed SQL-based mobility analysis
- Analyzed store opportunity metrics
- Analyzed store performance metrics
- Created an analytical `STORE_PERFORMANCE_VIEW`
- Validated the warehouse data against the locally generated datasets

### Warehouse Structure

```text
GEOPULSE_DB
├── RAW
│   ├── MOBILITY_PINGS_FEATURED
│   ├── STORES
│   ├── ZONES
│   ├── MOBILITY_STORE_PROXIMITY
│   ├── STORE_SPATIAL_ANALYSIS
│   ├── STORE_OPPORTUNITY_ANALYSIS
│   └── STORE_PERFORMANCE_ANALYSIS
│
└── ANALYTICS
    └── STORE_PERFORMANCE_VIEW

The resulting dataset can be used for downstream dashboard development, store comparison, location analysis, and retail decision-support visualizations.

### Note

All mobility data used in GeoPulse is synthetic and does not represent actual customer or human mobility behavior.

## Day 9 — Snowflake Analytical Queries & Business Metrics

### Objective

Perform business-oriented SQL analysis using the GeoPulse datasets stored in Snowflake.

### Work Completed

- Calculated overall mobility KPIs
- Analyzed movement type distribution
- Analyzed time-period mobility
- Compared peak and non-peak activity
- Compared weekday and weekend activity
- Ranked stores using opportunity scores
- Analyzed store catchment coverage
- Analyzed capacity pressure
- Analyzed nearby-store overlap
- Analyzed store performance categories
- Created a consolidated `STORE_BUSINESS_SUMMARY` table

### Output

## Day 10 — Dashboard-Ready Analytics Layer

### Objective

Prepare a final Snowflake analytics layer for downstream dashboard development and business analysis.

### Work Completed

- Validated the final `STORE_BUSINESS_SUMMARY` table
- Created the `STORE_BUSINESS_ANALYTICS` view
- Created dashboard-oriented KPI queries
- Analyzed total stores and mobility activity
- Calculated average opportunity score
- Calculated average nearest-store distance
- Analyzed 500-meter and 1-kilometer catchment coverage
- Created ranked store-level analysis
- Analyzed store performance categories
- Prepared a clean analytics layer for visualization

### Output

- `STORE_BUSINESS_SUMMARY`
- `STORE_BUSINESS_ANALYTICS`

### Note

The GeoPulse datasets are synthetic and are intended only to demonstrate spatial analytics, SQL analytics, and retail decision-support workflows.

- `STORE_BUSINESS_SUMMARY`

### Note

The GeoPulse datasets are synthetic and are intended only to demonstrate SQL analytics and retail decision-support workflows.

## Day 11 — Dashboard Data Preparation

### Objective

Prepare the final Snowflake analytics layer for downstream dashboard development.

### Work Completed

- Validated the Snowflake analytics view
- Created the `GEOPULSE_DASHBOARD_DATA` view
- Selected final store-level business metrics
- Prepared dashboard KPI fields
- Organized mobility, catchment, capacity, opportunity, and performance metrics
- Prepared the project for Power BI visualization

### Output
## Day 12 — Power BI Executive Dashboard

### Objective

Connect the Snowflake analytics layer with Power BI and create the first executive-level dashboard page.

### Work Completed

- Connected Power BI with the Snowflake analytics layer
- Loaded the `GEOPULSE_DASHBOARD_DATA` view
- Validated the dashboard dataset
- Created KPI measures
- Created the Executive Overview page
- Added store opportunity ranking
- Added mobility analysis by store type
- Added store performance distribution
- Added opportunity versus mobility analysis

### Dashboard Page

**Executive Overview**

The page provides a high-level view of:

- Store count
- Mobility activity
- Store opportunity
- Geographic distance metrics
- Catchment coverage
- Store performance
- Mobility intensity

### Note

The GeoPulse datasets are synthetic and are intended only to demonstrate spatial analytics, SQL analytics, and retail decision-support workflows.
- `GEOPULSE_DASHBOARD_DATA`

## Day 13 — Power BI Catchment & Capacity Analysis

### Objective

Develop the second analytical page of the GeoPulse Power BI dashboard to evaluate store catchment coverage, capacity pressure, and mobility intensity.

### Work Completed

- Created the `Catchment & Capacity Analysis` dashboard page
- Added KPI cards for average 500m catchment and average 1km catchment
- Added average capacity pressure KPI
- Added average mobility intensity KPI
- Created store-level 500m vs 1km catchment comparison
- Created store capacity pressure ranking
- Created mobility intensity vs capacity pressure scatter analysis
- Added performance category as a visual segmentation
- Created a detailed store-level catchment and capacity table
- Compared store-level mobility intensity with capacity pressure
- Reviewed store catchment coverage and operational pressure across locations

### Key Dashboard Metrics

- Average 500m Catchment: 17.14
- Average 1km Catchment: 49.85
- Average Capacity Pressure: 116.56
- Average Mobility Intensity: 71.23

### Dashboard Pages Completed

- Page 1 — Executive Overview
- Page 2 — Catchment & Capacity Analysis

### Outcome

The second Power BI dashboard page provides a deeper view of store-level catchment coverage, mobility intensity, and capacity pressure, helping identify stores with higher activity and operational pressure.




