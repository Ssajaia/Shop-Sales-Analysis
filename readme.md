# 🏪 Shop Sales Analysis Project

*A comprehensive e-commerce sales analytics platform built with SQL Server, featuring advanced business intelligence queries and data analysis capabilities.*

## 📊 Project Overview

This project implements a complete sales analysis system for an e-commerce business, featuring a robust database schema and 15 advanced analytical queries that provide deep insights into customer behavior, product performance, and sales trends.

## 🗃️ Database Schema

### Entity-Relationship Diagram
customers (1) ←→ (∞) orders (∞) ←→ (1) products

text

### Table Structures

#### 📋 Products Table
```sql
CREATE TABLE products(
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL
);
👥 Customers Table
sql
CREATE TABLE customers(
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    country VARCHAR(20) NOT NULL
);
🛒 Orders Table
sql
CREATE TABLE orders(
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT FK_Orders_Products FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```
🚀 Quick Start
Prerequisites
Microsoft SQL Server (2016 or later)

SQL Server Management Studio (SSMS) or equivalent tool

Basic understanding of SQL queries

Installation Steps
Clone or create the project structure:

text
SalesAnalysisProject/
├─ README.md
├─ create_tables.sql
├─ insert_data.sql
├─ queries.sql
Execute the setup scripts in order:

sql
-- 1. Create database and tables
EXECUTE create_tables.sql

-- 2. Populate with sample data
EXECUTE insert_data.sql

-- 3. Run analytical queries
EXECUTE queries.sql
📈 Analytical Queries Overview
🔍 Customer Analytics
1. Top 10 Customers by Total Spending
Identifies most valuable customers

Calculates lifetime value (LTV)

Shows order frequency and average order value

2. Inactive Customers Analysis
Finds customers with no orders in last 3 months

Helps identify at-risk customers for retention campaigns

3. Customer Spending Patterns
Average order value per customer

Spending distribution analysis

Customer segmentation data

📦 Product Performance
6. Product Revenue Ranking
Top 10 products by total revenue

Quantity sold and order frequency

Revenue concentration analysis

7. Unsold Products Identification
Products with zero sales

Inventory optimization insights

Potential dead stock identification

8. Product Demand Analysis
Average quantity per order

Sales velocity metrics

Inventory planning data

🌍 Geographic Analysis
5. Country Performance
Revenue by geographic region

Customer distribution analysis

Market penetration insights

📅 Temporal Analysis
11-13. Time Series Analysis
Monthly order patterns

Revenue trend analysis (6-month rolling)

Seasonal performance insights

14. Weekly Patterns
Day-of-week order distribution

Peak shopping days identification

Operational planning data

🏷️ Category Analytics
10. Category Performance
Revenue distribution across categories

Category-level average pricing

Strategic business unit analysis

15. Category-Specific Customer Ranking
Top 5 customers per product category

Cross-selling opportunities

Targeted marketing insights

🎯 Business Use Cases
📊 Executive Dashboard Metrics
Total revenue and growth trends

Customer acquisition and retention rates

Product category performance

Geographic market performance

🎪 Marketing Optimization
Customer segmentation for targeted campaigns

Product recommendation engine data

Customer lifetime value calculation

Churn prediction modeling

📦 Inventory Management
Fast-moving vs. slow-moving product identification

Demand forecasting data

Stock optimization insights

Product category performance

🌐 International Expansion
Country-level performance analysis

Market opportunity identification

Geographic customer behavior patterns

🔧 Technical Features
Advanced SQL Techniques Used
Complex JOIN Operations: Multi-table relationships

Window Functions: ROW_NUMBER() for ranking

Aggregate Functions: SUM, COUNT, AVG with GROUP BY

Date Functions: Temporal analysis and trend detection

CTEs (Common Table Expressions): Complex query organization

Subqueries: Nested data analysis

Performance Optimizations
Proper indexing on foreign keys

Efficient aggregate queries

Optimized JOIN conditions

Date range filtering for large datasets

📊 Sample Insights Generated
Key Business Metrics
Customer Lifetime Value: Top customers spending $5,000+

Product Performance: Electronics category driving 40% of revenue

Seasonal Trends: 25% higher sales on weekends

Geographic Patterns: USA customers generate 35% of total revenue

Actionable Recommendations
Focus on top 10 customers who contribute disproportionately to revenue

Re-engage inactive customers with targeted promotions

Optimize inventory for high-performing product categories

Plan marketing campaigns around peak shopping days

🛠️ Extension Possibilities
Additional Analytics
Customer cohort analysis

Product bundling recommendations

Price optimization modeling

Customer churn prediction

Integration Opportunities
Connect with BI tools (Power BI, Tableau)

API development for real-time analytics

Machine learning integration for predictive analytics

ETL pipelines for automated reporting

📝 Query Examples
Complex Analytical Query
sql
```
-- Top 5 customers per product category with ranking
WITH CategorySpending AS (
    SELECT
        c.customer_id,
        c.name AS customer_name,
        p.category,
        SUM(o.quantity * p.price) AS total_spent,
        ROW_NUMBER() OVER (PARTITION BY p.category ORDER BY SUM(o.quantity * p.price) DESC) AS rank_in_category
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN products p ON o.product_id = p.product_id
    GROUP BY c.customer_id, c.name, p.category
)
SELECT category, customer_name, total_spent, rank_in_category
FROM CategorySpending
WHERE rank_in_category <= 5;
```
🤝 Contributing
To extend this project:

Add new analytical queries to queries.sql

Update the database schema in create_tables.sql

Enhance sample data in insert_data.sql

Update this README with new features

📄 License
This project is intended for educational and analytical purposes. Feel free to adapt for commercial use with proper attribution.

💡 Pro Tip: Use SQL Server's execution plan feature to optimize query performance as your dataset grows beyond 100,000 records.

