--------------------------------------------------
-- DROP TABLES
--------------------------------------------------
DROP TABLE IF EXISTS invoice_items;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

--------------------------------------------------
-- CREATE TABLES
--------------------------------------------------

CREATE TABLE customers (
    CustomerID INT,
    Country VARCHAR(100),
    PRIMARY KEY (CustomerID, Country)
);

CREATE TABLE products (
    StockCode VARCHAR(20) PRIMARY KEY,
    Description TEXT
);

CREATE TABLE invoices (
    Invoice VARCHAR(20) PRIMARY KEY,
    InvoiceDate TIMESTAMP,
    CustomerID INT,
    Country VARCHAR(100),
    FOREIGN KEY (CustomerID, Country)
        REFERENCES customers(CustomerID, Country)
);

CREATE TABLE invoice_items (
    Invoice VARCHAR(20),
    StockCode VARCHAR(20),
    Quantity INT,
    Price NUMERIC(10,2),
    PRIMARY KEY (Invoice, StockCode),
    FOREIGN KEY (Invoice) REFERENCES invoices(Invoice),
    FOREIGN KEY (StockCode) REFERENCES products(StockCode)
);

--------------------------------------------------
-- INSERT DATA (SAFE VERSION)
--------------------------------------------------

-- Customers (one per CustomerID + Country)
INSERT INTO customers
SELECT CustomerID, Country
FROM ecommerce
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID, Country;

-- Products (one per StockCode)
INSERT INTO products (StockCode, Description)
SELECT StockCode, MIN(Description)
FROM ecommerce
GROUP BY StockCode;

-- Invoices (one per Invoice)
INSERT INTO invoices (Invoice, InvoiceDate, CustomerID, Country)
SELECT 
    Invoice,
    MIN(InvoiceDate),
    MIN(CustomerID),
    MIN(Country)
FROM ecommerce
WHERE CustomerID IS NOT NULL
GROUP BY Invoice;

-- Invoice Items (one per Invoice + StockCode)
INSERT INTO invoice_items (Invoice, StockCode, Quantity, Price)
SELECT 
    Invoice,
    StockCode,
    SUM(Quantity) AS Quantity,
    MIN(Price) AS Price
FROM ecommerce
WHERE CustomerID IS NOT NULL
GROUP BY Invoice, StockCode;




