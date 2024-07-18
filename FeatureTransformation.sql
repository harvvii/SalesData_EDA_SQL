-- Data Cleaning --
select * from sales;
-- Data does not have null because I have already filtered the null value out while importing the data

---------------------------------------------------------------------------------------------------------------------
 /*                                                Feauture Engineering
                             Generating new columns using date and time column for better analysis                 */

---------------------------------------------------------------------------------------------------------------------

/* Creating a column for time of the day eg. Morning, Afternoon, Evening
	This will help answer questions like busiest hours or when most sales made during a day. */
 -- Logic
SELECT TIME,
	(CASE 
		WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
		WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
		ELSE 'Evening'
	end
		) AS time_of_day
FROM sales;

-- Adding time_of_day column to the table
ALTER TABLE sales ADD time_of_day VARCHAR(20);

-- Updating colum time_of_day with data
UPDATE sales
SET time_of_day = (CASE 
		WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
		WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
		ELSE 'Evening'
	END);


/* Creating a column for name of the day eg. Mon, Tue, Wed, Thur and so on.
	This will help answer which day of the week is the busiest for each branch. */

-- Logic
SELECT date, FORMAT(date, 'ddd')
FROM sales;
--OR--
SELECT date, DATENAME(WEEKDAY,date)
FROM sales;

-- Adding day_name column to the table
ALTER TABLE sales ADD day_name VARCHAR(10);

-- Updating column day_name with data
UPDATE sales
SET day_name = DATENAME(WEEKDAY,date);


/* Creating a column for name of they month eg.Jan, Feb, Mar ETC.
	This will help answer which month had highest/lowest profit and sales */
-- Logic
SELECT date, DATENAME(MONTH,date)
FROM sales;

--Adding month_name column to the table
ALTER TABLE sales ADD month_name VARCHAR(10);

-- Updating columN month_name with data
UPDATE sales
SET month_name = DATENAME(MONTH,date);


-- Checking if newly created columns are as per the requirements
SELECT time_of_day, day_name, month_name
FROM sales;