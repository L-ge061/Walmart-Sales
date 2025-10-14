-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;


-- Create table
CREATE TABLE IF NOT EXISTS walmartSales.sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

-- Data cleaning
SELECT * FROM sales;


-- Add the time_of_day column
SELECT time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) 
    AS time_of_day
FROM sales;


ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);


-- Add day_name column
SELECT date, DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);


-- Add month_name column
SELECT date, MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);




-- ---------------------------- Generic ------------------------------ --
-- How many unique cities does the data have?
SELECT DISTINCT city
FROM sales;

-- In which city is each branch?
SELECT DISTINCT city, branch
	FROM sales;

-- Number of transactions per branch
SELECT branch, COUNT(*) AS total_transactions
	FROM sales
	GROUP BY branch
	ORDER BY total_transactions DESC;

-- Total sales per city
SELECT city, SUM(total) AS total_sales
	FROM sales
	GROUP BY city
	ORDER BY total_sales DESC;

-- Average rating per branch
SELECT branch, ROUND(AVG(rating),2) AS avg_rating
	FROM sales
	GROUP BY branch
	ORDER BY avg_rating DESC;


-- ---------------------------- Product ------------------------------- --
-- How many unique product lines does the data have?
SELECT DISTINCT product_line
	FROM sales;


-- Most selling & Least Selling product line
SELECT SUM(quantity) AS qty, product_line
	FROM sales
	GROUP BY product_line
	ORDER BY qty DESC;


-- Total revenue by month
SELECT month_name AS month, 
	SUM(total) AS total_revenue
	FROM sales
	GROUP BY month_name 
	ORDER BY total_revenue;


-- What month had the largest COGS?
SELECT month_name AS month,
	SUM(cogs) AS cogs
	FROM sales
	GROUP BY month_name 
	ORDER BY cogs;


-- What product line had the largest revenue?
SELECT product_line, SUM(total) AS total_revenue
	FROM sales
	GROUP BY product_line
	ORDER BY total_revenue DESC;

-- What is the city with the largest revenue?
SELECT branch, city, SUM(total) AS total_revenue
	FROM sales
	GROUP BY city, branch 
	ORDER BY total_revenue;


-- What product line had the largest VAT?
SELECT product_line, AVG(tax_pct) AS avg_tax
	FROM sales
	GROUP BY product_line
	ORDER BY avg_tax DESC;


-- Label each product line as "Good" if its avg quantity is above overall average, else "Bad"

SELECT 
    product_line,
    ROUND(AVG(quantity), 2) AS avg_quantity,
    CASE
        WHEN AVG(quantity) > (SELECT AVG(quantity) FROM sales) THEN 'Good'
        ELSE 'Bad'
    END AS remark
FROM sales
GROUP BY product_line;



-- Which branch sold more products than average product sold?
SELECT branch, SUM(quantity) AS total_quantity
	FROM sales
	GROUP BY branch
	HAVING SUM(quantity) > (
		SELECT AVG(branch_total)
		FROM (
			SELECT SUM(quantity) AS branch_total
			FROM sales
			GROUP BY branch
		) AS branch_sums
	);



-- Which product line generated the highest gross income?
SELECT product_line, SUM(gross_income) AS total_gross_income
	FROM sales
	GROUP BY product_line
	ORDER BY total_gross_income DESC;


-- Average rating of each product line
SELECT ROUND(AVG(rating), 2) AS avg_rating,
    product_line
	FROM sales
	GROUP BY product_line
	ORDER BY avg_rating DESC;
    
    
-- Which product lines perform best in each branch?
SELECT branch, product_line, SUM(total) AS total_sales
	FROM sales
	GROUP BY branch, product_line
	ORDER BY branch, total_sales DESC;




-- -------------------------- Customers ------------------------------- --

-- How many unique payment methods does the data have?
SELECT DISTINCT payment
	FROM sales;


-- Most common customer type?
SELECT customer_type, count(*) AS count
	FROM sales
	GROUP BY customer_type
	ORDER BY count DESC;


-- What is the gender of most of the customers?
SELECT gender, COUNT(*) as gender_cnt
	FROM sales
	GROUP BY gender
	ORDER BY gender_cnt DESC;


-- Which time of the day do customers give most ratings per branch?
SELECT branch, time_of_day, ROUND(AVG(rating),2) AS avg_rating
	FROM sales
	GROUP BY branch, time_of_day
	ORDER BY branch, avg_rating DESC;


-- Which day of the week has the best avg ratings?
SELECT day_name, AVG(rating) AS avg_rating
	FROM sales
	GROUP BY day_name 
	ORDER BY avg_rating DESC;
-- Mon, Tue and Friday are the top best days for good ratings



-- Average rating per day of the week for each branch
SELECT branch, day_name, ROUND(AVG(rating), 2) AS avg_rating
	FROM sales
	GROUP BY branch, day_name
	ORDER BY branch, avg_rating DESC;




-- ---------------------------- Sales --------------------------------- --

-- Number of sales per time of day for each weekday
SELECT day_name, time_of_day, COUNT(*) AS total_sales
	FROM sales
	GROUP BY day_name, time_of_day
	ORDER BY day_name, total_sales DESC;


-- Which of the customer types brings the most revenue?
SELECT customer_type, SUM(total) AS total_revenue
	FROM sales
	GROUP BY customer_type
	ORDER BY total_revenue;
    
-- Which city has the highest average gross margin percentage?
SELECT city, ROUND(AVG(gross_margin_pct)*100, 2) AS avg_margin_pct
	FROM sales
	GROUP BY city
	ORDER BY avg_margin_pct DESC;


-- Which city has the largest tax percent?
SELECT city, ROUND(AVG(tax_pct), 2) AS avg_tax_pct
	FROM sales
	GROUP BY city 
	ORDER BY avg_tax_pct DESC;

-- Which customer type pays the most in tax?
SELECT customer_type, AVG(tax_pct) AS total_tax
	FROM sales
	GROUP BY customer_type
	ORDER BY total_tax;
