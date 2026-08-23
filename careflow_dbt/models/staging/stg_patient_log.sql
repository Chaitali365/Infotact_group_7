{{ config(materialized='view') }}

select
    *
from {{ ref('patient_log') }}