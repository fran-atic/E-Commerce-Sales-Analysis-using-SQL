-- Order / Invoice-Level Analysis
-- 1) What is the number of unique invoices?
select count(distinct InvoiceNo) as unique_invoices from data_staging2; 

-- 2) What is the average number of items per invoice?
select avg(items_per_invoice) as avg_items_per_invoice
from
(
select InvoiceNo, sum(Quantity) as items_per_invoice
from data_staging2
group by InvoiceNo
) test;

-- 3) What is the largest invoice by value?
select InvoiceNo, round(sum(Quantity * UnitPrice), 2) as total_invoice_value from data_staging2
group by InvoiceNo
order by total_invoice_value desc
limit 1;

-- 4) What is the smallest invoice by value?
select InvoiceNo, round(sum(Quantity * UnitPrice), 2) as total_invoice_value from data_staging2
group by InvoiceNo
order by total_invoice_value asc
limit 1;