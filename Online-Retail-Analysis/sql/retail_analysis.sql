SHOW tables;
# Revenue by category
SELECT category, ROUND(SUM(revenue),2) AS total_revenue
FROM online_retail
GROUP BY category
ORDER BY total_revenue
DESC;

# Top 10 Product sold by Revenue
SELECT item_name, category, SUM(revenue) AS total_revenue 
FROM online_retail
GROUP BY item_name
ORDER BY total_revenue
DESC LIMIT 10;


# Top 10 Product sold by Revenue
SELECT item_name, category, sold_count
FROM online_retail
GROUP BY item_name
ORDER BY sold_count
DESC LIMIT 10;

# Top 10 Shops by Revenue
SELECT shopid, round(sum(revenue),0) AS shop_revenue
FROM online_retail
GROUP BY shopid
ORDER BY sum(revenue)
DESC LIMIT 10;

# Which categories generate the highest revenue and how much does each contribute to total revenue?
SELECT
    category,
    ROUND(SUM(revenue),2) AS category_revenue,
    ROUND(SUM(revenue)/
        (SELECT SUM(revenue) 
         FROM online_retail) * 100,2) AS contribution_pct
FROM online_retail
GROUP BY category
ORDER BY category_revenue DESC;

# Top 10 Products by Accumulated Units Sold
SELECT shopid, item_name, SUM(sold_count) AS units_sold
FROM online_retail
GROUP BY shopid, item_name
ORDER BY SUM(sold_count)
DESC LIMIT 10;

# Top 10 categories by accumulated units sold + contribution %
SELECT
    category,
    SUM(sold_count) AS category_sold,
    ROUND(SUM(sold_count)/
        (SELECT SUM(sold_count) 
         FROM online_retail) * 100,2) AS contribution_pct
FROM online_retail
GROUP BY category
ORDER BY category_sold DESC; 

# Revenue per accumulated unit by category
SELECT
    category,
    SUM(sold_count) AS category_sold,
    SUM(revenue) AS category_revenue,
    ROUND(SUM(revenue)/NULLIF(SUM(sold_count),0),2) AS unit_revenue
FROM online_retail
GROUP BY category
ORDER BY unit_revenue DESC; 

# Shop performance — listings vs revenue
SELECT
    shopid,
    COUNT(DISTINCT itemid) AS listings,
    SUM(sold_count) AS units_sold,
    ROUND(SUM(revenue), 0) AS revenue
FROM online_retail
GROUP BY shopid
ORDER BY revenue DESC
LIMIT 10;

# Category with highest average product price
SELECT
    category,
    ROUND(AVG(price), 2) AS avg_price,
    COUNT(DISTINCT itemid) AS listings
FROM online_retail
WHERE price_placeholder = 0
GROUP BY category
ORDER BY avg_price DESC;





