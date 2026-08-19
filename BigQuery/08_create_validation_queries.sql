---Validate total records
SELECT
  COUNT(*) AS total_records
FROM `careflow-hospital-analytics.CareFlow.event_logs`;




---Check missing important values
SELECT
  COUNTIF(Case_ID IS NULL OR Case_ID = '') AS missing_case_id,
  COUNTIF(Activity IS NULL OR Activity = '') AS missing_activity,
  COUNTIF(Activity_Start_Time IS NULL) AS missing_start_time,
  COUNTIF(Activity_End_Time IS NULL) AS missing_end_time,
  COUNTIF(Patient_ID IS NULL OR Patient_ID = '') AS missing_patient_id
FROM `careflow-hospital-analytics.CareFlow.event_logs`;




---Check valid patient journeys
SELECT
  Case_ID,
  COUNT(*) AS event_count
FROM `careflow-hospital-analytics.CareFlow.event_logs`
WHERE Case_ID IS NOT NULL
GROUP BY Case_ID
HAVING COUNT(*) = 0;




---Create one overall validation summary
SELECT
  COUNT(*) AS total_records,

  COUNT(DISTINCT Patient_ID) AS total_patients,

  COUNT(DISTINCT Case_ID) AS total_cases,

  COUNT(DISTINCT Activity) AS unique_activities,

  COUNT(DISTINCT Department) AS unique_departments,

  COUNTIF(Case_ID IS NULL OR Case_ID = '') AS missing_case_id,

  COUNTIF(Activity IS NULL OR Activity = '') AS missing_activity,

  COUNTIF(Activity_Start_Time IS NULL) AS missing_start_time,

  COUNTIF(Activity_End_Time IS NULL) AS missing_end_time,

  COUNTIF(Age < 0 OR Age > 120) AS invalid_age,

  COUNTIF(Waiting_Time_Minutes < 0) AS invalid_waiting_time,

  COUNTIF(Treatment_Time < 0) AS invalid_treatment_time,

  COUNTIF(Activity_End_Time < Activity_Start_Time) AS invalid_timestamps

FROM `careflow-hospital-analytics.CareFlow.event_logs`;





---Create a validation view
CREATE OR REPLACE VIEW
`careflow-hospital-analytics.CareFlow.data_validation_summary` AS

SELECT
  COUNT(*) AS total_records,
  COUNT(DISTINCT Patient_ID) AS total_patients,
  COUNT(DISTINCT Case_ID) AS total_cases,
  COUNT(DISTINCT Activity) AS unique_activities,
  COUNT(DISTINCT Department) AS unique_departments,

  COUNTIF(Case_ID IS NULL OR Case_ID = '') AS missing_case_id,
  COUNTIF(Activity IS NULL OR Activity = '') AS missing_activity,
  COUNTIF(Activity_Start_Time IS NULL) AS missing_start_time,
  COUNTIF(Activity_End_Time IS NULL) AS missing_end_time,

  COUNTIF(Age < 0 OR Age > 120) AS invalid_age,
  COUNTIF(Waiting_Time_Minutes < 0) AS invalid_waiting_time,
  COUNTIF(Treatment_Time < 0) AS invalid_treatment_time,
  COUNTIF(Activity_End_Time < Activity_Start_Time)
    AS invalid_timestamps

FROM `careflow-hospital-analytics.CareFlow.event_logs`;