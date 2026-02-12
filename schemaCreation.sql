
--schema creation according to csv input
drop table if exists ecommerce;
create table ecommerce(
   Invoice	varchar(50),
   StockCode varchar(50),	
   Description	text,
   Quantity	integer,
   InvoiceDate timestamp,	
   Price numeric(10,2),
   CustomerID integer,
   Country text

);
select * from ecommerce;
