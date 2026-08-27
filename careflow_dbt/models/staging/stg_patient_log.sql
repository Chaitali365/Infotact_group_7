{{ config(materialized='view') }}

select
    Patient_ID,
    Patient_Name,
    Age,
    Gender,
    SAFE.PARSE_DATE('%d-%m-%Y', Visit_Date) as Visit_Date,
    Department,
    Doctor_Name,

    TRIM(COALESCE(Activity, 'Unknown')) AS Activity,

    SAFE.PARSE_TIME('%H:%M', Activity_Start_Time) as Activity_Start_Time,
    SAFE.PARSE_TIME('%H:%M', Activity_End_Time) as Activity_End_Time,

    SAFE_CAST(Waiting_Time_Minutes AS INT64) as Waiting_Time,
    SAFE_CAST(Treatment_Time AS INT64) as Activity_Duration,

    TRIM(COALESCE(Billing_Status, 'Unknown')) AS Billing_Status

from {{ ref('patient_log') }}