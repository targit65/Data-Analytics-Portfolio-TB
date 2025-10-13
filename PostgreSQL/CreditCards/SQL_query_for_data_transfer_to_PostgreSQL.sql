-- Create Database ccdb


CREATE DATABASE ccdb;

-- Create table for card transactions

CREATE TABLE cards_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);


SELECT * 
FROM cards_detail;

-- Copy contents of credit_card.csv

COPY cards_detail
FROM 'D:\DataAnalysis\TBiswas\PGSQL\CreditCard\credit_card.csv'
DELIMITER ','
CSV HEADER;


-- Create table for customers detail

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(20),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(20),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(20),
    Customer_Job VARCHAR(20),
    Income INT,
    Cust_Satisfaction_Score INT
);


-- Copy contents of customer.csv

COPY cust_detail
FROM 'D:\DataAnalysis\TBiswas\PGSQL\CreditCard\customer.csv'
DELIMITER ','
CSV HEADER;

-- Add additional transaction and customer data to existing tables

COPY cards_detail
FROM 'D:\DataAnalysis\TBiswas\PGSQL\CreditCard\cc_add.csv'
DELIMITER ','
CSV HEADER;

COPY cust_detail
FROM  'D:\DataAnalysis\TBiswas\PGSQL\CreditCard\cust_add.csv'
DELIMITER ','
CSV HEADER;
