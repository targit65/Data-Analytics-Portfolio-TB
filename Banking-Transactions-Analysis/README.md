Bank Transactions Analysis

📊 Project Overview
An end-to-end Bank Transactions Data Analysis project using Python, MySQL, and Power BI to analyze more than 1 million banking transactions and identify transaction patterns, customer behavior, high-value transactions, temporal trends, and geographic concentration.
The project follows a practical analytics workflow:
Data Audit → Data Cleaning → Exploratory Data Analysis → SQL Business Analysis → Power BI Dashboard
The objective is to transform raw transaction data into actionable business insights that can support transaction monitoring, customer segmentation, location analysis, and management reporting.
________________________________________
🛠️ Tools & Technologies
•	Python
o	Pandas
o	NumPy
o	Matplotlib
o	Exploratory Data Analysis
o	Data cleaning and validation
•	MySQL
o	Data querying
o	Aggregations
o	Customer analysis
o	Location analysis
o	Ranking
o	Contribution analysis
o	Business-oriented SQL queries
•	Power BI
o	Interactive dashboards
o	KPI cards
o	Transaction analysis
o	Customer segmentation
o	Time-based analysis
o	Location performance analysis
•	GitHub
o	Project documentation
o	Version-controlled portfolio
________________________________________
📁 Dataset
The project uses a banking transaction dataset containing approximately 1.05 million transaction records.
Dataset dimensions
•	Rows: 1,048,567
•	Columns: 9 in the original dataset
•	Unique Transaction IDs: 1,048,567
•	Unique Customers: 884,265
The original dataset is not included in this repository where redistribution rights are not established.
________________________________________
🔍 Data Quality & Preparation
The dataset is audited before analysis to assess data quality and identify potential issues.
Key checks performed
•	Duplicate transaction identification
•	Transaction ID uniqueness validation
•	Missing-value analysis
•	Date and time validation
•	Customer-level validation
•	Gender and location completeness
•	DOB quality checks
•	Transaction amount distribution
•	Balance validation
•	Outlier identification
Important data-quality findings
•	No duplicate Transaction IDs were identified.
•	Missing values were present in fields such as DOB, gender, location, and balance.
•	DOB contained unrealistic historical and future values that required validation before customer-level analysis.
•	Transaction amounts showed a strongly right-skewed distribution.
•	High-value transactions were separately identified for business analysis.
________________________________________
📈 Key Business Findings
1. Overall Transaction Performance
•	Total Transaction Value: ₹1.651 billion
•	Average Transaction Value: ₹1,574.34
•	Median Transaction Value: ₹459.03
•	Maximum Transaction Value: ₹1.56 million
•	Total Transactions: 1,048,567
•	Unique Customers: 884,265
The difference between the mean and median transaction value indicates a highly right-skewed transaction distribution, with a relatively small number of large transactions contributing significantly to total transaction value.
________________________________________
2. Customer Transaction Behavior
Customers are analyzed based on their transaction frequency.
Customer frequency profile
•	One-time customers: 740,653
•	Repeat customers: 143,612
Approximately 84.2% of customers were one-time customers, while around 16.2% were repeat customers.
Repeat customers generated approximately ₹483.93 million in transaction value.
This provides an opportunity for further analysis of customer retention and repeat-transaction behavior.
________________________________________
3. High-Value Transactions
An IQR-based approach is used to identify unusually large transaction amounts.
IQR calculation
•	Q1: ₹161
•	Q3: ₹1,200
•	IQR: ₹1,039
•	Upper outlier threshold: ₹2,758.50
Using this threshold:
•	Outlier transactions: 112,134
•	Share of transactions: approximately 10.69%
•	Share of transaction value: approximately 65.93%
This demonstrates that transaction count and transaction value tell very different stories: a relatively small portion of transactions accounts for a substantial share of total value.
________________________________________
4. High-Value Transaction Segment
Transactions above the selected high-value threshold are separately analyzed.
•	High-value transactions: 23,816
•	Share of all transactions: approximately 2.27%
•	Transaction value: ₹659.02 million
•	Share of total transaction value: approximately 39.92%
•	Customers involved: 23,712
This segment is particularly relevant for transaction monitoring and customer-value analysis.
________________________________________
5. Time-Based Analysis
Transaction activity is analyzed by:
•	Date
•	Day of week
•	Hour
•	Transaction value
•	Transaction volume
Observations
•	The highest transaction count on a single day was 27,261 transactions.
•	The highest transaction-value day generated approximately ₹47.53 million.
•	Saturday recorded approximately ₹246.67 million in transaction value.
•	Monday recorded approximately ₹242.76 million.
•	8 PM had the highest transaction volume by hour, with approximately 97,053 transactions.
•	7 PM recorded approximately ₹148.84 million in transaction value.
These patterns can help identify peak transaction periods and support operational capacity planning.
________________________________________
🌍 Location Analysis
A separate Power BI page provides geographic analysis.
BANK TRANSACTIONS — LOCATION ANALYSIS
Location names are standardized into broader geographic categories to make location-level analysis more meaningful.
For example, different Mumbai-related location names are consolidated into a broader Mumbai category.
The location analysis includes:
•	Location ranking
•	Total transaction value by location
•	Location performance comparison
•	Ranked location table
The dashboard allows users to identify the locations contributing the highest transaction value.
________________________________________
📊 Power BI Dashboard
The Power BI report contains two main analytical pages.
Page 1 — BANK TRANSACTIONS ANALYSIS DASHBOARD
Focus areas:
•	Overall transaction KPIs
•	Transaction volume
•	Transaction value
•	Customer behavior
•	Transaction bands
•	Time-based transaction analysis
•	High-value transaction analysis
Page 2 — BANK TRANSACTIONS — LOCATION ANALYSIS
Focus areas:
•	Location performance
•	Location ranking
•	Total transaction value by location
•	Geographic concentration
________________________________________
🧮 SQL Business Analysis
MySQL is used to perform business-oriented analysis including:
•	Customer-level transaction totals
•	Date-level transaction analysis
•	Location-level transaction totals
•	Transaction-value contribution
•	Ranking locations and customers
•	Cumulative contribution analysis
•	High-value transaction identification
•	Top-percentage contribution analysis
The SQL analysis is designed around business questions rather than only technical SQL exercises.
________________________________________
🐍 Python Analysis
Python is used for:
•	Initial data inspection
•	Data-type validation
•	Missing-value analysis
•	Duplicate detection
•	Data cleaning
•	Date/time transformation
•	Customer segmentation
•	Transaction distribution analysis
•	Outlier detection
•	Exploratory analysis
The Python notebook provides the analytical foundation for the subsequent SQL and Power BI work.
________________________________________
💡 Business Questions Addressed
This project addresses questions such as:
1.	What is the overall transaction value and volume?
2.	What is the typical transaction amount?
3.	How concentrated is transaction value among high-value transactions?
4.	How many customers are one-time versus repeat customers?
5.	Which days and hours have the highest transaction activity?
6.	Which locations generate the highest transaction value?
7.	What proportion of transaction value comes from high-value transactions?
8.	Which customer and location segments deserve deeper investigation?
9.	How does transaction volume differ from transaction-value contribution?
________________________________________
📂 Repository Structure
Bank-Transactions-Analysis/
│
├── README.md
│
├── data/
│   └── README.md
│
├── python/
│   └── Bank_Transactions_EDA.ipynb
│
├── sql/
│   └── Bank_Transactions_Analysis.sql
│
├── powerbi/
│   └── Bank_Transactions_Dashboard.pbix
│
├── screenshots/
│   ├── Dashboard_Bank_transactions_Analysis_page1.jpg
│   └── Dashboard_Bank_txns_Location_Analysis_page2.jpg
│
└── documentation/
    └── data_dictionary.md
________________________________________
🎯 Skills Demonstrated
This project demonstrates practical skills in:
•	Data Cleaning
•	Data Quality Assessment
•	Exploratory Data Analysis
•	Python / Pandas
•	SQL / MySQL
•	Business Analysis
•	Customer Segmentation
•	Transaction Analysis
•	Outlier Analysis
•	Time-Series Analysis
•	Geographic Analysis
•	Power BI Dashboard Development
•	KPI Development
•	Data Visualization
•	Business Storytelling
________________________________________
🚀 Future Improvements
Potential extensions to the project include:
•	Customer lifetime value analysis
•	Customer retention analysis
•	Monthly cohort analysis
•	Location-level customer segmentation
•	Fraud/anomaly detection modelling
•	Predictive transaction analysis
•	Automated Power BI refresh
•	Advanced customer risk segmentation
________________________________________
👤 Author
Tarun Biswas
Data Analyst | Reporting & MIS | IT Operations
Interested in applying data analytics, SQL, Python, and Power BI to solve practical business problems.
________________________________________
⭐ Project Objective
The objective of this project is not simply to demonstrate technical tools, but to show how raw banking transaction data can be transformed into structured business insights and management-ready dashboards using a complete analytics workflow.


