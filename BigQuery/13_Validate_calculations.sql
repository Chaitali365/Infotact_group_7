---Validate calculations

SELECT
  COUNT(*) AS total_calculations,
  COUNTIF(Waiting_Time_Minutes < 0) AS negative_waiting_times,
  COUNTIF(Waiting_Time_Minutes IS NULL) AS missing_waiting_times,
  MIN(Waiting_Time_Minutes) AS minimum_waiting_time,
  MAX(Waiting_Time_Minutes) AS maximum_waiting_time,
  ROUND(AVG(Waiting_Time_Minutes), 2) AS average_waiting_time
FROM (
  SELECT
    TIMESTAMP_DIFF(
      LEAD(Activity_Start_Time) OVER (
        PARTITION BY Case_ID
        ORDER BY Activity_Start_Time
      ),
      Activity_End_Time,
      MINUTE
    ) AS Waiting_Time_Minutes
  FROM `careflow-hospital-analytics.CareFlow.event_logs`
);