---Complete Integration
WITH raw_data AS (
  SELECT *
  FROM `careflow-hospital-analytics.CareFlow.event_logs`
),

process_data AS (
  SELECT
    Case_ID,
    Activity_Name,
    Timestamp
  FROM `careflow-hospital-analytics.CareFlow.process_event_log`
),

ordered_events AS (
  SELECT
    Case_ID,
    Activity,
    Activity_Start_Time,
    Activity_End_Time,
    LEAD(Activity) OVER (
      PARTITION BY Case_ID
      ORDER BY Activity_Start_Time
    ) AS Next_Activity,
    LEAD(Activity_Start_Time) OVER (
      PARTITION BY Case_ID
      ORDER BY Activity_Start_Time
    ) AS Next_Start_Time
  FROM raw_data
),

integration_checks AS (
  SELECT
    (SELECT COUNT(*) FROM raw_data) AS raw_records,
    (SELECT COUNT(*) FROM process_data) AS process_records,
    (SELECT COUNT(DISTINCT Case_ID) FROM raw_data) AS raw_cases,
    (SELECT COUNT(DISTINCT Case_ID) FROM process_data) AS process_cases,

    (SELECT COUNT(*)
     FROM raw_data
     WHERE Case_ID IS NULL
        OR Activity IS NULL
        OR Activity_Start_Time IS NULL) AS invalid_raw_events,

    (SELECT COUNT(*)
     FROM process_data
     WHERE Case_ID IS NULL
        OR Activity_Name IS NULL
        OR Timestamp IS NULL) AS invalid_process_events,

    (SELECT COUNT(*)
     FROM ordered_events
     WHERE Activity_End_Time < Activity_Start_Time) AS invalid_timestamps,

    (SELECT COUNT(*)
     FROM ordered_events
     WHERE Next_Activity IS NOT NULL
       AND TIMESTAMP_DIFF(
         Next_Start_Time,
         Activity_End_Time,
         MINUTE
       ) < 0) AS invalid_waiting_times
)

SELECT
  *,
  CASE
    WHEN raw_records > 0
     AND process_records > 0
     AND raw_cases = process_cases
     AND invalid_raw_events = 0
     AND invalid_process_events = 0
     AND invalid_timestamps = 0
     AND invalid_waiting_times = 0
    THEN 'INTEGRATION PASS'
    ELSE 'INTEGRATION FAIL'
  END AS integration_status
FROM integration_checks;