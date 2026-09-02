from google.cloud import bigquery
import pandas as pd
import pm4py
from pm4py.objects.conversion.log import converter as log_converter
from pm4py.algo.discovery.inductive import algorithm as inductive_miner
from pm4py.visualization.petri_net import visualizer as pn_visualizer


# BigQuery connection
PROJECT_ID = "gen-lang-client-0717975833"
TABLE = "careflow_staging.event_log"

client = bigquery.Client(project=PROJECT_ID)


# Read standardized event log from BigQuery
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
print("\nSample data:")
print(df.head())


# Prepare data for PM4Py
df = df.rename(columns={
    "Case_ID": "case:concept:name",
    "Activity_Name": "concept:name",
    "Activity_Start_Timestamp": "time:timestamp"
})

df["time:timestamp"] = pd.to_datetime(df["time:timestamp"])

event_log = log_converter.apply(
    df,
    variant=log_converter.Variants.TO_EVENT_LOG
)


# Discover process model using Inductive Miner
print("\nRunning PM4Py process discovery...")

process_tree = inductive_miner.apply(event_log)

print("Process discovery completed successfully.")

# Convert Process Tree to Petri Net
net, initial_marking, final_marking = pm4py.convert_to_petri_net(process_tree)

# Save discovered Petri net as PNG
gviz = pn_visualizer.apply(
    net,
    initial_marking,
    final_marking
)

pn_visualizer.save(gviz, "process_model.png")

print("\nProcess model saved as: process_model.png")