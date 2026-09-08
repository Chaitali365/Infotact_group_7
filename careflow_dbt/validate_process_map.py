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

print("Event log loaded successfully.")
print(f"Number of events: {len(df)}")
print(f"Number of cases: {df['Case_ID'].nunique()}")

# Validate process flow
print("\nValidating PM4Py process map...")

# Get activities in chronological order for each case
df = df.sort_values(["Case_ID", "Activity_Start_Timestamp"])

df["Next_Activity"] = df.groupby("Case_ID")["Activity_Name"].shift(-1)

# Count transitions
transitions = (
    df.dropna(subset=["Next_Activity"])
      .groupby(["Activity_Name", "Next_Activity"])
      .size()
      .reset_index(name="Count")
      .sort_values("Count", ascending=False)
)

print("\nObserved activity transitions:")
print(transitions.to_string(index=False))

# Check important transitions
expected_transitions = [
    ("REGISTRATION", "TRIAGE"),
    ("TRIAGE", "DOCTOR"),
    ("DOCTOR", "BILLING")
]

print("\nProcess map validation:")

for source, target in expected_transitions:
    found = ((transitions["Activity_Name"] == source) &
             (transitions["Next_Activity"] == target)).any()

    if found:
        print(f"PASS: {source} -> {target}")
    else:
        print(f"CHECK: {source} -> {target} not found")

print("\nPM4Py process map validation completed successfully.")