# Amazon Sales Analysis

## 🔍 Objective:<br>
This project analyzes sales transactions from three Amazon branches located in **Mandalay, Yangon, and Naypyitaw**. The dataset contains **17 columns and 1000 rows**, covering aspects like customer behavior, product performance, and revenue trends.

## 📌 Dataset Overview<br>
The dataset includes:<br>

✅ Invoice_ID, Branch, City, Customer_type, Gender, Product_line, Unit_price, Quantity<br>
✅ VAT (Tax), Total, Date, Time, Payment_Method, COGS, Gross_margin_percentage, Gross_income, Rating<br>

## 📊 Key Analyses & Insights<br>

1️⃣ Product Performance Analysis<br>

✅ Top Performing Products:<br>

* Food and Beverages: Highest revenue & top-rated (Avg. rating: 7.11)
* Sports and Travel: High revenue, competitive sales
  
✅ Underperforming Products:

* Health and Beauty: Low revenue & gross income despite decent rating (7.00)

✅ Customer Ratings:

* Home and Lifestyle has the lowest rating (6.84) → Needs improvement!

2️⃣ Sales Analysis<br>

📅 Monthly Trends:

* January 2019 → Highest sales & quantity
* February 2019 → Drop in revenue (Seasonality?)
* March 2019 → Recovery in sales
  
📌 Branch & City Trends:

* Comparison of sales across Mandalay, Yangon, and Naypyitaw
  
👥 Customer Trends:

* Members vs. Normal Customers
* Gender-based purchase analysis

3️⃣ Customer Analysis<br>

👥 Customer Segmentation:

* Members → Higher revenue & transactions
* Normal Customers → Fewer purchases
  
💰 Profitability Insights:

* Members contribute more to revenue & gross income
* Higher transaction values per purchase

## 🔎 Approach Used

### 1️⃣ Data Wrangling

✅ Created Amazon Database and imported sales data.<br>
✅ Checked for missing/null values and handled them appropriately.

### 2️⃣ Feature Engineering

📌 New Columns Added:

* timeofday → Categorized sales as Morning, Afternoon, Evening
* dayname → Extracted weekday name (Mon-Sun)
* monthname → Extracted sales month
