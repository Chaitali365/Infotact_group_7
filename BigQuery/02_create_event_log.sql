---Create the table
CREATE TABLE `careflow-hospital-analytics.CareFlow.event_logs`
(
  Case_ID STRING,
  Patient_ID STRING,
  Patient_Name STRING,
  Age INT64,
  Gender STRING,
  Activity_Name STRING,
  Department STRING,
  Doctor STRING,
  Timestamp TIMESTAMP
);


---Verify if the table is created
SELECT *
FROM `careflow-hospital-analytics.CareFlow.event_logs`;