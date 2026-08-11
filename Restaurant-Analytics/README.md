## Project Overview

An end-to-end restaurant sales analysis project using Python, MySQL, and Power BI to understand revenue, orders, products, customer segments, locations, and monthly performance.

## Business Objectives

- Analyze overall revenue and order performance
- Identify high-performing products and locations
- Compare new vs returning customers
- Analyze revenue trends over time
- Identify unusual or potentially invalid transactions
- Develop an interactive Power BI dashboard

## Tools & Technologies

- Python / Pandas
- MySQL
- Power BI / DAX
- Excel

## Project Workflow

Raw Data → Python Data Cleaning → Exploratory Analysis → MySQL Analysis → Power BI Dashboard → Business Insights

## Data Quality Investigation

During the analysis, Order_ID "SW-216" was identified as an anomalous transaction. It was associated with multiple delivery locations and contained an unusually high transaction volume.

The transaction contributed approximately ₹126.40K of the original ₹158.41K reported revenue and materially distorted the business analysis. It was therefore excluded from the validated analytical dataset, while the original data was retained unchanged.

Validated revenue after exclusion: ** ₹32.01K **.

## Key Insights

- The original revenue was heavily distorted by the SW-216 anomaly.
- Chicken Biryani was the highest-revenue product in the initial analysis.
- Noida Sector-18 was the highest-revenue location in the initial analysis.
- Revenue from new and returning customers was approximately evenly distributed.
- The analysis highlighted the importance of validating transaction-level data before deriving business KPIs.

## Dashboard

The Power BI dashboard provides interactive analysis of:

- Revenue
- Orders
- Quantity
- Average Order Value
- Product performance
- Location performance
- Customer type
- Discount %
- Monthly revenue
- Customer feedback

## Project Deliverables

- **Python:** Data cleaning and analysis
- **SQL:** Business and KPI analysis
- **Power BI:** Interactive dashboard
- **Report:** Business insights and recommendations

## Key Takeaway

The project demonstrates an end-to-end analytical workflow and highlights the importance of **data quality validation before making business decisions**.

