1. Pipeline Overview
The CareFlow pipeline processes hospital patient event data from the raw dataset to a structured event log that can be used for process mining and analysis.

Patient_Log_Dataset.csv
        ↓
     BigQuery
        ↓
patient_event_logs
        ↓
Data Validation
        ↓
Query Optimization
        ↓
Transition Calculation
        ↓
Waiting-Time Calculation
        ↓
process_event_log
        ↓
      PM4Py
        ↓
Process Discovery & Analysis

The project uses BigQuery as the data warehouse and prepares a standardized event log containing Case ID, Activity, and Timestamp for process mining.


2. BigQuery Setup

A Google Cloud project and the CareFlow dataset were created in BigQuery.

Project: careflow-hospital-analytics
Dataset: CareFlow

The main raw table is:
event_logs

It stores patient information, hospital activities, departments, timestamps, waiting time, treatment time, diagnosis, priority, and billing information.

3. Data Loading

The hospital event-log dataset was loaded into the event_logs table. The loaded data was checked for record count and schema consistency.

4. Data Validation

Validation queries were created to check:

Missing Case IDs
Missing activities
Missing timestamps
Duplicate events
Invalid age values
Negative waiting/treatment times
Invalid activity timestamps
Chronological ordering of patient events

5. Query Optimization

Queries were optimized by:

Selecting only required columns
Applying appropriate filters
Avoiding unnecessary repeated calculations
Creating a lightweight process event-log table

6. Transition and Waiting-Time Calculation

SQL queries were created to identify transitions between activities and calculate the waiting time between consecutive hospital activities.

For example:
Registration
     ↓
Triage
     ↓
Doctor Consultation
     ↓
Lab Test
     ↓
Treatment
     ↓
Discharge

These calculations help identify delays and potential bottlenecks in patient journeys, which is a key objective of CareFlow.

7. Integration and Testing

The complete BigQuery pipeline was tested to ensure that:

Raw data is available
Required fields are populated
Events are chronologically ordered
Transitions can be calculated
Waiting times can be calculated


8. GitHub Documentation

CareFlow/
│
├── sql/
│   ├── create_dataset.sql
│   ├── create_event_logs.sql
│   ├── load_sample_data.sql
│   ├── validate_bigquery_data.sql
│   ├── optimize_bigquery_queries.sql
│   ├── validation_queries.sql
│   ├── create_transition_queries.sql
│   ├── calculate_waiting_times.sql
│   ├── validate_calculations.sql
│   ├── validate_complete_data.sql
│   ├── create_validation_tables.sql
│   ├── test_queries.sql
│   ├── full_bigquery_testing.sql
│   └── complete_integration.sql
