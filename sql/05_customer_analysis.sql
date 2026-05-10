USE ecommerce_analytics;

-- Customer segment performance
SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(sales) / COUNT(DISTINCT customer_id), 2) AS sales_per_customer,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY segment
ORDER BY total_sales DESC;


-- Top customers by sales
SELECT
    customer_id,
    customer_name,
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_orders
GROUP BY customer_id, customer_name, segment
ORDER BY total_sales DESC
LIMIT 10;


-- Repeat vs one-time customers
WITH customer_orders AS (
    SELECT
        customer_id,
        customer_name,
        COUNT(DISTINCT order_id) AS order_count,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM superstore_orders
    GROUP BY customer_id, customer_name
)
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS number_of_customers,
    ROUND(SUM(total_sales), 2) AS total_sales,
    ROUND(SUM(total_profit), 2) AS total_profit,
    ROUND(AVG(total_sales), 2) AS avg_sales_per_customer
FROM customer_orders
GROUP BY customer_type;