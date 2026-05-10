USE ecommerce_analytics;


CREATE OR REPLACE VIEW vw_overall_kpis AS
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS average_order_value,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders;


CREATE OR REPLACE VIEW vw_monthly_sales AS
SELECT
    order_year_month,
    order_year,
    order_month,
    ROUND(SUM(sales), 2) AS monthly_sales,
    ROUND(SUM(profit), 2) AS monthly_profit,
    COUNT(DISTINCT order_id) AS monthly_orders
FROM superstore_orders
GROUP BY order_year_month, order_year, order_month;


CREATE OR REPLACE VIEW vw_category_performance AS
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS units_sold,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY category, sub_category;


CREATE OR REPLACE VIEW vw_category_performance AS
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS units_sold,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY category, sub_category;


CREATE OR REPLACE VIEW vw_region_performance AS
SELECT
    region,
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY region, state;


CREATE OR REPLACE VIEW vw_discount_performance AS
SELECT
    category,
    discount_band,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(discount), 2) AS avg_discount,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY category, discount_band;