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
