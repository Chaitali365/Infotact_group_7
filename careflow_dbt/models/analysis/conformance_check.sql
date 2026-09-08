WITH event_sequence AS (
    SELECT
    Case_ID AS case_id,
    Activity_Name AS activity,
    Activity_Start_Timestamp AS event_timestamp,
    LEAD(Activity_Name) OVER (
        PARTITION BY Case_ID
        ORDER BY Activity_Start_Timestamp
    ) AS next_activity
FROM {{ ref('event_log') }}
),

conformance_results AS (
    SELECT
        e.case_id,
        r.rule_id,
        r.from_activity,
        r.to_activity,
        r.rule_type,
        e.activity,
        e.next_activity,

        CASE
            WHEN e.activity = r.from_activity
                 AND e.next_activity = r.to_activity
            THEN 'COMPLIANT'

            WHEN e.activity = r.from_activity
            THEN 'NON_COMPLIANT'

            ELSE 'NOT_APPLICABLE'
        END AS conformance_status

    FROM event_sequence e
    CROSS JOIN {{ ref('conformance_rules') }} r
)

SELECT
    case_id,
    rule_id,
    from_activity,
    to_activity,
    rule_type,
    activity,
    next_activity,
    conformance_status
FROM conformance_results
WHERE conformance_status != 'NOT_APPLICABLE'
ORDER BY case_id, rule_id