USE ecommerce_analytics;

SELECT
    order_year_month,
    ROUND(SUM(sales), 2) AS monthly_sales,
    ROUND(SUM(profit), 2) AS monthly_profit,
    COUNT(DISTINCT order_id) AS monthly_orders
FROM superstore_orders
GROUP BY order_year_month
ORDER BY order_year_month;