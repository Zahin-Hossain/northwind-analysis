# Northwind Sales Analysis — SQL & Python

## Overview
An analysis of sales performance across time, product categories, orders, and individual products, using the Northwind sample database. Combines SQL Server queries (joins, CTEs, window functions) with Python (pandas/matplotlib) for visualization.

## Data Source
[Northwind sample database](https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/northwind-pubs) — Microsoft's official sample database for SQL Server, used here to practice multi-table joins and relational analysis.

## Business Problem
Understanding revenue trends over time, which product categories and products drive the most revenue, and whether any products in the catalog are going unsold, can inform sales strategy and inventory decisions.

## Tools Used
- **SQL (T-SQL / SQL Server)** — joins, CTEs, window functions, anti-join pattern
- **Python (pandas, matplotlib, SQLAlchemy)** — pulling query results directly from SQL Server and visualizing them

## Analysis
- Built a master sales report joining Orders, Customers, Employees, Order Details, Products, and Categories into one row-per-order-line dataset
- Calculated monthly revenue trends (Jul 1996 – Apr 1998)
- Calculated total revenue by product category
- Ranked products by revenue within each category using `RANK()`, filtered to the top 3 per category
- Checked for products with zero recorded orders using a `LEFT JOIN` + `IS NULL` anti-join pattern

## Key Insights
- **Monthly revenue grew from ~$28K to over $120K** across the dataset's timeframe (Jul 1996 – Apr 1998) — a trend worth flagging to sales leadership for forecasting and staffing decisions, though the dataset alone can't confirm what drove the growth
- **Beverages and Dairy Products are the top two revenue categories**, each well ahead of the remaining six categories — relevant to inventory prioritization and supplier negotiation focus
- **Every product in the catalog has been ordered at least once** (zero results from the products-never-ordered query) — useful for catalog/inventory management, since it means there's no dead stock to flag for discontinuation based on this data alone

## Repository Contents
- `sql/01_schema_exploration.sql` — initial exploration of all 13 tables
- `sql/02_revenue_by_order.sql` — revenue per order
- `sql/03_revenue_by_category.sql` — revenue by product category
- `sql/04_products_never_ordered.sql` — anti-join check for unsold products
- `sql/05_master_sales_report.sql` — full joined dataset exported to Python
- `sql/06_top3_products_per_category.sql` — top 3 products per category via window function
- `notebooks/sales_analysis.ipynb` — Python analysis and chart generation
- `charts/monthly_revenue_trend.png`, `charts/revenue_by_category.png`, `charts/top3_products_per_category.png`

## Skills Demonstrated

**SQL:**
- Multi-table joins (up to 6 tables in one query)
- Common Table Expressions (CTEs)
- Window functions (`RANK() OVER PARTITION BY`)
- Anti-join pattern (`LEFT JOIN` + `IS NULL`) for finding unmatched records

**Python:**
- Connecting to SQL Server from Python via SQLAlchemy
- Data aggregation and reshaping with pandas (`groupby`, date period conversion)
- Chart generation with matplotlib (line and grouped bar charts)
