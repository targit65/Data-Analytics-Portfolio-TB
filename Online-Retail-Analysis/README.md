

# **Online Retail Marketplace – Business Data Analysis** 

# **Project Overview** 

This project analyses an online retail marketplace dataset to understand product performance, shop performance, pricing patterns, accumulated units sold, and revenue distribution. 

The objective is to transform raw marketplace listing data into meaningful business insights using Python, SQL, Excel and Power BI. 

# **Business Objectives** 

- Identify product categories contributing the highest accumulated revenue and units sold. 

- Analyse shop-level listing volume and accumulated revenue. 

- Identify top-performing products based on accumulated units sold and revenue. 

- Examine average listing prices across product categories. 

- Understand the distribution of listings across categories. 

- Identify data quality issues and improve data reliability before analysis. 

# **Tools & Technologies** 

- **Python:** Pandas, NumPy, Matplotlib, Seaborn 

- **SQL:** Business queries, aggregation and ranking 

- **Power BI:** Interactive dashboards, DAX measures and slicers 

- **Jupyter Notebook:** Data audit, cleaning, analysis and visualisation 

- **GitHub:** Project documentation and version control 

# **Project Workflow** 

1. Data Audit 

2. Data Cleaning and Preparation 

3. Exploratory Data Analysis 

4. Business Analysis 

5. SQL Analysis 

6. Power BI Dashboard Development 

7. Executive Business Report 

# **Power BI Dashboard** 

# **Page 1 – Business Performance Overview** 

Provides a high-level view of marketplace performance, including key business indicators and category/shop-level revenue insights. 

# **Page 2 – Product & Shop Performance Analysis** 

Includes: 

- Shop Listing Volume vs Accumulated Revenue 

- Top 10 Products by Accumulated Units Sold 

- Average Listing Price by Category 

 Listings by Category 

Interactive slicers allow filtering by Category, Item ID and Shop ID. 

# **Key Business Findings** 

- The dataset contains approximately 464,433 marketplace listings across 7,856 shops. 

- Approximately 94.32% of listings have zero recorded accumulated units sold. 

- Toys, Kids & Babies is the leading category by accumulated revenue. 

- Women’s Apparel and Health & Beauty are among the leading categories by accumulated units sold. 

- Data quality checks identified missing category information, incomplete descriptions, placeholder prices and suspicious stock values. 

# **Data Limitations** 

- The dataset contains listing-level information rather than individual transaction records. 

- sold_count represents accumulated units sold, not sales within a defined reporting period. 

- No transaction date is available; therefore, monthly or yearly sales trends cannot be established. 

- item_creation_date represents listing creation date, not the date of a sale. 

- Placeholder prices and suspicious stock values were identified and handled during data preparation. 

# **Repository Structure** 
```text
Online-Retail-Data-Analysis/
│
├── data/
│    └── README.md   
├── notebooks/
├── sql/
├── powerbi/
├── images/
└── README.md


```
# **Conclusion** 

This project demonstrates an end-to-end business data analysis workflow, from raw data auditing and preparation to SQL-based analysis and interactive Power BI reporting. 

The analysis highlights marketplace product and shop patterns while acknowledging the limitations of cumulative listing-level data. 

**Project Type:** Data Analytics | Business Intelligence **Status:** Analysis and dashboard completed; documentation in progress. 



