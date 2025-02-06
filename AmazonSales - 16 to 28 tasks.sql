SELECT * FROM amazon.amazondata;

-- 16. Identify the customer type contributing the highest revenue.
select customer_type,sum(total) as Highest_revenue
from amazondata 
group by customer_type 
order by Highest_revenue desc
limit 1;

-- 17. Determine the city with the highest VAT percentage.
select city, sum(VAT/cogs * 100) as Highest_VAT_Percent 
from amazondata 
group by city 
order by Highest_VAT_Percent desc
limit 1;

-- 18. Identify the customer type with the highest VAT payments.
select customer_type, sum(VAT) as High_VAT from amazondata
group by customer_type 
order by High_VAT desc 
limit 1;

-- 19. What is the count of distinct customer types in the dataset?
select count(distinct customer_type) as Dis_cus_ty_co from amazondata;

-- 20. What is the count of distinct payment methods in the dataset?
select count(distinct payment_method) as Dis_Pay_Met_Count from amazondata;

-- 21. Which customer type occurs most frequently?
select customer_type,count(*) as Frequently_Occurs 
from amazondata 
group by customer_type 
order by Frequently_Occurs desc 
limit 1;

-- 22. Identify the customer type with the highest purchase frequency.
select customer_type,sum(total) as High_Purchase_Freq from amazondata 
group by customer_type 
order by High_Purchase_Freq desc 
limit 1;

-- 23. Determine the predominant gender among customers.
select gender, count(*) as Most_Genders
from amazondata 
group by gender 
order by Most_Genders
limit 1;

-- 24. Examine the distribution of genders within each branch.
SELECT Branch, Gender, COUNT(*) AS frequency 
FROM amazondata
GROUP BY Branch, Gender;

-- 25. Identify the time of day when customers provide the most ratings.
SELECT 
    CASE
        WHEN HOUR(STR_TO_DATE(Time, '%H:%i:%s')) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN HOUR(STR_TO_DATE(Time, '%H:%i:%s')) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    sum(rating) AS Most_rating
FROM amazondata
GROUP BY time_of_day
ORDER BY Most_rating DESC
LIMIT 1;

-- 26. Determine the time of day with the highest customer ratings for each branch.
SELECT Branch,
    CASE
        WHEN HOUR(STR_TO_DATE(Time, '%H:%i:%s')) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN HOUR(STR_TO_DATE(Time, '%H:%i:%s')) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    AVG(rating) AS average_rating
FROM amazondata
GROUP BY Branch, time_of_day
ORDER BY Branch, average_rating DESC;

-- 27. Identify the day of the week with the highest average ratings.
select dayname(str_to_date(date, '%m/%d/%Y')) as day_of_Week, avg(rating) as avg_rating
from amazondata 
group by day_of_Week 
order by avg_rating desc 
limit 1;

-- 28. Determine the day of the week with the highest average ratings for each branch.
select branch, avg(rating) as High_avg_rating, dayname(str_to_date(date, '%m/%d/%Y')) as day_of_Week 
from amazondata
group by branch,day_of_Week
order by High_avg_rating desc ;
