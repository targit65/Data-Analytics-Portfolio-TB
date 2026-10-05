# Bank Transactions Analysis

## 📊 Project Overview

An end-to-end **Bank Transactions Data Analysis project** using **Python, MySQL, and Power BI** to analyze more than **1 million banking transactions** and identify transaction patterns, customer behavior, high-value transactions, temporal trends, and geographic concentration.

The project follows a practical analytics workflow:

**Data Audit → Data Cleaning → Exploratory Data Analysis → SQL Business Analysis → Power BI Dashboard**

The objective is to transform raw transaction data into actionable business insights that can support transaction monitoring, customer segmentation, location analysis, and management reporting.

---

## 🛠️ Tools & Technologies

- **Python**
  - Pandas
  - NumPy
  - Matplotlib
  - Exploratory Data Analysis
  - Data cleaning and validation
- **MySQL**
  - Data querying
  - Aggregations
  - Customer analysis
  - Location analysis
  - Ranking
  - Contribution analysis
  - Business-oriented SQL queries
- **Power BI**
  - Interactive dashboards
  - KPI cards
  - Transaction analysis
  - Customer segmentation
  - Time-based analysis
  - Location performance analysis
- **GitHub**
  - Project documentation
  - Version-controlled portfolio

---

## 📁 Dataset

The project uses a banking transaction dataset containing approximately **1.05 million transaction records**.

**Dataset dimensions**

- **Rows:** 1,048,567
- **Columns:** 9 in the original dataset
- **Unique Transaction IDs:** 1,048,567
- **Unique Customers:** 884,265

> [!NOTE]
> The original dataset is not included in this repository because redistribution rights for the source dataset have not been established. The analysis files are designed to demonstrate the complete analytical workflow without redistributing the original data.

---

## 📖 Data Dictionary

The dataset contains **1,048,567 transaction records** and **9 original columns**. Additional analytical fields are created during data preparation for time-based and business analysis.

### Original Dataset Fields

| Field | Description | Data Type | Usage |
|-------|-------------|-----------|-------|
| `TransactionID` | Unique identifier for each transaction | Integer | Transaction identification and duplicate validation |
| `CustomerID` | Unique identifier for the customer associated with the transaction | Integer | Customer-level analysis and segmentation |
| `CustomerDOB` | Customer date of birth | Date | Customer demographic analysis; quality validation required |
| `CustGender` | Customer gender | Categorical | Gender-based transaction analysis |
| `CustLocation` | Customer location | Categorical | Geographic and location-level analysis |
| `CustAccountBalance` | Customer account balance associated with the transaction record | Numeric | Balance analysis and data-quality validation |
| `TransactionDate` | Date of the transaction | Date | Daily, monthly and day-of-week analysis |
| `TransactionTime` | Time of the transaction | Time / Integer | Hour-level transaction analysis |
| `TransactionAmount (INR)` | Transaction amount in Indian Rupees | Numeric | Primary measure for transaction-value analysis |

### Derived / Analytical Fields

Additional fields are created during data preparation to support analysis.

| Field | Description | Purpose |
|-------|-------------|---------|
| `TransactionDateTime` | Combined transaction date and time | Time-based analysis |
| `TransactionHr` | Hour extracted from transaction time | Hourly transaction analysis |
| `DaysOfWeek` | Day of the week derived from transaction date | Day-of-week analysis |
| `Transaction Band` | Transaction-value category | Customer/transaction segmentation |
| `Location` | Standardized broader location category | Geographic analysis |
| `Location Rank` | Rank of locations based on total transaction value | Location ranking and comparison |

---

## 🔍 Data Quality & Preparation

The dataset is audited before analysis to assess data quality and identify potential issues.

**Key checks performed**

- Duplicate transaction identification
- Transaction ID uniqueness validation
- Missing-value analysis
- Date and time validation
- Customer-level validation
- Gender and location completeness
- DOB quality checks
- Transaction amount distribution
- Balance validation
- Outlier identification

**Important data-quality findings**

- **No duplicate Transaction IDs** were identified.
- Missing values were present in fields such as DOB, gender, location, and balance.
- DOB contained unrealistic historical and future values that required validation before customer-level analysis.
- Transaction amounts showed a strongly right-skewed distribution.
- High-value transactions were separately identified for business analysis.

---

## 📈 Key Business Findings

### 1. Overall Transaction Performance

| Metric | Value |
|--------|------:|
| **Total Transaction Value** | ₹1.651 billion |
| **Average Transaction Value** | ₹1,574.34 |
| **Median Transaction Value** | ₹459.03 |
| **Maximum Transaction Value** | ₹1.56 million |
| **Total Transactions** | 1,048,567 |
| **Unique Customers** | 884,265 |

The difference between the mean and median transaction value indicates a highly right-skewed transaction distribution, with a relatively small number of large transactions contributing significantly to total transaction value.

### 2. Customer Transaction Behavior

Customers are analyzed based on their transaction frequency.

**Customer frequency profile**

- **One-time customers:** 740,653
- **Repeat customers:** 143,612

Approximately **83.8% of customers were one-time customers**, while around **16.2% were repeat customers**.

Repeat customers generated approximately **₹483.93 million** in transaction value.

This provides an opportunity for further analysis of customer retention and repeat-transaction behavior.

### 3. High-Value Transactions

An IQR-based approach is used to identify unusually large transaction amounts.

**IQR calculation**

- **Q1:** ₹161
- **Q3:** ₹1,200
- **IQR:** ₹1,039
- **Upper outlier threshold:** ₹2,758.50

Using this threshold:

- **Outlier transactions:** 112,134
- **Share of transactions:** approximately 10.69%
- **Share of transaction value:** approximately 65.93%

This demonstrates that transaction count and transaction value tell very different stories: a relatively small portion of transactions accounts for a substantial share of total value.

### 4. High-Value Transaction Segment

Transactions above the selected high-value threshold are separately analyzed.

- **High-value transactions:** 23,816
- **Share of all transactions:** approximately 2.27%
- **Transaction value:** ₹659.02 million
- **Share of total transaction value:** approximately 39.92%
- **Customers involved:** 23,712

This segment is particularly relevant for transaction monitoring and customer-value analysis.

### 5. Time-Based Analysis

Transaction activity is analyzed by:

- Date
- Day of week
- Hour
- Transaction value
- Transaction volume

**Observations**

- The highest transaction count on a single day was **27,261 transactions**.
- The highest transaction-value day generated approximately **₹47.53 million**.
- Saturday recorded approximately **₹246.67 million** in transaction value.
- Monday recorded approximately **₹242.76 million**.
- **8 PM** had the highest transaction volume by hour, with approximately **97,053 transactions**.
- **7 PM** recorded approximately **₹148.84 million** in transaction value.

These patterns can help identify peak transaction periods and support operational capacity planning.

---

## 🌍 Location Analysis

A separate Power BI page provides geographic analysis.

**BANK TRANSACTIONS — LOCATION ANALYSIS**

Location names are standardized into broader geographic categories to make location-level analysis more meaningful.

For example, different Mumbai-related location names are consolidated into a broader **Mumbai** category.

The location analysis includes:

- Location ranking
- Total transaction value by location
- Location performance comparison
- Ranked location table

The dashboard allows users to identify the locations contributing the highest transaction value.

---

## 📊 Power BI Dashboard

The Power BI report contains two main analytical pages.

> [!NOTE]
> The interactive `.pbix` file is not included because of GitHub file-size limitations. Dashboard screenshots are provided in the `screenshots` folder.

### Page 1 — BANK TRANSACTIONS ANALYSIS DASHBOARD

Focus areas:

- Overall transaction KPIs
- Transaction volume
- Transaction value
- Customer behavior
- Transaction bands
- Time-based transaction analysis
- High-value transaction analysis

![Bank Transactions Analysis Dashboard - Page 1](screenshots/Dashboard_Bank_transactions_Analysis_page1.jpg)

### Page 2 — BANK TRANSACTIONS — LOCATION ANALYSIS

Focus areas:

- Location performance
- Location ranking
- Total transaction value by location
- Geographic concentration

![Bank Transactions Location Analysis Dashboard - Page 2](screenshots/Dashboard_Bank_txns_Location_Analysis_page2.jpg)

---

## 🧮 SQL Business Analysis

MySQL is used to perform business-oriented analysis including:

- Customer-level transaction totals
- Date-level transaction analysis
- Location-level transaction totals
- Transaction-value contribution
- Ranking locations and customers
- Cumulative contribution analysis
- High-value transaction identification
- Top-percentage contribution analysis

The SQL analysis is designed around **business questions rather than only technical SQL exercises**.

---

## 🐍 Python Analysis

Python is used for:

- Initial data inspection
- Data-type validation
- Missing-value analysis
- Duplicate detection
- Data cleaning
- Date/time transformation
- Customer segmentation
- Transaction distribution analysis
- Outlier detection
- Exploratory analysis

The Python notebook provides the analytical foundation for the subsequent SQL and Power BI work.

---

## 💡 Business Questions Addressed

This project addresses questions such as:

- What is the overall transaction value and volume?
- What is the typical transaction amount?
- How concentrated is transaction value among high-value transactions?
- How many customers are one-time versus repeat customers?
- Which days and hours have the highest transaction activity?
- Which locations generate the highest transaction value?
- What proportion of transaction value comes from high-value transactions?
- Which customer and location segments deserve deeper investigation?
- How does transaction volume differ from transaction-value contribution?

---

## 📂 Repository Structure

```text
Bank-Transactions-Analysis/
│
├── README.md
│
├── Data/
│   └── README.md
│
├── python/
│   └── Bank_Transactions_EDA.ipynb
│
├── sql/
│   └── Bank_Transactions_Analysis.sql
│
└── screenshots/
│    ├── Dashboard_Bank_transactions_Analysis_page1.jpg
│    └── Dashboard_Bank_txns_Location_Analysis_page2.jpg
│
├── docs/
│   └── data_dictionary.md
```

---

## 🎯 Skills Demonstrated

This project demonstrates practical skills in:

- Data Cleaning
- Data Quality Assessment
- Exploratory Data Analysis
- Python / Pandas
- SQL / MySQL
- Business Analysis
- Customer Segmentation
- Transaction Analysis
- Outlier Analysis
- Time-Series Analysis
- Geographic Analysis
- Power BI Dashboard Development
- KPI Development
- Data Visualization
- Business Storytelling

---

## 🚀 Future Improvements

Potential extensions to the project include:

- Customer lifetime value analysis
- Customer retention analysis
- Monthly cohort analysis
- Location-level customer segmentation
- Fraud/anomaly detection modelling
- Predictive transaction analysis
- Automated Power BI refresh
- Advanced customer risk segmentation

---

## 👤 Author

**Tarun Biswas**

Data Analyst | Reporting & MIS | IT Operations

Interested in applying data analytics, SQL, Python, and Power BI to solve practical business problems.

---

## ⭐ Project Objective

The objective of this project is not simply to demonstrate technical tools, but to show how raw banking transaction data can be transformed into **structured business insights and management-ready dashboards** using a complete analytics workflow.
