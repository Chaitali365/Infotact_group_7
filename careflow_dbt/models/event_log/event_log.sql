{{ config(materialized='view') }}

select
    Patient_ID as Case_ID,
    Activity as Activity_Name,
    Visit_Date,
    Activity_Start_Time,
    Activity_End_Time,
    Patient_Name,
    Age,
    Gender,
    Department,
    Doctor_Name,
    Waiting_Time,
    Activity_Duration,
    Billing_Status

from {{ ref('stg_patient_log') }}