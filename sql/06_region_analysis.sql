USE ecommerce_analytics;


-- Regional performance
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY region
ORDER BY total_sales DESC;


-- State performance
SELECT
    state,
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY state, region
ORDER BY total_profit ASC;


-- Loss-making states
SELECT
    state,
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY state, region
HAVING total_profit < 0
ORDER BY total_profit ASC;