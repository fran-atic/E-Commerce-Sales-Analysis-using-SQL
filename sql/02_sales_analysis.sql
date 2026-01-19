-- Sales and Revenue Analysis
-- 1) What is the total revenue?
 select round(sum(Quantity * UnitPrice), 2) as total_revenue from data_staging2;
 
 -- 2) What is the revenue by:
 -- a) Country
 select Country, round(sum(Quantity * UnitPrice), 2) as revenue_by_country from data_staging2
 group by Country
 order by revenue_by_country desc;
 
-- b) Product(StockCode / Description)
select StockCode, `Description`, round(sum(Quantity * UnitPrice), 2) as revenue_by_StockCode from data_staging2
group by StockCode, `Description`
order by revenue_by_StockCode desc;

-- 2) Which are the top 10 products by revenue?
select StockCode, `Description`, round(sum(Quantity * UnitPrice), 2) as revenue_by_StockCode from data_staging2
group by StockCode, `Description`
order by revenue_by_StockCode desc
limit 10;

-- 3) Which countries contribute the highest sales?
with country_revenue as
(
select Country, sum(Quantity * UnitPrice) as revenue_by_country from data_staging2
group by Country
)
select Country, revenue_by_country, round(revenue_by_country * 100.0 / sum(revenue_by_country) over(), 2) as revenue_percentage
from country_revenue
order by revenue_by_country desc;

-- 4) What is the average order value(AOV)?
select round(sum(Quantity *  UnitPrice) / count(distinct InvoiceNo), 2) as average_order_value
from data_staging2;