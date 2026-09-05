---Validate complete data

SELECT
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