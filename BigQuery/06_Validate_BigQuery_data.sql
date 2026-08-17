---Confirm the table exists
SELECT
  table_name
FROM `careflow-hospital-analytics.CareFlow.INFORMATION_SCHEMA.TABLES`;

---Check total number of records
SELECT
  COUNT(*) AS total_records
FROM `careflow-hospital-analytics.CareFlow.event_logs`;


---Check the table schema
SELECT
  column_name,
  data_type,
  is_nullable
FROM `careflow-hospital-analytics.CareFlow.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'event_logs'
ORDER BY ordinal_position;


---Check missing values
SELECT
  COUNTIF(Patient_ID IS NULL) AS missing_patient_id,
  COUNTIF(Case_ID IS NULL) AS missing_case_id,
  COUNTIF(Activity IS NULL) AS missing_activity,
  COUNTIF(Activity_Start_Time IS NULL) AS missing_start_time,
  COUNTIF(Activity_End_Time IS NULL) AS missing_end_time,
  COUNTIF(Department IS NULL) AS missing_department
FROM `careflow-hospital-analytics.CareFlow.event_logs`;


---Check duplicate records
SELECT
  Patient_ID,
  Case_ID,
  Activity,
  Activity_Start_Time,
  COUNT(*) AS duplicate_count
FROM `careflow-hospital-analytics.CareFlow.event_logs`
GROUP BY
  Patient_ID,
  Case_ID,
  Activity,
  Activity_Start_Time
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;



---Check duplicate Case_ID + Activity + Timestamp
SELECT
  Case_ID,
  Activity,
  Activity_Start_Time,
  COUNT(*) AS occurrences
FROM `careflow-hospital-analytics.CareFlow.event_logs`
GROUP BY
  Case_ID,
  Activity,
  Activity_Start_Time
HAVING COUNT(*) > 1;


---Check waiting time
SELECT
  MIN(Waiting_Time_Minutes) AS minimum_waiting_time,
  MAX(Waiting_Time_Minutes) AS maximum_waiting_time,
  AVG(Waiting_Time_Minutes) AS average_waiting_time
FROM `careflow-hospital-analytics.CareFlow.event_logs`;


---Check timestamp order
SELECT
  Case_ID,
  Activity,
  Activity_Start_Time,
  Activity_End_Time
FROM `careflow-hospital-analytics.CareFlow.event_logs`
WHERE Activity_End_Time < Activity_Start_Time;