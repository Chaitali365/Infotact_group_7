---Avoid SELECT *
SELECT
  Case_ID,
  Activity,
  Activity_Start_Time
FROM `careflow-hospital-analytics.CareFlow.event_logs`;


---Add filters whenever possible
SELECT
  Case_ID,
  Activity,
  Activity_Start_Time
FROM `careflow-hospital-analytics.CareFlow.event_logs`
WHERE Visit_Date >= '2026-08-01';

---Optimize your waiting-time query
SELECT
  Department,
  ROUND(AVG(Waiting_Time_Minutes), 2) AS avg_waiting_time
FROM `careflow-hospital-analytics.CareFlow.event_logs`
WHERE
  Department IS NOT NULL
  AND Waiting_Time_Minutes IS NOT NULL
  AND Waiting_Time_Minutes >= 0
GROUP BY Department
ORDER BY avg_waiting_time DESC;


---Optimize bottleneck analysis
SELECT
  Activity,
  COUNT(*) AS event_count,
  ROUND(AVG(Waiting_Time_Minutes), 2) AS avg_waiting_time,
  ROUND(AVG(Treatment_Time), 2) AS avg_treatment_time
FROM `careflow-hospital-analytics.CareFlow.event_logs`
WHERE
  Activity IS NOT NULL
  AND Waiting_Time_Minutes IS NOT NULL
  AND Treatment_Time IS NOT NULL
GROUP BY Activity
ORDER BY avg_waiting_time DESC;


---Create a department performance view
CREATE OR REPLACE VIEW
`careflow-hospital-analytics.CareFlow.department_performance` AS

SELECT
  Department,
  COUNT(DISTINCT Patient_ID) AS total_patients,
  COUNT(*) AS total_events,
  ROUND(AVG(Waiting_Time_Minutes), 2) AS avg_waiting_time,
  ROUND(AVG(Treatment_Time), 2) AS avg_treatment_time
FROM `careflow-hospital-analytics.CareFlow.event_logs`
WHERE
  Department IS NOT NULL
GROUP BY Department;

SELECT *
FROM `careflow-hospital-analytics.CareFlow.department_performance`
ORDER BY avg_waiting_time DESC;