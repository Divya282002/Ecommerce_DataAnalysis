# Ecommerce_DataAnalysis
This project analyzes an e-commerce transactional dataset using PostgreSQL. 
The raw dataset was normalized into a relational schema (3NF) and analyzed 
to extract meaningful business insights such as revenue trends, top products, 
and customer performance.

The raw dataset was normalized into four tables:

1. **Customers**
   - CustomerID
   - Country

2. **Products**
   - StockCode
   - Description

3. **Invoices**
   - Invoice
   - InvoiceDate
   - CustomerID
   - Country

4. **Invoice_Items**
   - Invoice
   - StockCode
   - Quantity
   - Price
The following analytics were performed:

- Total Revenue Calculation
- Monthly Sales Trend Analysis
- Top 10 Best-Selling Products
- Top 10 Customers by Revenue
- Revenue by Country
