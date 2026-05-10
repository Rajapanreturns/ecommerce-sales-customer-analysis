USE ecommerce_analytics;

-- Category performance
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS units_sold,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY category
ORDER BY total_sales DESC;

-- Sub-category performance
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS units_sold,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY category, sub_category
ORDER BY total_profit DESC;

-- Top 10 products by sales
SELECT
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS units_sold
FROM superstore_orders
GROUP BY product_name, category, sub_category
ORDER BY total_sales DESC
LIMIT 10;

-- Products with high sales but negative profit
SELECT
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY product_name, category, sub_category
HAVING total_sales > 1000
   AND total_profit < 0
ORDER BY total_profit ASC;


