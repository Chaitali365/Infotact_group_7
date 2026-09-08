SELECT *
FROM UNNEST([
  STRUCT(
    1 AS rule_id,
    'REGISTRATION' AS from_activity,
    'TRIAGE' AS to_activity,
    'MANDATORY' AS rule_type,
    'Every patient should move from Registration to Triage.' AS rule_description
  ),

  STRUCT(
    2 AS rule_id,
    'TRIAGE' AS from_activity,
    'DOCTOR' AS to_activity,
    'MANDATORY' AS rule_type,
    'Every patient should move from Triage to Doctor.' AS rule_description
  ),

  STRUCT(
    3 AS rule_id,
    'DOCTOR' AS from_activity,
    'BILLING' AS to_activity,
    'MANDATORY' AS rule_type,
    'A patient should proceed from Doctor to Billing.' AS rule_description
  ),

  STRUCT(
    4 AS rule_id,
    'DOCTOR' AS from_activity,
    'LAB TEST' AS to_activity,
    'OPTIONAL' AS rule_type,
    'A Doctor may refer a patient for a Lab Test when required.' AS rule_description
  ),

  STRUCT(
    5 AS rule_id,
    'LAB TEST' AS from_activity,
    'DOCTOR' AS to_activity,
    'OPTIONAL' AS rule_type,
    'After a Lab Test, the patient may return to the Doctor.' AS rule_description
  )
])