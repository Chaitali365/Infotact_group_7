# Infotact_group_7

# CareFlow – Hospital Patient Journey & Operations Analytics

## 📌 Project Overview

CareFlow is a hospital patient journey and operations analytics project designed to help hospital administrators understand patient waiting times and identify potential bottlenecks in the hospital workflow.

A patient's journey can involve multiple activities such as:

**Registration → Triage → Doctor → Lab Test → Billing**

The main objective is to analyze patient event data and present useful operational insights through an interactive Power BI dashboard.

---

## 🎯 Problem Statement

Hospitals may know the overall average waiting time of patients, but it can be difficult to identify exactly where patients are getting delayed.

CareFlow aims to help answer questions such as:

- Which hospital activity has the highest waiting time?
- Which departments have higher average waiting times?
- Where are potential bottlenecks occurring?
- How does patient priority affect hospital operations?
- What operational areas may require improvement?

---

## 🎯 Project Objectives

The project aims to:

- Track patient journeys across hospital activities
- Analyze patient waiting time
- Analyze treatment time
- Compare waiting times across activities
- Compare waiting times across departments
- Identify potential bottlenecks
- Analyze emergency cases
- Provide an interactive dashboard for hospital administrators

---

# 👨‍💻 My Role – Member 4

My responsibility in the project is **Power BI Dashboard Development and Data Visualization**.

My work includes:

- Importing the prepared patient event dataset into Power BI
- Validating and transforming the dataset in Power Query
- Creating analytical DAX measures
- Designing KPI cards
- Creating interactive visualizations
- Creating department and priority filters
- Identifying and highlighting waiting-time bottlenecks
- Designing the dashboard layout and user interface
- Applying a consistent healthcare-oriented visual theme
- Documenting dashboard development and insights

---

# 📊 Page 1 – Hospital Overview

## Purpose

The first dashboard page provides a high-level overview of hospital operations and patient waiting-time patterns.

It gives the user an initial understanding of:

- Total patient cases
- Completed cases
- Average waiting time
- Average treatment time
- Emergency cases
- Waiting time across hospital activities
- Waiting time across departments

---

## 📌 KPI Cards

The first page contains the following KPI cards:

### 1. Total Cases
Displays the total number of patient cases recorded in the dataset.

### 2. Completed Cases
Displays the number of completed patient cases.

### 3. Average Waiting Time
Shows the overall average waiting time across the recorded patient activities.

### 4. Average Treatment Time
Shows the average time spent by patients in hospital activities.

### 5. Emergency Cases
Shows the number of cases marked with emergency priority.

---

# 📈 Page 1 Visualizations

## 1. Average Waiting Time by Activity

This horizontal bar chart compares the average waiting time across different hospital activities.

The visualization helps identify which activity creates the largest waiting-time bottleneck.

The current analysis shows that the **Doctor activity has the highest average waiting time** among the displayed activities.

This makes it an important area for further investigation.

---

## 2. Average Waiting Time by Department

This visualization compares average waiting time across hospital departments.

A line-based visualization is used because the department-level waiting-time values are relatively close to each other.

The visualization makes small differences between departments easier to observe.

---

# 🎛️ Interactive Filters

Page 1 includes interactive filters for:

### Department
Allows users to analyze the dashboard for a specific hospital department.

### Priority
Allows comparison between different patient priorities, including:

- Emergency
- Normal

These filters dynamically affect the dashboard visuals.

---

# 🎨 Dashboard Design

The dashboard uses a clean healthcare-oriented visual design.

### Primary Color
**Blue** is used as the main accent color for:

- Icons
- Borders
- Charts
- Highlights
- Dashboard elements

### Background
A **light grey/white** background is used to maintain a clean and professional appearance.

The dashboard follows a limited color palette to improve consistency and readability.

---

# 🔎 Initial Insights

The first page provides the following initial insights:

- The **Doctor activity has the highest average waiting time** among the displayed activities.
- Waiting time varies across hospital departments.
- Emergency and normal cases can be analyzed separately using the Priority filter.
- The dashboard provides an interactive overview of hospital waiting-time patterns.

These insights will be expanded through additional dashboard pages.

---

# 🛠️ Technology Stack

- **Data Source:** Patient Event Log Dataset
- **Data Processing:** Power Query
- **Analytics & Measures:** DAX
- **Visualization:** Microsoft Power BI
- **Version Control:** GitHub

Other project components include data warehousing and process analysis, which are handled separately within the team.


## Page 2 — Patient Journey & Bottleneck Analysis

### Overview

Page 2 focuses on understanding the patient journey through different hospital activities and identifying potential bottlenecks in the healthcare process.

The page provides a detailed view of journey duration, waiting time, treatment time, and the activity creating the highest delay.

### Key KPIs

The following KPI cards were added:

- **Average Journey Time** — Average time taken by a patient case from the beginning to the end of the recorded journey.
- **Longest Journey Time** — Longest recorded patient journey duration.
- **Average Activities per Case** — Average number of hospital activities performed for each case.
- **Top Bottleneck Activity** — Activity with the highest average waiting time.
- **Top Bottleneck Wait Time** — Average waiting time associated with the identified bottleneck activity.

### Patient Journey Flow

The patient journey is represented as:

**Registration → Triage → Doctor → Lab Test → Billing**

The journey flow helps visualize the sequence of activities followed by patients during their hospital visit.

The **Doctor** activity is highlighted as the major bottleneck based on the highest waiting time observed in the analysis.

### Visualizations

#### 1. Activity-wise Waiting & Treatment Analysis

A clustered chart compares:

- Average Waiting Time
- Average Treatment Time
- Average Treatment per Case

across different hospital activities.

This helps distinguish between time spent waiting and time spent in treatment-related activities.

#### 2. Activity-wise Journey Time Comparison

A second chart compares:

- Average Journey Time
- Longest Journey Time

to understand the variation in patient journey duration.

### Filters

Interactive slicers were added for:

- **Department**
- **Priority**

These filters allow users to analyze patient journey and bottleneck information for specific departments or patient priority categories.

### Bottleneck Highlighting

The bottleneck activity is visually highlighted using **red** to immediately draw attention to the area requiring operational improvement.

The remaining dashboard follows the project's established **blue and grey healthcare theme** for consistency with Page 1.

### Page 2 Objective

The main objective of this page is to help hospital management understand:

- How patients move through different hospital activities
- Where waiting and journey time are higher
- Which activity acts as the primary bottleneck
- How waiting time compares with treatment time
- How the journey changes based on department and priority



# 📊 Page 3 — Doctor & Department Performance

### Objective
This page focuses on analysing doctor workload, department-level case volume, emergency case distribution, and treatment workload.

The main objective is to identify:
- Departments handling higher case volumes
- Doctors handling higher patient workloads
- Emergency vs Normal case distribution
- Relationship between doctor workload and treatment load

---

## 🔹 KPI Cards

### 1. Unique Doctors
**Measure used:**
- Unique Doctors

Shows the total number of distinct doctors available in the dataset.

### 2. Emergency Case %
**Measure used:**
- Emergency Case %

Shows the percentage of cases classified as Emergency.

### 3. Total Treatment Load
**Measure used:**
- Total Treatment Load Display

Shows the overall treatment workload in hours.

---

## 📈 Visualizations

### 1. Department-wise Case Volume
**Visual:** Column Chart

**Fields/Measures:**
- Department
- Total Unique Cases

**Purpose:**
Shows the number of unique cases handled by each department and helps identify departments with higher patient workload.

---

### 2. Emergency vs Normal Case Mix by Department
**Visual:** 100% Stacked Bar Chart

**Fields/Measures:**
- Department
- Priority
- Total Cases

**Purpose:**
Compares Emergency and Normal cases across departments and highlights departments with a higher proportion of emergency cases.

---

### 3. Doctor Workload Ranking
**Visual:** Horizontal Bar Chart

**Fields/Measures:**
- Doctor_Name
- Total Unique Cases

**Purpose:**
Ranks doctors based on the number of unique cases handled and helps identify higher workload among individual doctors.

---

### 4. Doctor Workload vs Treatment Load
**Visual:** Scatter Chart

**Fields/Measures:**
- X-Axis: Total Cases
- Y-Axis: Total Treatment Load
- Size: Treatment Load / relevant workload measure
- Legend: Priority

**Purpose:**
Analyses the relationship between doctor workload and treatment workload.

This helps identify doctors handling both high case volumes and high treatment loads.

---

## 🎛️ Slicers

The following slicers are used for interactive analysis:

- Department
- Priority

These slicers are synchronized across dashboard pages to maintain consistent filtering.

---

# 👥 Page 4 — Patient & Case Intelligence

### Objective
This page focuses on understanding the patient population, demographic distribution, clinical case mix, diagnostic test demand, and patient priority patterns.

The main objective is to identify:
- Patient demographic patterns
- Gender distribution
- Age-group distribution
- Most common diagnoses
- Diagnostic test demand
- Emergency vs Normal patient distribution

---

## 🔹 KPI Cards

### 1. Total Patients
**Measure used:**
- Total Patients

Shows the total number of patients represented in the dataset.

### 2. Emergency Patient %
**Measure used:**
- Emergency Patient %

Shows the percentage of patients classified as Emergency.

---

## 📊 Visualizations

### 1. Patient Demographic — Gender Distribution
**Visual:** Donut Chart

**Fields/Measures:**
- Gender
- Patient Count / Total Patients

**Purpose:**
Shows the distribution of patients by gender.

---

### 2. Clinical Case Mix by Diagnosis
**Visual:** Treemap

**Fields/Measures:**
- Diagnosis
- Patient Count / Total Patients

**Purpose:**
Shows the relative volume of different diagnoses and helps identify the most frequently occurring clinical cases.

---

### 3. Diagnostic Test Demand
**Visual:** Horizontal Bar Chart

**Fields/Measures:**
- Lab_Test
- Patient Count / Total Patients

**Purpose:**
Compares patients requiring diagnostic/laboratory testing with those who do not.

This helps understand the demand for diagnostic services.

---

### 4. Patient Profile by Priority
**Visual:** 100% Stacked Bar Chart

**Fields/Measures:**
- Gender
- Priority
- Patient Count / Total Patients

**Purpose:**
Shows Emergency vs Normal patient distribution across gender groups.

---

### 5. Patient Age Distribution
**Visual:** Column Chart

**Fields/Measures:**
- Age Group
- Patient Count / Total Patients

**Age Groups:**
- 0–18
- 19–30
- 31–45
- 46–60
- 60+

**Purpose:**
Identifies which age groups represent the largest share of the hospital's patient population.

---

## 🎛️ Slicers

The following interactive slicers are used:

- Priority
- Department

These slicers are synchronized across dashboard pages.

---

## 🎯 Key Insights Enabled

Page 4 allows users to understand:

- Which age groups form the largest patient population
- Gender distribution of patients
- Most common diagnoses
- Demand for diagnostic testing
- Emergency vs Normal patient distribution
- Impact of department and priority filters on patient profiles
