{{ config(materialized='view') }}
SELECT
    From_Activity,
    To_Activity,
    AVG(
        TIMESTAMP_DIFF(
            To_Start_Timestamp,
            From_End_Timestamp,
            MINUTE
        )
    ) AS Average_Waiting_Time_Minutes
FROM {{ ref('activity_transition') }}
GROUP BY
    From_Activity,
    To_Activity
