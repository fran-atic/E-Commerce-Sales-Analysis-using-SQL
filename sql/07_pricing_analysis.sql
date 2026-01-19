-- Pricing Analysis
-- 1) What is the average unit price per product?
select StockCode, `Description`, round(sum(Quantity * UnitPrice) / sum(Quantity), 2) as avg_unit_price,
sum(Quantity) as total_quantity_sold
from data_staging2
group by StockCode, `Description`
order by avg_unit_price desc;

-- 2) What are the products with price variation over time?
select StockCode, `Description`, count(distinct UnitPrice) as number_of_prices, min(UnitPrice) as min_price, max(UnitPrice) as max_price
from data_staging2
group by StockCode, `Description`
having count(distinct UnitPrice) > 1
order by number_of_prices desc;