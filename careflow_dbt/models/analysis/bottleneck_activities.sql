{{ config(materialized='view') }}
SELECT
    From_Activity,
    To_Activity,
    Average_Waiting_Time_Minutes
FROM
{{ ref('average_transition_time') }}