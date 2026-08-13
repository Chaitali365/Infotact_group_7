---Check Table Structure
SELECT
  column_name,
  data_type
FROM `careflow-hospital-analytics.CareFlow.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'event_logs'
ORDER BY ordinal_position;


---Check how many records were loaded
SELECT COUNT(*) AS total_records
FROM `careflow-hospital-analytics.CareFlow.event_logs`;


---Display the data
SELECT *
FROM `careflow-hospital-analytics.CareFlow.event_logs`
LIMIT 20;



---Check activities
SELECT
  Activity,
  COUNT(*) AS event_count
FROM `careflow-hospital-analytics.CareFlow.event_logs`
GROUP BY Activity
ORDER BY event_count DESC;