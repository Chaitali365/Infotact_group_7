{{ config(materialized='view') }}

SELECT
    From_Activity,
    To_Activity,
    Average_Waiting_Time_Minutes,

    SAFE_DIVIDE(
        Average_Waiting_Time_Minutes,
        SUM(Average_Waiting_Time_Minutes) OVER ()
    ) * 100 AS Bottleneck_Percentage

FROM {{ ref('bottleneck_activities') }}