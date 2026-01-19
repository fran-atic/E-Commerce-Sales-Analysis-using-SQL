# 📊 E-Commerce Sales Analysis using SQL

## 🔹 Project Overview

This project performs an in-depth analysis of an e-commerce transactions dataset using SQL to extract meaningful business insights. The goal is to simulate a real-world business analytics case study and answer important questions related to sales, customers, products, pricing, and geography.

The analysis focuses on:
- Business KPIs
- Product performance
- Customer behavior
- Country-wise market analysis
- Pricing and outlier detection

---

## 🗂️ Dataset Description

The dataset contains transactional data with the following columns:

- InvoiceNo — Invoice number (order ID)
- StockCode — Product code (SKU)
- Description — Product name
- Quantity — Number of items purchased
- InvoiceDate — Date of transaction
- UnitPrice — Price per unit
- CustomerID — Unique customer ID
- Country — Customer country

---

## 🛠️ Tools & Technologies

- SQL (MySQL)
- Concepts used:
  - Aggregations (SUM, AVG, COUNT)
  - CTEs (WITH)
  - Window Functions (ROW_NUMBER, RANK)
  - Subqueries
  - Data Cleaning
  - Business KPI Calculations

---

## 📌 KPIs & Metrics Calculated

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value (AOV)
- Average Items per Invoice (Basket Size)
- Revenue per Customer
- Revenue per Country
- Customers per Country
- Average Unit Price per Product
- Product Price Variation
- Repeat vs One-time Customers
- Outlier Orders & Transactions

---

## ❓ Business Questions Answered

### 📦 Product Analysis
- Which products generate the highest revenue?
- Which products sell the most quantity?
- What are the least selling products?
- Which products sell in high quantity but generate low revenue?
- Which products show price variation over time?
- What is the average selling price per product?
- What are the top products per country?

### 👥 Customer Analysis
- How many unique customers are there?
- Who are the top customers by total spend?
- How many repeat vs one-time customers?
- What is the average number of orders per customer?

### 🌍 Country / Market Analysis
- What are the sales by country?
- Which countries contribute the highest revenue?
- How many customers are there per country?
- What is the average order value (AOV) by country?
- Which countries sell high quantity but generate low revenue?

### 🧾 Order & Transaction Analysis
- What is the average order value (AOV)?
- What is the average number of items per invoice?
- What is the largest invoice by value?
- Are there any outlier invoices or transactions?

---

## 🔍 Data Cleaning Steps
- Removed duplicate entries
- Checked for cancelled invoices (`InvoiceNo LIKE 'C%'`)
- Checked for returns (`Quantity < 0`)
- Removed zero or negative prices
- Checked for blank or null values
- Removed StockCodes which are not valid(5 integers + optional(alphabets))

---

## 🔥 Key Business Insights

- A small number of countries contribute the majority of revenue → geographic concentration risk
- Top products account for a large share of total revenue
- Some products sell in huge volume but generate very low revenue → pricing issue
- Some customers contribute disproportionately high revenue → VIP customers
- Several products show strong price variation → discounting or inconsistent pricing

---

## 💼 How This Project Helps

This project demonstrates:
- Strong SQL querying skills
- Business-oriented thinking
- KPI-driven analysis
- Ability to convert raw data into business insights

---

## 🚀 How to Run

1. Import the dataset into your SQL database(Table Data Import Wizard)
2. Run SQL files in order from the `sql/` folder

---

## 📈 Future Improvements

- Add Power BI / Tableau dashboard
- Add Python for visualization and forecasting
- Add profit & margin analysis (if cost data is available)

---

## 🧑‍💻 Author

**Rebanto Paul**  
SQL & Data Analytics Project

---
