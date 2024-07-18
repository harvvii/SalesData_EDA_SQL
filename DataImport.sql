-- Creating database
CREATE DATABASE WalmartSalesData

-- creating table in the database
CREATE TABLe sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    vat DECIMAL(10,2) NOT NULL,
    total DECIMAL(12, 2) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct DECIMAL(10,9),
    gross_income DECIMAL(12, 4),
    rating DECIMAL(4, 2)
);

-- I have imported a csv file using the Import Flat File section
-- Viewing the data
select * from sales;
