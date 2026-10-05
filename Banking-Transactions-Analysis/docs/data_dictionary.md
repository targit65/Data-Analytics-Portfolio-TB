Overview

This document describes the main fields used in the Bank Transactions Analysis project.

The dataset contains 1,048,567 transaction records and 9 original columns. Additional analytical fields are created during data preparation for time-based and business analysis.

Original Dataset Fields

Field	Description	Data Type	Usage
TransactionID	Unique identifier for each transaction	Integer	Transaction identification and duplicate validation
CustomerID	Unique identifier for the customer associated with the transaction	Integer	Customer-level analysis and segmentation
CustomerDOB	Customer date of birth	Date	Customer demographic analysis; quality validation required
CustGender	Customer gender	Categorical	Gender-based transaction analysis
CustLocation	Customer location	Categorical	Geographic and location-level analysis
CustAccountBalance	Customer account balance associated with the transaction record	Numeric	Balance analysis and data-quality validation
TransactionDate	Date of the transaction	Date	Daily, monthly and day-of-week analysis
TransactionTime	Time of the transaction	Time / Integer	Hour-level transaction analysis
TransactionAmount (INR)	Transaction amount in Indian Rupees	Numeric	Primary measure for transaction-value analysis
Derived / Analytical Fields

Additional fields are created during data preparation to support analysis.

Field	Description	Purpose

TransactionDateTime	Combined transaction date and time	Time-based analysis
TransactionHr	Hour extracted from transaction time	Hourly transaction analysis
DaysOfWeek	Day of the week derived from transaction date	Day-of-week analysis
Transaction Band	Transaction-value category	Customer/transaction segmentation
Location	Standardized broader location category	Geographic analysis
Location Rank	Rank of locations based on total transaction value
