---Calculate average waiting time
SELECT
  AVG(Waiting_Time_Minutes) AS average_waiting_time
FROM `careflow-hospital-analytics.CareFlow.event_logs`;


---Waiting time by department
SELECT
  Department,
  ROUND(AVG(Waiting_Time_Minutes), 2) AS average_waiting_time
FROM `careflow-hospital-analytics.CareFlow.event_logs`
GROUP BY Department
ORDER BY average_waiting_time DESC;


---Treatment time by department
SELECT
  Department,
  ROUND(AVG(Treatment_Time), 2) AS average_treatment_time
FROM `careflow-hospital-analytics.CareFlow.pevent_logs`
GROUP BY Department
ORDER BY average_treatment_time DESC;


---Find the biggest bottleneck activities
SELECT
  Activity,
  ROUND(AVG(Waiting_Time_Minutes), 2) AS avg_waiting_time,
  COUNT(*) AS total_events
FROM `careflow-hospital-analytics.CareFlow.event_logs`
GROUP BY Activity
ORDER BY avg_waiting_time DESC;


---Waiting time by priority
SELECT
  Priority,
  ROUND(AVG(Waiting_Time_Minutes), 2) AS avg_waiting_time,
  COUNT(*) AS total_events
FROM `careflow-hospital-analytics.CareFlow.event_logs`
GROUP BY Priority
ORDER BY avg_waiting_time DESC;


---Patient status distribution
SELECT
  Status,
  COUNT(*) AS total
FROM `careflow-hospital-analytics.CareFlow.event_logs`
GROUP BY Status
ORDER BY total DESC;


---Lab test distribution
SELECT
  Lab_Test,
  COUNT(*) AS total
FROM `careflow-hospital-analytics.CareFlow.event_logs`
GROUP BY Lab_Test
ORDER BY total DESC;


---Billing status
SELECT
  Billing_Status,
  COUNT(*) AS total
FROM `careflow-hospital-analytics.CareFlow.event_logs`
GROUP BY Billing_Status
ORDER BY total DESC;


---Doctor-wise analysis
SELECT
  Doctor_Name,
  COUNT(DISTINCT Patient_ID) AS patients_handled,
  ROUND(AVG(Waiting_Time_Minutes), 2) AS avg_waiting_time,
  ROUND(AVG(Treatment_Time), 2) AS avg_treatment_time
FROM `careflow-hospital-analytics.CareFlow.event_logs`
GROUP BY Doctor_Name
ORDER BY patients_handled DESC;
