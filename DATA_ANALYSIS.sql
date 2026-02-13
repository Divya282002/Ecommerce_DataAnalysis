--Data Analysis

--Total_Revenue
SELECT SUM(quantity * price) AS total_revenue
FROM invoice_items;
--Other code for Total_Revenue
SELECT SUM(quantity * price) AS total_revenue
FROM ecommerce
WHERE CustomerID IS NOT NULL;

--Top 5 countries - HighestRevenue

drop view if exists RevenueByCountry;
create view RevenueByCountry as
select ii.country, sum(I.quantity*I.price) as TotalRevenue from invoices ii join invoice_items I on ii.invoice=I.invoice group by ii.country	
order by TotalRevenue DESC limit 5;

select * from RevenueByCountry;

--TOP 10 customer ID's By totalSpent

SELECT 
    invoices.customerid,
    SUM(invoice_items.quantity * invoice_items.price) AS total_spent
FROM invoices
JOIN invoice_items
ON invoices.invoice = invoice_items.invoice
GROUP BY invoices.customerid
ORDER BY total_spent DESC
LIMIT 10;

--MONTHLY SALES TREND.
SELECT 
    TO_CHAR(invoices.invoicedate, 'Month') AS month,
    SUM(invoice_items.quantity * invoice_items.price) AS revenue
FROM invoices
JOIN invoice_items
ON invoices.invoice = invoice_items.invoice
GROUP BY month
ORDER BY month;





