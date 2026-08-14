---Display the data
SELECT *
FROM `careflow-hospital-analytics.CareFlow.event_logs`
LIMIT 20;


---Check unique patients
SELECT COUNT(DISTINCT Patient_ID) AS total_patients
FROM `careflow-hospital-analytics.CareFlow.event_logs`;


---Check unique cases
SELECT COUNT(DISTINCT Case_ID) AS total_cases
FROM `careflow-hospital-analytics.CareFlow.event_logs`;


---Check departments
SELECT
  Department,
  COUNT(*) AS total_events
FROM `careflow-hospital-analytics.CareFlow.patient_event_logs`
GROUP BY Department
ORDER BY total_events DESC;


---Check patient journey
SELECT
  Case_ID,
  Patient_ID,
  Activity,
  Activity_Start_Time,
  Activity_End_Time
FROM `careflow-hospital-analytics.CareFlow.patient_event_logs`
ORDER BY Case_ID, Activity_Start_Time;


---Find patients with loop-backs
SELECT
  Case_ID,
  Activity,
  COUNT(*) AS activity_count
FROM `careflow-hospital-analytics.CareFlow.event_logs`
GROUP BY Case_ID, Activity
HAVING COUNT(*) > 1
ORDER BY Case_ID, activity_count DESC;