---Create Transition Queries

SELECT
  Current_Activity,
  Next_Activity,
  COUNT(*) AS Transition_Count
FROM (
  SELECT
    Case_ID,
    Activity AS Current_Activity,
    LEAD(Activity) OVER (
      PARTITION BY Case_ID
      ORDER BY Activity_Start_Time
    ) AS Next_Activity
  FROM `careflow-hospital-analytics.CareFlow.event_logs`
)
WHERE Next_Activity IS NOT NULL
GROUP BY Current_Activity, Next_Activity
ORDER BY Transition_Count DESC;