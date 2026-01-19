-- Product Performance Analysis
-- 1) Which products sell the most quantity?
select StockCode, `Description`, sum(Quantity) as total_qty_sold
from data_staging2
group by StockCode, `Description`
order by total_qty_sold desc
limit 20;

-- 2) Which products generate the hightest revenue?
select StockCode, `Description`, round(sum(Quantity * UnitPrice), 2) as total_revenue from data_staging2
group by StockCode, `Description`
order by total_revenue desc
limit 20;

-- 3) Products with high quantity but low revenue(pricing issue)?
select StockCode, `Description`, sum(Quantity) as total_qty_sold, round(sum(Quantity * UnitPrice), 2) as total_revenue
from data_staging2
group by StockCode, `Description`
order by total_qty_sold desc, total_revenue asc
limit 20;

-- 4) Least selling products  
select StockCode, `Description`, sum(Quantity) as total_quantity, round(sum(Quantity * UnitPrice), 2) as total_revenue
from data_staging2
group by StockCode, `Description`
having sum(Quantity) < 10
order by total_quantity asc, total_revenue asc;