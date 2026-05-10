USE ecommerce_analytics;


-- Profit by discount band
SELECT
    discount_band,
    COUNT(*) AS order_lines,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(discount), 2) AS avg_discount,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY discount_band
ORDER BY avg_discount;


-- Discount impact by category
SELECT
    category,
    discount_band,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_margin
FROM superstore_orders
GROUP BY category, discount_band
ORDER BY category, discount_band;
