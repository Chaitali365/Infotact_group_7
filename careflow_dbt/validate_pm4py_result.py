from google.cloud import bigquery
import pandas as pd

# BigQuery connection
PROJECT_ID = "gen-lang-client-0717975833"
TABLE = "careflow_staging.event_log"

client = bigquery.Client(project=PROJECT_ID)

# Load event log
query = f"""
SELECT
    Case_ID,
    Activity_Name,
    Activity_Start_Timestamp,
    Activity_End_Timestamp
FROM `{PROJECT_ID}.{TABLE}`
ORDER BY Case_ID, Activity_Start_Timestamp
"""

df = client.query(query).to_dataframe()

print("PM4Py validation started...")
print(f"Total events: {len(df)}")
print(f"Total cases: {df['Case_ID'].nunique()}")

# Create activity transitions
df = df.sort_values(["Case_ID", "Activity_Start_Timestamp"])

df["Next_Activity"] = (
    df.groupby("Case_ID")["Activity_Name"]
    .shift(-1)
)

transitions = df.dropna(subset=["Next_Activity"])[
    ["Activity_Name", "Next_Activity"]
].drop_duplicates()

print("\nDiscovered activity transitions:")
print(transitions.to_string(index=False))

# Expected mandatory transitions
mandatory_rules = [
    ("REGISTRATION", "TRIAGE"),
    ("TRIAGE", "DOCTOR"),
    ("DOCTOR", "BILLING")
]

# Optional transitions
optional_rules = [
    ("DOCTOR", "LAB TEST"),
    ("LAB TEST", "DOCTOR")
]

print("\n--- Mandatory Transition Validation ---")

for from_activity, to_activity in mandatory_rules:
    found = (
        (transitions["Activity_Name"] == from_activity)
        & (transitions["Next_Activity"] == to_activity)
    ).any()

    status = "PASS" if found else "FAIL"

    print(
        f"{from_activity} -> {to_activity}: {status}"
    )

print("\n--- Optional Transition Validation ---")

for from_activity, to_activity in optional_rules:
    found = (
        (transitions["Activity_Name"] == from_activity)
        & (transitions["Next_Activity"] == to_activity)
    ).any()

    status = "FOUND" if found else "NOT FOUND"

    print(
        f"{from_activity} -> {to_activity}: {status}"
    )

print("\nPM4Py validation completed successfully.")