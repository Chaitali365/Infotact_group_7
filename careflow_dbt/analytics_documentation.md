# CareFlow Analytics Documentation

## 1. Overview

The CareFlow project uses dbt and BigQuery to transform healthcare event-log data into analytical models for process mining and process performance analysis.

The analytics models are designed to understand patient journey patterns, activity transitions, transition times, bottlenecks, and process conformance.

## 2. Activity Transition Analysis

The `activity_transition.sql` model identifies the sequence of activities performed for each patient case.

It calculates how frequently one activity is followed by another activity.

### Purpose
- Identify common patient journey paths
- Understand activity-to-activity transitions
- Support process mining analysis
- Identify unusual or less frequent transitions

## 3. Average Transition Time

The `average_transition_time.sql` model calculates the average time taken between consecutive activities.

### Purpose
- Measure process duration
- Identify activities with longer transition times
- Support process performance analysis
- Help identify possible delays

## 4. Bottleneck Activities

The `bottleneck_activities.sql` model identifies activities that may contribute to delays in the patient journey.

### Purpose
- Identify frequently delayed activities
- Highlight process bottlenecks
- Support operational improvement
- Help prioritize activities for further investigation

## 5. Bottleneck Percentage

The `bottleneck_percentage.sql` model calculates the percentage contribution of activities to the identified bottleneck conditions.

### Purpose
- Quantify bottleneck impact
- Compare bottleneck activities
- Support data-driven decision making

## 6. Conformance Rules

The `conformance_rules.sql` model defines the expected or ideal sequence of patient activities.

The main expected process flow includes:

Registration → Triage → Doctor → Billing

These rules are used as the baseline for comparing actual patient journeys.

## 7. Conformance Checking

The `conformance_check.sql` model compares observed patient activity transitions with the defined conformance rules.

### Purpose
- Identify compliant process transitions
- Detect deviations from the expected process
- Support process quality analysis
- Measure process compliance

## 8. Process Mining

PM4Py is used to perform process discovery on the healthcare event log.

The event log contains:

- Case ID
- Activity Name
- Activity Start Timestamp
- Activity End Timestamp

The dataset used for process mining contains 4,584 events across 1,000 cases.

The discovered process model is saved as:

`process_model.png`

## 9. Validation

The process mining results were validated by comparing the observed activity transitions with the expected process flow.

The following transitions were successfully validated:

- Registration → Triage
- Triage → Doctor
- Doctor → Billing

The PM4Py process map validation completed successfully.

## 10. Analytics Output

The analytical models provide the foundation for the final CareFlow dashboard.

The dashboard can be used to understand:

- Patient activity flow
- Activity transition patterns
- Average transition time
- Bottleneck activities
- Bottleneck percentage
- Process conformance
- Process mining results

## 11. Conclusion

The CareFlow analytics layer transforms raw healthcare event data into meaningful process and performance insights.

The combination of dbt, BigQuery, SQL analytics models, and PM4Py process mining provides a structured approach for analyzing patient journeys and identifying opportunities for process improvement.