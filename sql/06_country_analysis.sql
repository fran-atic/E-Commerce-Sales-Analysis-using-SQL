-- Country & Geographic Analysis
-- 1) What are the sales by country?
select Country, round(sum(Quantity * UnitPrice), 2) as total_sales
from data_staging2
group by Country
order by total_sales desc;

-- 2) What are the customers per country?
select Country, count(distinct CustomerID) as number_of_customers
from data_staging2
group by Country
order by number_of_customers desc;

-- 3) What is the average order value per country?
with invoice_level as
(
select Country, InvoiceNo, sum(Quantity * UnitPrice) as invoice_value
from data_staging2
group by Country, InvoiceNo
)
select Country, round(avg(invoice_value), 2) as avg_order_value
from invoice_level
group by Country
order by avg_order_value desc;

-- 4) What are the countries with high quantity but low revenue?
with country_stats as
(
select Country, sum(Quantity) as total_quantity, sum(Quantity * UnitPrice) as total_revenue
from data_staging2
group by Country
)
select * from country_stats
where total_quantity > (select avg(total_quantity) from country_stats)
and total_revenue < (select avg(total_revenue) from country_stats);

-- 5) What are the top products per country?
with country_top_products as
(
select Country, StockCode, `Description`, round(sum(Quantity * UnitPrice), 2) as total_revenue
from data_staging2
group by Country, StockCode, `Description`
),
ranked_products as 
(
select *, row_number() over(partition by Country order by total_revenue desc) as rn
from country_top_products
)
select Country, StockCode, `Description`, total_revenue
from ranked_products
where rn = 1
order by total_revenue desc;