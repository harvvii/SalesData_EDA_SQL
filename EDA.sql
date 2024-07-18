-- Unique cities in the dataset
SELECT DISTINCT city FROM sales;

--Unique branches in the dataset
SELECT DISTINCT branch FROM sales;

--Branches in each city
SELECT DISTINCT city, branch
FROM sales;

--------------------------------------------ANALYSIS BASED ON PRODUCT-----------------------------------------------

--Unique product line in the data
SELECT DISTINCT product_line from sales;

--Most selling product
SELECT product_line, SUM(quantity) AS qty
FROM sales
GROUP BY product_line
ORDER BY qty DESC;

--Most common payment method
SELECT payment_method, COUNT(payment_method) AS count1
FROM sales
GROUP BY payment_method
ORDER BY count1 DESC;

-- Highest sales by product line
SELECT product_line, SUM(total) AS sale_amt
FROM sales
GROUP BY product_line
ORDER BY sale_amt DESC;

-- Profit by product line
SELECT product_line, (SUM(total) - SUM(cogs)) AS profit
FROM sales
GROUP BY product_line
ORDER BY profit DESC;

--Product line performance in terms of sales eg. Show ‘good’, ‘bad’. Good if its greater that average sales.

-- Finding avg qty to determine good and bad status
SELECT AVG(quantity)
FROM sales;

SELECT
	product_line, AVG(quantity),
	(CASE
		WHEN AVG(quantity) > 5.00 THEN 'Good'
        ELSE 'Bad'
    END) AS remark
FROM sales
GROUP BY product_line;

-- Common product by gender
SELECT product_line, gender, COUNT(gender) AS total_gender
FROM sales
GROUP BY gender, product_line
ORDER BY total_gender DESC;

-- Average rating of each product
SELECT product_line, ROUND(AVG(ratings),2) AS avg_rating
FROM sales
GROUP BY product_line;

-- Product line with largest VAT -> VAT = 5% * cogs
SELECT product_line, ROUND(AVG(vat),2) AS avg_vat
FROM sales
GROUP BY product_line
ORDER BY avg_vat DESC;


-----------------------------------------------ANALYSIS BASED ON SALES-----------------------------------------------

--Total sales by month
SELECT month_name, SUM(total) AS total_sales
FROM sales
GROUP BY month_name;

-- Highest sales by a branch along with city
SELECT city,branch, SUM(total) AS total_sales
FROM sales
GROUP BY branch, city
ORDER BY total_sales DESC;

-- City with highest VAT
SELECT city, ROUND(AVG(vat),2) AS avg_vat
FROM sales
GROUP BY city
ORDER BY avg_vat DESC;

-- Month with highest COGS
SELECT month_name, SUM(cogs) AS scogs
FROM sales
GROUP BY month_name
ORDER BY scogs DESC;

-- Which customer type brings highest sales
SELECT customer_type, SUM(total) AS total_sales
FROM sales
GROUP BY customer_type
ORDER BY total_sales DESC;

-- Which customer type pays more VAT
SELECT customer_type, ROUND(AVG(vat),2) AS total_tax
FROM sales
GROUP BY customer_type
ORDER BY total_tax DESC;

-- Busiest time of the day in terms of sales
SELECT time_of_day, SUM(total) AS total_sales
FROM sales
GROUP BY time_of_day
ORDER BY total_sales DESC;

-- Highest sales by month
SELECT month_name, SUM(total) AS total_sales
FROM sales
GROUP BY month_name
ORDER BY total_sales DESC;

-- Highest rated branch
SELECT branch, ROUND(AVG(ratings),2) AS avg_ratings, city
FROM sales
GROUP BY branch, city
ORDER BY avg_ratings DESC;


----------------------------------------------ANALYSIS BASED ON PROFIT----------------------------------------------

-- Total Profit
SELECT SUM(total) - SUM(cogs) AS total_profit
FROM sales;

-- Highest profit making product
SELECT product_line, SUM(total) - SUM(cogs) AS total_profit
FROM sales
GROUP BY product_line
ORDER BY total_profit DESC;

-- Highest profit making branch
SELECT branch, SUM(total) - SUM(cogs) AS total_profit
FROM sales
GROUP BY branch
ORDER BY total_profit DESC;

-- Highest profitable month
SELECT month_name, SUM(total) - SUM(cogs) AS total_profit
FROM sales
GROUP BY month_name
ORDER BY total_profit DESC;



--------------------------------------------ANALYSIS BASED ON CUSTOMERS----------------------------------------------

-- Types of customers
SELECT DISTINCT customer_type
FROM sales;

-- Which customer buys more
SELECT customer_type, COUNT(customer_type) AS cust_count
FROM sales
GROUP BY customer_type;

-- Gender distribution per branch
SELECT branch, gender, COUNT(gender) AS gender_count
FROM sales
GROUP BY branch, gender
ORDER BY branch;

-- Gender distribution per branch: individual branch
SELECT
	gender,	COUNT(*) as gender_count
FROM sales
WHERE branch = 'A'
GROUP BY gender
ORDER BY gender_count DESC;