DROP TABLE IF EXISTS invoice_items;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    CustomerID INT,
    Country VARCHAR(100),
    PRIMARY KEY (CustomerID, Country)
);

CREATE TABLE products (
    StockCode VARCHAR(20),
    Description TEXT,
    PRIMARY KEY (StockCode)
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

select * from ecommerce;
