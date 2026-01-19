-- Customer Analysis
-- 1) How many unique customers are there?
select count(distinct CustomerID) as unique_customers from data_staging2;

-- 2) Who are the top 10 customers by total spend? 
select CustomerID, round(sum(Quantity * UnitPrice), 2) as total_spent from data_staging2
group by CustomerID
order by total_spent desc
limit 10;

-- 3) How many repeat customers vs one-time customers?
select customer_type, count(*) as customer_count
from
(
	select CustomerID, count(distinct InvoiceNo) as total_orders,
    case
		when count(distinct InvoiceNo) = 1 then 'One-time Customer'
        else 'Repeat Customer'
    end as customer_type
    from data_staging2
    group by CustomerID
) test
group by customer_type;

-- 4) What is the average number of orders per customer?
select round(count(distinct InvoiceNo) / count(distinct CustomerID), 2) as avg_orders_per_customer
from data_staging2;