{{ config(materialized='view') }}

select
    TRIM(UPPER(CAST(Patient_ID AS STRING))) AS Case_ID,
    TRIM(UPPER(CAST(Activity AS STRING))) AS Activity_Name,
    Visit_Date,
    Activity_Start_Time,
    Activity_End_Time,
    TIMESTAMP(DATETIME(Visit_Date, Activity_Start_Time)) AS Activity_Start_Timestamp,
    TIMESTAMP(DATETIME(Visit_Date, Activity_End_Time)) AS Activity_End_Timestamp,
    Patient_Name,
    Age,
    Gender,
    Department,
    Doctor_Name,
    Waiting_Time,
    Activity_Duration,
    Billing_Status

from {{ ref('stg_patient_log') }}