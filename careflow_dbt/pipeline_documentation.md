# CareFlow Pipeline Documentation

## 1. Overview

The CareFlow data pipeline processes healthcare event-log data and transforms it into analytical models for process mining and process performance analysis.

The pipeline uses:

- BigQuery for data storage and querying
- dbt for data transformation
- SQL for analytical models
- PM4Py for process mining and process discovery

## 2. Data Flow

The overall pipeline follows this flow:

Raw Healthcare Data
        ↓
dbt Staging Models
        ↓
Event Log Model
        ↓
Analytical Models
        ↓
Conformance Checking
        ↓
PM4Py Process Mining
        ↓
Final Dashboard

## 3. Staging Layer

The staging layer prepares the raw healthcare event data for further processing.

The main activities include:

- Standardizing Case ID
- Standardizing Activity Name
- Standardizing timestamps
- Cleaning event fields

This ensures that the event data is consistent and suitable for analysis.

## 4. Event Log Layer

The event-log model combines the cleaned event fields into a structured process-mining event log.

The event log contains:

- Case ID
- Activity Name
- Activity Start Timestamp
- Activity End Timestamp

The final event log contains 4,584 events across 1,000 cases.

## 5. Analytics Layer

The analytics layer contains SQL models for process analysis.

The main models are:

- `activity_transition.sql`
- `average_transition_time.sql`
- `bottleneck_activities.sql`
- `bottleneck_percentage.sql`
- `conformance_rules.sql`
- `conformance_check.sql`

These models provide insights into patient journeys, process performance, bottlenecks, and process compliance.

## 6. Process Mining Layer

PM4Py is used to discover the process model from the healthcare event log.

The process discovery script:

`pm4py_discovery.py`

reads the event log and generates a process model.

The generated process model is saved as:

`process_model.png`

## 7. Conformance Checking

The conformance-checking stage compares the observed patient activity transitions against the defined expected process.

The expected process flow is:

Registration → Triage → Doctor → Billing

The validation confirmed the expected transitions:

- Registration → Triage
- Triage → Doctor
- Doctor → Billing

## 8. Validation

The pipeline was tested at different stages to ensure that the transformed data and process-mining results were working correctly.

Validation included:

- dbt output validation
- Activity transition validation
- Bottleneck analysis validation
- PM4Py process-map validation
- Conformance checking
- Final process-mining testing

## 9. Final Output

The pipeline produces analytical results that can be used by the final CareFlow dashboard.

The outputs support:

- Patient journey analysis
- Process transition analysis
- Transition-time analysis
- Bottleneck identification
- Process conformance analysis
- Process mining visualization

## 10. Conclusion

The CareFlow pipeline provides a structured workflow for transforming raw healthcare event data into useful process-mining and analytical insights.

Using dbt, BigQuery, SQL, and PM4Py together makes the pipeline reproducible, organized, and suitable for healthcare process analysis.