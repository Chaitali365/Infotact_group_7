---Full BigQuery testing
WITH base AS (
  SELECT *
  FROM `careflow-hospital-analytics.CareFlow.event_logs`
),

ordered_events AS (
  SELECT
    *,
    LAG(Activity_Start_Time) OVER (
      PARTITION BY Case_ID
      ORDER BY Activity_Start_Time
    ) AS Previous_Start_Time,

    LEAD(Activity) OVER (
      PARTITION BY Case_ID
      ORDER BY Activity_Start_Time
    ) AS Next_Activity,

    LEAD(Activity_Start_Time) OVER (
      PARTITION BY Case_ID
      ORDER BY Activity_Start_Time
    ) AS Next_Start_Time
  FROM base
),

tests AS (
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
      AS invalid_activity_times,

    COUNTIF(
      Previous_Start_Time IS NOT NULL
      AND Activity_Start_Time < Previous_Start_Time
    ) AS chronological_errors,

    COUNTIF(
      Next_Activity IS NOT NULL
      AND TIMESTAMP_DIFF(
        Next_Start_Time,
        Activity_End_Time,
        MINUTE
      ) < 0
    ) AS negative_calculated_waiting_times,

    COUNTIF(
      Next_Activity IS NOT NULL
    ) AS valid_transitions

  FROM ordered_events
)

SELECT
  *,
  CASE
    WHEN missing_patient_id = 0
     AND missing_case_id = 0
     AND missing_activity = 0
     AND missing_start_time = 0
     AND missing_end_time = 0
     AND invalid_age = 0
     AND invalid_waiting_time = 0
     AND invalid_treatment_time = 0
     AND invalid_activity_times = 0
     AND chronological_errors = 0
     AND negative_calculated_waiting_times = 0
    THEN 'PASS'
    ELSE 'FAIL'
  END AS overall_test_status
FROM tests;