---Check chronological order
SELECT
  Case_ID,
  Activity,
  Activity_Start_Time,
  LAG(Activity_Start_Time)
    OVER (
      PARTITION BY Case_ID
      ORDER BY Activity_Start_Time
    ) AS previous_activity_time
FROM `careflow-hospital-analytics.CareFlow.event_logs`
QUALIFY Activity_Start_Time < previous_activity_time;