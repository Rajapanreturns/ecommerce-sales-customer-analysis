# E-commerce Sales & Customer Analysis

## Project Overview

This project analyzes an e-commerce sales dataset to understand business performance across time, product categories, customer segments, regions, and discount levels.

The project was built as an end-to-end analytics workflow using:

- **Python** for data cleaning and feature engineering
- **MySQL** for data storage, KPI queries, and analytical views
- **Power BI** for dashboarding and visualization

## Business Questions

This project explores questions such as:

1. How are sales and profits changing over time?
2. Which product categories and sub-categories generate the most sales and profit?
3. Which customer segments contribute the most revenue?
4. Which regions and states perform best or worst?
5. How do discounts affect profit margin and profitability?

## Tools Used

- Python
  - pandas
  - numpy
- MySQL
- Power BI
- Jupyter Notebook

## Project Workflow

1. Loaded and inspected the raw dataset in Python
2. Cleaned the data and standardized column names
3. Created derived columns such as:
   - `order_year`
   - `order_month`
   - `order_year_month`
   - `order_quarter`
   - `shipping_days`
   - `discount_band`
   - `is_profitable`
4. Imported the cleaned dataset into MySQL
5. Wrote SQL queries for:
   - Overall KPIs
   - Monthly sales trends
   - Category performance
   - Customer segment performance
   - Regional performance
   - Discount analysis
6. Created MySQL views for Power BI-ready reporting tables
7. Built an interactive Power BI dashboard

## Key Metrics

- Total Sales
- Total Profit
- Total Orders
- Total Customers
- Total Quantity Sold
- Average Order Value
- Profit Margin
- Average Discount

## Repository Structure

```text
ecommerce-sales-customer-analysis/
|── Dashboard/
│   ├── Dashboard_screenshot.png
|
├── data/
│   ├── raw/
│   ├── cleaned/
│   └── powerbi_exports/
│
├── notebooks/
│
├── sql/
│
├── README.md
└── .gitignore

## Dashboard

The Power BI dashboard includes:

- KPI cards for overall business performance
- Monthly sales and profit trends
- Category and sub-category performance
- Customer segment comparisons
- Regional analysis
- Discount band vs profitability analysis
