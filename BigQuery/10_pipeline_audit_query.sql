---Check raw table
SELECT COUNT(*) AS total_records
FROM `careflow-hospital-analytics.CareFlow.event_logs`;


---Check important event-log fields
SELECT
  COUNTIF(Case_ID IS NULL) AS missing_case_id,
  COUNTIF(Activity IS NULL) AS missing_activity,
  COUNTIF(Activity_Start_Time IS NULL) AS missing_timestamp
FROM `careflow-hospital-analytics.CareFlow.event_logs`;


---pipeline audit query
SELECT
  COUNT(*) AS total_raw_records,
  COUNT(DISTINCT Patient_ID) AS total_patients,
  COUNT(DISTINCT Case_ID) AS total_cases,
  COUNT(DISTINCT Activity) AS total_activities,

  COUNTIF(Case_ID IS NULL) AS missing_case_id,
  COUNTIF(Activity IS NULL) AS missing_activity,
  COUNTIF(Activity_Start_Time IS NULL) AS missing_start_time,

  COUNTIF(Activity_End_Time < Activity_Start_Time)
    AS invalid_time_records,

  COUNTIF(Waiting_Time_Minutes < 0)
    AS invalid_waiting_time,

  COUNTIF(Treatment_Time < 0)
    AS invalid_treatment_time

FROM `careflow-hospital-analytics.CareFlow.event_logs`;