select * from data;

-- Removing Duplicates 

create table data_staging like data;

insert into data_staging
select * from data;

select * from data_staging;

select *, row_number() over(partition by InvoiceNo, StockCode, `Description`, Quantity, InvoiceDate, UnitPrice, CustomerID, Country) as row_num
from data_staging;

with duplicate_cte as
(
select *, row_number() over(partition by InvoiceNo, StockCode, `Description`, Quantity, InvoiceDate, UnitPrice, CustomerID, Country) as row_num
from data_staging
)
select * from duplicate_cte where row_num > 1;

CREATE TABLE `data_staging2` (
  `InvoiceNo` int DEFAULT NULL,
  `StockCode` text,
  `Description` text,
  `Quantity` int DEFAULT NULL,
  `InvoiceDate` text,
  `UnitPrice` double DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `Country` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into data_staging2
select *, row_number() over(partition by InvoiceNo, StockCode, `Description`, Quantity, InvoiceDate, UnitPrice, CustomerID, Country) as row_num
from data_staging;

select * from data_staging2 where row_num > 1;

delete from data_staging2 where row_num > 1;

-- Checking for cancelled invoices 
select InvoiceNo from data_staging2 where InvoiceNo like 'C%';

-- Checking for returns(Quantity < 0) 
select * from data_staging2 where Quantity < 0;

-- Checking for zero or negative prices 
select * from data_staging2 where UnitPrice <= 0;
delete  from data_staging2 where UnitPrice <= 0;

-- Checking for blank or null values 
select InvoiceNo from data_staging2 where InvoiceNo = null or InvoiceNo = '';
select StockCode from data_staging2 where StockCode = null or StockCode = '';
select `Description` from data_staging2 where `Description` = null or `Description` = '';
select Quantity from data_staging2 where Quantity = null or Quantity = '';
select InvoiceDate from data_staging2 where InvoiceDate = null or InvoiceDate = '';
select UnitPrice from data_staging2 where UnitPrice = null or UnitPrice = '';
select CustomerID from data_staging2 where CustomerID = null or CustomerID = '';
select Country from data_staging2 where Country = null or Country = '';

-- Checking and removing StockCode which are not valid(5 integers + optional(alphabets))
select * from data_staging2 where StockCode not regexp '^[0-9]{5}([A-Za-z]+)?$';
delete from data_staging2 where StockCode not regexp '^[0-9]{5}([A-Za-z]+)?$';
