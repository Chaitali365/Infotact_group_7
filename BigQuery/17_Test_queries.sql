---Test queries
SELECT
  validation_time,
  total_records,
  total_patients,
  total_cases,
  total_activities,
  missing_patient_id,
  missing_case_id,
  missing_activity,
  missing_start_time,
  missing_end_time,
  invalid_age,
  invalid_waiting_time,
  invalid_treatment_time,
  invalid_timestamps,
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
  END AS test_status
FROM `careflow-hospital-analytics.CareFlow.validation_summary`;