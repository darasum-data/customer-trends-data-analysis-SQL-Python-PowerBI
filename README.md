🛒 Customer Shopping Behavior Analysis: End-to-End Data Pipeline

![alt text](https://img.shields.io/badge/Python-3.8+-3776AB?style=flat&logo=python&logoColor=white)

![alt text](https://img.shields.io/badge/SQL-PostgreSQL-336791?style=flat&logo=postgresql&logoColor=white)

![alt text](https://img.shields.io/badge/Power_BI-Data_Visualization-F2C811?style=flat&logo=powerbi&logoColor=black)

📌 Project Overview

A leading retail company aims to better understand its customers' shopping behavior to improve sales, satisfaction, and long-term loyalty. This project analyzes 3,900 transactional records to uncover spending patterns, segment customers, and evaluate product performance using a full-stack data analytics approach.

🔄 Project Workflow

The project was executed following a structured 7-step data analyst roadmap:

![alt text](workflow_diagram.png)

(Note: Upload your workflow image to the repo and name it workflow_diagram.png)

Business Problem Statement: Defining core objectives.

Data Modeling & EDA (Python): Data cleaning and transformation.

Data Analysis (SQL): Running complex business transactions.

Interactive Dashboard (Power BI): Visualizing patterns and trends.

Project Report: Summarizing findings and metrics.

Presentation: Communicating insights via Gamma AI.

GitHub Repository: Documenting the end-to-end process.

🛠️ Phase 1: Data Preparation & EDA (Python)

Using Pandas, the raw dataset was processed to ensure high data quality:

Missing Data Handling: Imputed 37 missing values in the review_rating column using the median rating of each product category.

Standardization: Renamed columns to snake_case for better readability and database compatibility.

Feature Engineering:

Binned ages into age_group (Young Adult, Middle-aged, Adult, Senior).

Created a purchase_frequency_days column for temporal analysis.

Data Integration: Cleaned data was pushed directly into a PostgreSQL database via SQLAlchemy.

🔍 Phase 2: SQL - Business Insights

Structured queries were executed in PostgreSQL to simulate business transactions and answer critical questions:

Revenue by Gender: Male customers generated significantly higher revenue (
157
,
890
∗
∗
)
𝑐
𝑜
𝑚
𝑝
𝑎
𝑟
𝑒
𝑑
𝑡
𝑜
𝐹
𝑒
𝑚
𝑎
𝑙
𝑒
𝑠
(
∗
∗
157,890∗∗)comparedtoFemales(∗∗
75,191).

Customer Segmentation: Classified users into Loyal (79.9%), Returning (17.9%), and New (2.13%) segments.

High-Value Users: Identified 839 customers who utilized discounts but still spent above the average purchase amount.

Shipping Strategy: Express shipping yielded a higher average spend (
60.48
∗
∗
)
𝑐
𝑜
𝑚
𝑝
𝑎
𝑟
𝑒
𝑑
𝑡
𝑜
𝑆
𝑡
𝑎
𝑛
𝑑
𝑎
𝑟
𝑑
(
∗
∗
60.48∗∗)comparedtoStandard(∗∗
58.46).

📊 Phase 3: Power BI - Interactive Dashboard

The interactive dashboard provides a 360-degree view of business performance, allowing stakeholders to filter by Subscription Status, Gender, Category, and Shipping Type.

![alt text](dashboard_screenshot.png)

(Note: Upload your dashboard screenshot to the repo and name it dashboard_screenshot.png)

Key Performance Indicators (KPIs)

Total Revenue: $233.1K

Total Customers: 3.9K

Avg Purchase: $59.76

Avg Review Rating: 3.75

Avg Previous Purchases: 25.35

💡 Strategic Recommendations

Based on the analysis, the following business strategies were proposed:

Boost Subscriptions: Target the 73% of non-subscribers with exclusive benefits.

Loyalty Progression: Implement a reward system to move the "Returning" segment into the "Loyal" group.

Review Discount Policy: Protect margins by optimizing discounts for high-volume but low-margin products like Hats and Sneakers.

Targeted Marketing: Focus high-budget campaigns on the "Young Adult" age group, as they contribute the highest revenue ($62,143).

📂 Project Structure
code
Text
download
content_copy
expand_less
├── dashboards/ # Power BI .pbix file and screenshots
├── data/ # Raw and cleaned datasets (CSV)
├── docs/ # PDF documentation and Problem Statements
├── notebook/ # Jupyter Notebook (.ipynb) for Python EDA
├── reports/ # Final Project Report and Gamma AI slides
├── scripts/ # SQL query files (.sql)
├── LICENSE # MIT License
└── README.md # Project documentation
🌟 About Me

Hi there! I'm Dara Sum, also known as Data Analyst.

![alt text](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)
