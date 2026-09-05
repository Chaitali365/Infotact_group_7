---Create validation tables

---Create a validation summary table
CREATE OR REPLACE TABLE
`careflow-hospital-analytics.CareFlow.validation_summary` AS

SELECT
  CURRENT_TIMESTAMP() AS validation_time,
  COUNT(*) AS total_records,
  COUNT(DISTINCT Patient_ID) AS total_patients,
  COUNT(DISTINCT Case_ID) AS total_cases,
  COUNT(DISTINCT Activity) AS total_activities,

  COUNTIF(Patient_ID IS NULL OR Patient_ID = '') AS missing_patient_id,
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



---Verify the validation table
SELECT *
FROM `careflow-hospital-analytics.CareFlow.validation_summary`;


---Check whether the data passed validation
SELECT
  CASE
    WHEN missing_patient_id = 0
     AND missing_case_id = 0
     AND missing_activity = 0
     AND missing_start_time = 0
     AND invalid_age = 0
     AND invalid_waiting_time = 0
     AND invalid_treatment_time = 0
     AND invalid_timestamps = 0
    THEN 'PASS'
    ELSE 'FAIL'
  END AS validation_status
FROM `careflow-hospital-analytics.CareFlow.validation_summary`;