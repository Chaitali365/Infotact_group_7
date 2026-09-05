---Optimize queries

WITH ordered_events AS (
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
  FROM `careflow-hospital-analytics.CareFlow.event_logs`
)

SELECT
  Case_ID,
  Activity AS Current_Activity,
  Next_Activity,
  Activity_Start_Time,
  Next_Start_Time,
  TIMESTAMP_DIFF(
    Next_Start_Time,
    Activity_End_Time,
    MINUTE
  ) AS Waiting_Time_Minutes
FROM ordered_events
WHERE Next_Activity IS NOT NULL
ORDER BY Case_ID, Activity_Start_Time;