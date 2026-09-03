---Calculate waiting times

SELECT
  Case_ID,
  Activity AS Current_Activity,
  LEAD(Activity) OVER (
    PARTITION BY Case_ID
    ORDER BY Activity_Start_Time
  ) AS Next_Activity,
  Activity_Start_Time AS Current_Start_Time,
  LEAD(Activity_Start_Time) OVER (
    PARTITION BY Case_ID
    ORDER BY Activity_Start_Time
  ) AS Next_Start_Time,
  TIMESTAMP_DIFF(
    LEAD(Activity_Start_Time) OVER (
      PARTITION BY Case_ID
      ORDER BY Activity_Start_Time
    ),
    Activity_End_Time,
    MINUTE
  ) AS Waiting_Time_Minutes
FROM `careflow-hospital-analytics.CareFlow.event_logs`
ORDER BY Case_ID, Activity_Start_Time;