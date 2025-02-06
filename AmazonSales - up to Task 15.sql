create database Amazon;

Create table amazondata;

SELECT * FROM amazon.amazondata;
use amazon;
-- 1. What is the count of distinct cities in the dataset?
select count(distinct city) as Unique_Count from amazondata;

-- 2. For each branch, what is the corresponding city?
select branch, city from amazondata
group by branch, city;

-- 3. What is the count of distinct product lines in the dataset?
select count(distinct product_line) as Distinct_count_PD from amazondata;

-- 4. Which payment method occurs most frequently?

select payment_method, count(*) as Frequently from amazondata
group by payment_method
order by frequently desc
limit 1;

-- 5. Which product line has the highest sales?
select product_line,sum(total) as Highest_Sales from amazondata
group by product_line
order by Highest_Sales desc 
limit 1;

-- 6. How much revenue is generated each month?
SELECT MONTHNAME(STR_TO_DATE(Date, '%m/%d/%Y')) AS month, SUM(Total) AS total_revenue 
FROM amazondata
GROUP BY month
ORDER BY total_revenue desc;

-- 7. In which month did the cost of goods sold reach its peak?
select monthname(str_to_date(Date, '%m/%d/%Y')) as Month, sum(cogs) as Total_cogs 
from amazondata
group by month
order by Total_cogs desc 
limit 1;

-- 8. Which product line generated the highest revenue?
select product_line, sum(total) as Highest_revenue 
from amazondata 
group by product_line 
order by Highest_revenue
limit 1;

-- 9. In which city was the highest revenue recorded?
select city, sum(total) as Highest_revenue from amazondata 
group by city 
order by Highest_revenue desc 
limit 1;

-- 10. Which product line incurred the highest Value Added Tax?
select product_line, sum(VAT) as Highest_VAT 
from amazondata
group by product_line 
order by Highest_VAT desc limit 1;

-- 11. For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
select product_line, Total as Sales,
case when total > (select avg(total) from amazondata) then 'Good'
else 'Bad'
End as Sales_Status
from amazondata;

-- 12. Identify the branch that exceeded the average number of products sold.
select branch,sum(quantity) as Total_Quantity from amazondata
group by branch 
having Total_Quantity > (select avg(quantity) from amazondata);

-- 13. Which product line is most frequently associated with each gender?
SELECT Gender, Product_line, COUNT(*) AS frequent 
FROM amazondata
GROUP BY Gender, Product_line
ORDER BY Gender, frequent DESC;

-- 14. Calculate the average rating for each product line.
select product_line, avg(rating) as avg_rating
from amazondata
group by product_line;

-- 15. Count the sales occurrences for each time of day on every weekday.
SELECT 
    DAYNAME(STR_TO_DATE(Date, '%m/%d/%Y')) AS day_of_week,
    CASE
        WHEN HOUR(STR_TO_DATE(Time, '%H:%i:%s')) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN HOUR(STR_TO_DATE(Time, '%H:%i:%s')) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    COUNT(*) AS sales_count
FROM amazondata
GROUP BY day_of_week, time_of_day;

