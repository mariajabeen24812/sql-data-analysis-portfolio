CREATE TABLE ecommerce_sales (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    category VARCHAR(50),
    product_name VARCHAR(100),
    salesperson VARCHAR(100),
    quantity INTEGER,
    unit_price NUMERIC(10,2),
    total_amount NUMERIC(10,2),
    order_date DATE,
    payment_method VARCHAR(30),
    order_status VARCHAR(30)
);
INSERT INTO ecommerce_sales
(customer_name, city, category, product_name, salesperson,
 quantity, unit_price, total_amount, order_date, payment_method, order_status)
VALUES

('Ali','Lahore','Electronics','Laptop','Sara',2,85000,170000,'2026-01-05','Card','Completed'),
('Ahmed','Karachi','Electronics','Mobile','Ali',3,55000,165000,'2026-01-06','Online','Completed'),
('Hina','Islamabad','Furniture','Office Chair','Bilal',2,25000,50000,'2026-01-08','Cash','Completed'),
('Sara','Lahore','Accessories','Headphones','Sara',5,5000,25000,'2026-01-10','Card','Completed'),
('Bilal','Multan','Electronics','Tablet','Ahmed',2,35000,70000,'2026-01-12','Online','Pending'),

('Ayesha','Lahore','Furniture','Desk','Bilal',1,45000,45000,'2026-01-15','Card','Completed'),
('Usman','Karachi','Accessories','Keyboard','Ali',4,4500,18000,'2026-01-17','Cash','Completed'),
('Hamza','Islamabad','Electronics','Laptop','Ahmed',1,90000,90000,'2026-01-18','Online','Completed'),
('Fatima','Lahore','Electronics','Monitor','Sara',3,30000,90000,'2026-01-20','Card','Pending'),
('Zain','Multan','Furniture','Table','Bilal',2,30000,60000,'2026-01-22','Cash','Completed'),

('Maryam','Karachi','Electronics','Mobile','Ali',2,60000,120000,'2026-01-25','Online','Completed'),
('Omar','Lahore','Accessories','Mouse','Sara',6,2500,15000,'2026-01-27','Card','Completed'),
('Noor','Islamabad','Furniture','Office Chair','Ahmed',3,22000,66000,'2026-01-28','Cash','Completed'),
('Danish','Multan','Electronics','Tablet','Bilal',4,32000,128000,'2026-02-01','Online','Completed'),
('Iqra','Lahore','Electronics','Laptop','Sara',1,95000,95000,'2026-02-03','Card','Completed'),

('Raza','Karachi','Furniture','Desk','Ali',2,48000,96000,'2026-02-05','Online','Pending'),
('Kiran','Islamabad','Accessories','Headphones','Ahmed',4,5500,22000,'2026-02-07','Cash','Completed'),
('Saad','Lahore','Electronics','Mobile','Bilal',3,58000,174000,'2026-02-09','Card','Completed'),
('Anaya','Multan','Furniture','Table','Sara',1,35000,35000,'2026-02-10','Online','Completed'),
('Fahad','Karachi','Electronics','Monitor','Ali',2,28000,56000,'2026-02-12','Cash','Completed'),

('Laiba','Lahore','Accessories','Keyboard','Ahmed',5,5000,25000,'2026-02-14','Card','Completed'),
('Taha','Islamabad','Electronics','Laptop','Bilal',2,88000,176000,'2026-02-16','Online','Completed'),
('Sana','Multan','Furniture','Office Chair','Sara',2,24000,48000,'2026-02-18','Cash','Pending'),
('Waleed','Karachi','Electronics','Tablet','Ali',3,34000,102000,'2026-02-20','Card','Completed'),
('Maha','Lahore','Furniture','Desk','Ahmed',2,46000,92000,'2026-02-22','Online','Completed'),

('Arham','Islamabad','Accessories','Mouse','Bilal',7,2800,19600,'2026-02-24','Cash','Completed'),
('Areeba','Multan','Electronics','Mobile','Sara',2,57000,114000,'2026-02-26','Card','Completed'),
('Sameer','Karachi','Furniture','Table','Ali',3,32000,96000,'2026-02-27','Online','Completed'),
('Eman','Lahore','Electronics','Monitor','Ahmed',2,31000,62000,'2026-03-01','Card','Completed'),
('Hassan','Islamabad','Electronics','Laptop','Bilal',1,92000,92000,'2026-03-03','Online','Completed'),

('Amina','Multan','Accessories','Headphones','Sara',6,5200,31200,'2026-03-05','Cash','Completed'),
('Rayan','Karachi','Electronics','Mobile','Ali',4,59000,236000,'2026-03-07','Card','Completed'),
('Mishal','Lahore','Furniture','Office Chair','Ahmed',3,26000,78000,'2026-03-09','Online','Pending'),
('Adnan','Islamabad','Electronics','Tablet','Bilal',2,36000,72000,'2026-03-11','Cash','Completed'),
('Hoor','Multan','Furniture','Desk','Sara',1,47000,47000,'2026-03-13','Card','Completed'),

('Yasir','Karachi','Accessories','Keyboard','Ali',5,4800,24000,'2026-03-15','Online','Completed'),
('Mehwish','Lahore','Electronics','Laptop','Ahmed',2,87000,174000,'2026-03-17','Card','Completed'),
('Adeel','Islamabad','Furniture','Table','Bilal',2,33000,66000,'2026-03-19','Cash','Completed'),
('Komal','Multan','Electronics','Monitor','Sara',3,29000,87000,'2026-03-21','Online','Pending'),
('Shahzaib','Karachi','Electronics','Mobile','Ali',2,61000,122000,'2026-03-23','Card','Completed'),

('Rabia','Lahore','Accessories','Mouse','Ahmed',8,2700,21600,'2026-03-25','Cash','Completed'),
('Noman','Islamabad','Electronics','Laptop','Bilal',1,93000,93000,'2026-03-27','Online','Completed'),
('Alina','Multan','Furniture','Office Chair','Sara',2,23000,46000,'2026-03-29','Card','Completed'),
('Imran','Karachi','Electronics','Tablet','Ali',4,33000,132000,'2026-03-30','Online','Completed'),
('Sadia','Lahore','Furniture','Desk','Ahmed',2,44000,88000,'2026-04-01','Card','Pending'),

('Talha','Islamabad','Accessories','Headphones','Bilal',3,6000,18000,'2026-04-03','Cash','Completed'),
('Nida','Multan','Electronics','Mobile','Sara',3,56000,168000,'2026-04-05','Online','Completed'),
('Rehan','Karachi','Furniture','Table','Ali',2,31000,62000,'2026-04-07','Card','Completed'),
('Minal','Lahore','Electronics','Monitor','Ahmed',4,30000,120000,'2026-04-09','Online','Completed'),
('Haris','Islamabad','Electronics','Laptop','Bilal',2,89000,178000,'2026-04-11','Card','Completed');
-----------------------------------------------------
-- practics of  Window Functions
------------------------------------------------------
-- Har order ko total_amount DESC ke according ROW_NUMBER() do.
select order_id,total_amount,
	ROW_NUMBER() OVER(
		ORDER BY total_amount DESC
	) AS row_number
FROM ecommerce_sales;

-- Har city ke andar orders ko total_amount DESC ke according ROW_NUMBER() do.
SELECT city,total_amount,
	ROW_NUMBER()  OVER(
		PARTITION BY city
		ORDER BY total_amount DESC
	) AS row_number
FROM ecommerce_sales;

-- Har category ke andar sales ko rank karo using RANK().
SELECT category,total_amount,
	RANK() OVER(
		PARTITION BY category
		order by total_amount desc
		) as rank
FROM ecommerce_sales;

-- Har salesperson ke orders ko total_amount DESC ke according DENSE_RANK() do.
SELECT salesperson, total_amount,
	DENSE_RANK() OVER(
		partition by salesperson
		ORDER BY total_amount DESC
	) AS dense_rank
FROM ecommerce_sales;

-- Har order ke saath previous order ka total_amount show karo using LAG().
SELECT product_name, total_amount,
	LAG(total_amount) OVER(
		order by total_amount) 
		AS perivous_value
FROM ecommerce_sales;

-- Har order ke saath next order ka total_amount show karo using LEAD().
SELECT product_name, total_amount,
	LEAD(total_amount) OVER(
		order by total_amount) 
		AS next_value
FROM ecommerce_sales;

-- Har city ki total sales calculate karo using SUM() OVER(PARTITION BY city).
SELECT salesperson,city,
	SUM(total_amount) over(
		PARTITION BY city
		) as total_sale
FROM ecommerce_sales;

-- Har category ki average order value show karo using AVG() OVER().
SELECT category,
	AVG(total_amount) over(
		PARTITION BY category
		) as avg_sale
FROM ecommerce_sales;

-- Har city ka top 2 highest-value orders find karo using a window function.
SELECT city,total_amount,sales_rank FROM(
	SELECT city,total_amount,
		RANK() over(
			partition by city
			order by total_amount desc
		) AS sales_rank
	FROM ecommerce_sales
) AS rank_sales
WHERE sales_rank <= 2;

-- 📅 DAY 2 — Advanced Window Functions
-- Har salesperson ke orders ko highest se lowest sales ke according rank karo.
SELECT salesperson,total_amount,
	rank() over(
		partition by salesperson
		ORDER BY total_amount desc
	) as rank_sales
FROM ecommerce_sales;

-- Har category mein highest-selling order find karo.
SELECT category,total_amount,sales_rank FROM (
	SELECT category,total_amount,
		rank() over(
			partition by category
			order by total_amount desc
		) as sales_rank
	from ecommerce_sales
) rank_sales
WHERE sales_rank = 1;

-- Har city mein second-highest order find karo.
SELECT city,total_amount,sales_rank FROM(
	SELECT city,total_amount,
		RANK() over(
			partition by city
			order by total_amount desc
		) AS sales_rank
	FROM ecommerce_sales
) AS rank_sales
WHERE sales_rank = 2;

-- Har salesperson ki cumulative sales calculate karo using SUM() OVER(ORDER BY ...).
SELECT salesperson,product_name,total_amount,
	SUM(total_amount) over(
		partition by salesperson
		ORDER BY total_amount desc
	) as commulative_sales
FROM ecommerce_sales;

-- Har date ke saath previous date ki sales compare karo.
SELECT order_date,total_amount,
	LAG(total_amount) over(
	ORDER BY order_date 
	) as perivous_value
FROM ecommerce_sales;


-- Har order ka difference previous order se calculate karo.
SELECT order_date,total_amount,
-- LAG(total_amount) over(
-- 	ORDER BY order_date 
-- 	) as perivous_value,
	total_amount - lag(total_amount) over(
	) as diff_value
FROM ecommerce_sales;

-- Har salesperson ki average sales aur individual order amount ek hi result mein show karo.
SELECT salesperson,product_name,total_amount,
	AVG(total_amount) OVER(
		PARTITION BY salesperson 
	)AS avg_order_amount
FROM ecommerce_sales;

-- Har city mein top 3 customers/orders identify karo based on total_amount.
SELECT customer_name,city,total_amount,sales_rank
FROM (
	SELECT customer_name,city,total_amount,
		RANK() OVER(
			PARTITION BY city
			order by total_amount desc
		)as sales_rank
	FROM ecommerce_sales
	) as rank_sales
WHERE sales_rank <= 3;

-- RANK() aur DENSE_RANK() dono use karke category-wise ranking compare karo.
SELECT category,total_amount,
	rank() over(
	PARTITION BY category
	order by total_amount desc
	) as sale_rank,
	DENSE_RANK() OVER(
	PARTITION BY category
	ORDER by total_amount desc
	) as dense_rank
FROM ecommerce_sales;

-- CTE bana kar sirf Completed orders nikalo, phir unki total sales calculate karo.
with completed_order as (
	SELECT product_name,order_status,total_amount
	FROM ecommerce_sales
	where order_status = 'Completed'

)
SELECT sum(total_amount) as total_sales FROM completed_order;

-- CTE se city-wise total sales calculate karo.
with total_sales_city as (
	SELECT city, sum(total_amount) as total_sales
	FROM ecommerce_sales
	GROUP BY city
)
SELECT city,total_sales from total_sales_city;

-- CTE use karke sirf woh cities find karo jinki sales 200000 se zyada hain.
with total_sales_city as (
	SELECT city, sum(total_amount) as total_sales
	FROM ecommerce_sales
	GROUP BY city
)
SELECT city,total_sales 
from total_sales_city
WHERE total_sales > 200000;

-- CTE bana kar salesperson-wise total sales calculate karo aur highest salesperson find karo.
with total_sales_person as (
	SELECT salesperson, sum(total_amount) as total_sales
	FROM ecommerce_sales
	GROUP BY salesperson
)
SELECT salesperson,total_sales from total_sales_person;

-- CTE use karke category-wise average order amount calculate karo.
-- CTE se total_amount > 100000 orders nikalo aur unka count calculate karo.
-- Do CTEs banao:
-- city-wise sales
-- category-wise sales
-- Phir dono ko combine karo.
-- CTE + RANK() use karke har city ka top customer/order find karo.
-- CTE use karke monthly sales calculate karo.
-- Multiple CTEs use karke find karo:
-- total sales
-- average order value
-- total orders
-- for each city.
-- 📅 DAY 4 — VIEW

-- Focus: CREATE VIEW, SELECT FROM VIEW, DROP VIEW, analytical views.

-- Q31–Q40
-- completed_orders naam ka view banao jisme sirf completed orders hon.
-- city_sales naam ka view banao jisme city-wise total sales hon.
-- category_sales naam ka view banao jisme category-wise:
-- total sales
-- average sales
-- number of orders
-- salesperson_performance naam ka view banao.

-- Ismein:

-- salesperson
-- total orders
-- total sales
-- average order value

-- show karo.

-- high_value_orders naam ka view banao jisme total_amount > 100000 ho.
-- Kisi existing view ko query karke Lahore ki sales find karo.
-- View se highest-selling category find karo.
-- View se highest-performing salesperson find karo.
-- Ek view banao jisme monthly sales hon, phir us view se March ki sales find karo.
-- Kisi ek view ko DROP VIEW karo aur phir dobara create karo.
-- 📅 DAY 5 — COMMIT & ROLLBACK

-- ⚠️ Ye queries practice database mein run karna. Important database par experiment mat karna.

-- Q41–Q50
-- Ek transaction start karo aur kisi order ka order_status update karo. Phir ROLLBACK karo. Check karo change hua ya nahi.
-- Transaction start karo aur ek customer's city change karo. COMMIT karo. Phir check karo change permanent hua ya nahi.
-- Transaction ke andar kisi order ka total_amount change karo, phir ROLLBACK karo.
-- Transaction mein 2 rows update karo aur COMMIT karo.
-- Transaction mein 2 rows update karo aur ROLLBACK karo.
-- Transaction start karo, ek new order INSERT karo, phir ROLLBACK karo. Check karo order exist karta hai ya nahi.
-- Transaction start karo, new order insert karo, phir COMMIT karo.
-- Transaction mein ek row delete karo, phir ROLLBACK karo.
-- Transaction mein ek row delete karo, phir COMMIT karo.
-- Mini business transaction:
-- Ek transaction mein:
-- ek order ka status Pending → Completed
-- us order ka total_amount update
-- ek new order insert
