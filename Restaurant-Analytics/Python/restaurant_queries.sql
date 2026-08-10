SHOW TABLES;

# Module -I Basic KPIs

SELECT SUM(Total_Price) as Revenue
FROM rest_data_tbl;
SELECT SUM(coalesce(Total_Price,0)) AS Total_Revenue
FROM rest_data_tbl;
# How many unique orders did we receive?
SELECT count(distinct Order_ID) AS unique_orders
FROM rest_data_tbl;
#What is the Average Transaction Value (ATV)?
SELECT avg(Total_Price) AS ATV
FROM rest_data_tbl; #  Total_Price by row numbers, not produce real AOV
# What is Average Order Value
WITH Order_list AS (SELECT Order_ID AS Orders, COUNT(*) AS Items,
SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Order_ID 
DESC)
SELECT ROUND(AVG(Revenue),2) AS AOV
FROM Order_list;            # It calculates Order numberes, Total revenue then AOV

# Total Quantity
SELECT SUM(Quantity) AS Total_Qty 
FROM rest_data_tbl;

# Module -II 
# 1. Top 10 Products by Revenue
SELECT Item_Name, SUM(Total_Price) AS Top10_Rev
FROM rest_data_tbl
GROUP BY Item_Name
ORDER BY Top10_Rev 
DESC LIMIT 10;
# 2. Bottom 10 Products by Revenue
SELECT Item_Name, SUM(Total_Price) AS Bottom10_Rev
FROM rest_data_tbl
GROUP BY Item_Name
ORDER BY Bottom10_Rev 
ASC LIMIT 10;
# 3. Top 10 Products by Quantity Sold
SELECT Item_Name, SUM(Quantity) AS Top10_Sold
FROM rest_data_tbl
GROUP BY Item_Name
ORDER BY Top10_Sold
DESC LIMIT 10;

# 4. Average Revenue per Product
SELECT ROUND(SUM(Total_Price) / COUNT(DISTINCT Item_Name),2) Avg_Rev_per_Item
FROM rest_data_tbl;       # 4. Average Revenue per Product

WITH Items_list AS (SELECT Item_name, SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Item_Name
ORDER BY Revenue
DESC)
SELECT ROUND(AVG(Revenue),2) AS Avg_Rev_Per_Item
FROM Items_list;

# 5. Revenue Contribution(%) by product
WITH revenue_list AS (SELECT Item_Name, sum(Total_Price) AS Items_Revenue
FROM rest_data_tbl
GROUP BY Item_Name)

SELECT Item_Name, Items_Revenue , ROUND(Items_Revenue *100/ SUM(Items_Revenue) OVER(),1) AS Contribution
FROM revenue_list
ORDER BY Items_Revenue
DESC;

# Module III : Customer Analysis
# Orders BY Customer type
SELECT Customer_Type, COUNT(Order_ID) AS Orders
FROM rest_data_tbl
GROUP BY Customer_Type
ORDER BY Orders
DESC;

# Revenue By Customer type
SELECT Customer_Type, SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Customer_Type
ORDER BY Revenue
DESC;

# Average Order Value by Customer Type
SELECT Customer_Type, ROUND(SUM(Total_Price)/COUNT(Order_ID),2) AS Avg_Order_Value
FROM rest_data_tbl
GROUP BY Customer_Type;

# Customer Type Contribution (%)
WITH cust_rev AS (SELECT Customer_Type, sum(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Customer_Type)

SELECT Customer_Type, Revenue , ROUND(Revenue *100/ SUM(Revenue) OVER(),1) AS Contribution
FROM cust_rev
ORDER BY Revenue
DESC;

# Module 4 : Location Analysis
# Revenue by Delivery Location
SELECT Delivery_Location, SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Delivery_Location
ORDER BY Revenue
DESC;

#Orders by Location
SELECT Delivery_Location, COUNT(Order_ID) AS Orders, DATE_FORMAT(Date, '%Y-%m') AS Month_Yr
FROM rest_data_tbl
GROUP BY Delivery_Location
ORDER BY Orders
DESC;

SELECT Delivery_Location, Order_ID, Date
FROM rest_data_tbl
WHERE Order_ID = "SW-216";

#Average Revenue by Location
SELECT Delivery_Location, ROUND(SUM(Total_Price)/COUNT(Order_ID),2) AS Avg_Rev_Loc
FROM rest_data_tbl
GROUP BY Delivery_Location
ORDER BY Avg_Rev_Loc
DESC;

#Best Performing Location
SELECT Delivery_Location, SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Delivery_Location
ORDER BY Revenue
DESC
LIMIT 1;

#Lowest Performing Location
SELECT Delivery_Location, SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Delivery_Location
ORDER BY Revenue
ASC
LIMIT 1;

# Module 6 : Time Analysis
# Daily Revenue
SELECT Date, SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Date
ORDER BY Revenue
DESC;
# Daily Average Revenue
SELECT ROUND(SUM(Total_Price) / COUNT(distinct Date),2) AS Daily_Revenue
FROM rest_data_tbl;
WITH DailyRevenue AS (SELECT Date, SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Date
ORDER BY Revenue
DESC)
SELECT ROUND(AVG(Revenue),2)
FROM DailyRevenue;

# Monthly Revenue
SELECT DATE_FORMAT(Date, '%Y-%m') AS Month_Yr,
SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Month_Yr;
# Monthly Orders
SELECT DATE_FORMAT(Date, '%Y-%m') AS Month_Yr,
COUNT(DISTINCT Order_ID) AS Orders
FROM rest_data_tbl
GROUP BY Month_Yr;

# Monthly Quantity sold
SELECT DATE_FORMAT(Date, '%Y-%m') AS Month_Yr,
SUM(Quantity) AS Monthly_qty
FROM rest_data_tbl
GROUP BY Month_Yr;

# Running Revenue (Window Function)
WITH MonthlyRev AS (SELECT DATE_FORMAT(Date, '%Y-%m') AS Month_Yr,
SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Month_Yr)
SELECT Month_Yr, Revenue, SUM(Revenue) OVER(order by Month_Yr) AS Running_Rev
FROM MonthlyRev
GROUP BY Month_Yr;

# Monthly Growth
WITH MonthlyRev AS (SELECT DATE_FORMAT(Date, '%Y-%m') AS Month_Yr,
SUM(Total_Price) AS Curr_Month_Revenue
FROM rest_data_tbl
GROUP BY Month_Yr)
SELECT Month_Yr, Curr_Month_Revenue, LAG(Curr_Month_Revenue,1) OVER(order by Month_Yr) AS Pre_Month_Revenue,
ROUND(Curr_Month_Revenue - LAG(Curr_Month_Revenue,1) OVER(order by Month_Yr),2) AS Growth,
ROUND((Curr_Month_Revenue - LAG(Curr_Month_Revenue,1) OVER(order by Month_Yr)) *100/ LAG(Curr_Month_Revenue,1) OVER(order by Month_Yr)) AS Growth_percent
FROM MonthlyRev
GROUP BY Month_Yr;
 
# Revenue Ranking
WITH monthly_rev AS (SELECT DATE_FORMAT(Date, '%Y-%m') AS Month_Yr,
SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Month_Yr)
SELECT Month_Yr, Revenue, RANK() OVER(order by Revenue) AS Revenue_Rank
FROM monthly_rev
GROUP BY Month_Yr;
# Dense Rank
WITH monthly_rev AS (SELECT DATE_FORMAT(Date, '%Y-%m') AS Month_Yr,
SUM(Total_Price) AS Revenue
FROM rest_data_tbl
GROUP BY Month_Yr)
SELECT Month_Yr, Revenue, DENSE_RANK() OVER(order by Revenue) AS Rev_Dense_Rank
FROM monthly_rev
GROUP BY Month_Yr;

SELECT Delivery_Location, COUNT(*) AS No_of_Rows, SUM(Quantity) AS Quantity, SUM(Total_Price) AS Revenue
FROM rest_data_tbl
WHERE Order_ID = 'SW-216'
GROUP BY Delivery_Location
ORDER BY Revenue DESC;

SELECT Order_ID, Date, COUNT(DISTINCT Delivery_Location) AS Location_Count
FROM rest_data_tbl
GROUP BY Order_ID, Date
HAVING COUNT(DISTINCT Delivery_Location) > 1
ORDER BY Location_Count DESC;

SELECT Order_ID, COUNT(*) AS Orders, Date, Delivery_Location
FROM rest_data_tbl
WHERE Date = '2025-04-14'
GROUP BY Order_ID;

SELECT Order_ID, Date, COUNT(DISTINCT Delivery_Location) AS Location_Count
FROM rest_data_tbl
GROUP BY Order_ID, Date
HAVING COUNT(DISTINCT Delivery_Location) > 1
ORDER BY Location_Count DESC;

SELECT Order_ID, Date, Delivery_Location, Item_Name, Quantity, Total_Price
FROM rest_data_tbl
WHERE Order_ID IN ('SW-214', 'SW-215', 'SW-216')
ORDER BY Order_ID, Delivery_Location, Item_Name;

# Create a New Table rest_data_validated excluding SW-216
CREATE TABLE rest_data_validate AS
SELECT * 
FROM rest_data_tbl 
WHERE Order_ID <> 'SW-216';

SELECT AVG(Quantity) AS AVG_Order_Qty
FROM rest_data_validate;

SELECT Order_ID, COUNT(*) AS Orders, SUM(Quantity) AS Qty
FROM rest_data_tbl
WHERE Order_ID = 'SW-216';

SELECT Order_ID, Date, COUNT(DISTINCT Delivery_Location) AS Location_Count
FROM rest_data_tbl
GROUP BY Order_ID, Date
HAVING COUNT(DISTINCT Delivery_Location) > 1
ORDER BY Location_Count DESC;

SELECT Order_ID, COUNT(*) AS Orders, Date, Delivery_Location
FROM rest_data_tbl
WHERE Date = '2025-04-14'
GROUP BY Order_ID;

SELECT Order_ID, Date, COUNT(DISTINCT Delivery_Location) AS Location_Count
FROM rest_data_tbl
GROUP BY Order_ID, Date
HAVING COUNT(DISTINCT Delivery_Location) > 1
ORDER BY Location_Count DESC;

SELECT Order_ID, Date, Delivery_Location, Item_Name, Quantity, Total_Price
FROM rest_data_tbl
WHERE Order_ID IN ('SW-214', 'SW-215', 'SW-216')
ORDER BY Order_ID, Delivery_Location, Item_Name;

SELECT SUM(Total_Price) AS Revenue
FROM rest_data_validate;