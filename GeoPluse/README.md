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
