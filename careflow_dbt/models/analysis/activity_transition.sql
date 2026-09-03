{{ config(materialized='view') }}

WITH ordered_events AS (
    SELECT
        Case_ID,
        Activity_Name,
        Activity_Start_Timestamp,
        Activity_End_Timestamp,

        LEAD(Activity_Name) OVER (
            PARTITION BY Case_ID
            ORDER BY Activity_Start_Timestamp
        ) AS Next_Activity,

        LEAD(Activity_Start_Timestamp) OVER (
            PARTITION BY Case_ID
            ORDER BY Activity_Start_Timestamp
        ) AS Next_Activity_Start_Timestamp

    FROM {{ ref('event_log') }}
)

SELECT
    Case_ID,
    Activity_Name AS From_Activity,
    Next_Activity AS To_Activity,
    Activity_Start_Timestamp AS From_Start_Timestamp,
    Activity_End_Timestamp AS From_End_Timestamp,
    Next_Activity_Start_Timestamp AS To_Start_Timestamp
FROM ordered_events
WHERE Next_Activity IS NOT NULL