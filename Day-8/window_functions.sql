DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    salesperson VARCHAR(100),
    region VARCHAR(50),
    product VARCHAR(50),
    sale_date DATE,
    amount NUMERIC(10,2)
);

INSERT INTO sales
(salesperson, region, product, sale_date, amount)
VALUES
('Ali', 'North', 'Laptop', '2026-01-05', 120000),
('Sara', 'North', 'Phone', '2026-01-10', 80000),
('Ahmed', 'North', 'Tablet', '2026-01-15', 60000),
('Hina', 'South', 'Laptop', '2026-01-08', 150000),
('Bilal', 'South', 'Phone', '2026-01-12', 90000),
('Ayesha', 'South', 'Tablet', '2026-01-18', 70000),
('Usman', 'East', 'Laptop', '2026-01-07', 110000),
('Maham', 'East', 'Phone', '2026-01-14', 95000),
('Danish', 'East', 'Tablet', '2026-01-20', 50000),
('Iqra', 'West', 'Laptop', '2026-01-06', 130000),
('Laiba', 'West', 'Phone', '2026-01-13', 85000),
('Hamza', 'West', 'Tablet', '2026-01-21', 65000),
('Noor', 'North', 'Phone', '2026-02-05', 75000),
('Zainab', 'South', 'Laptop', '2026-02-10', 125000),
('Farhan', 'East', 'Phone', '2026-02-15', 105000),
('Maria', 'West', 'Laptop', '2026-02-18', 140000);

----------------------------------------------
--------------- WINDOWS FUNCTIONs
----------------------------------------------

-- function - 1: row_no()
-- Har sale ko amount ke according highest se lowest number do.
SELECT sale_id,amount,
	ROW_NUMBER() OVER(
	PARTITION BY region
	ORDER BY amount DESC
	) AS row_no
FROM sales;


-- Har region ke andar salesperson ko sales amount ke according number do.
-- har region ka ander  mean partition by or amount ka according number do mean order by
SELECT region,salesperson, amount,
	row_number() OVER(
			PARTITION BY region
			ORDER BY amount DESC
	) AS row_no
FROM sales;

-- Har region ke andar salesperson ko sale date ke according oldest se newest number do.
SELECT region,salesperson, sale_date ,
	ROW_NUMBER() OVER(
			PARTITION BY region
			ORDER BY sale_date 
		) AS row_no
FROM sales;
-- Har region ki top 3 sales find karo aur result mein ye columns show karo:
SELECT region,salesperson,amount,row_no
FROM (
	SELECT region,salesperson,amount,
	ROW_NUMBER() OVER(
			PARTITION BY region
			ORDER BY amount DESC
	) AS row_no 
FROM sales) AS ranked_sales
WHERE row_no <= 3;

-- USE OF NTILE
SELECT salesperson,amount,
    NTILE(4) OVER (
        ORDER BY amount DESC
    ) AS bucket
FROM sales;


----------------------------------------------
--Part B — RANK
----------------------------------------------

--Sales amount ke according salespeople ko rank karo.
SELECT salesperson,amount,
	RANK() OVER(
	ORDER BY amount DESC
	)
FROM sales;

-- Har region mein salespeople ko amount ke according rank karo.
SELECT region,salesperson,amount,
	RANK() OVER (
		PARTITION BY region
		ORDER BY amount  DESC
	)
FROM sales;
--------------------------------------------
-- Part C — DENSE_RANK
--------------------------------------------

-- Sales amount ke according DENSE_RANK() use karo.
SELECT salesperson,amount,
	DENSE_RANK() OVER(
	ORDER BY amount DESC
	)
FROM sales;
-- Har region ke andar DENSE_RANK() se ranking karo.
SELECT region,salesperson,amount,
	DENSE_RANK() OVER (
		PARTITION BY region
		ORDER BY amount  DESC
	)
FROM sales;
-------------------------------------------------------
--     Part D — Aggregate Window Functions
-------------------------------------------------------
-- Har salesperson ke saamne overall total sales show karo.
SELECT salesperson,amount,
	SUM(amount) OVER() FROM sales;

-- Har region ki total sales har row ke saamne show karo.
SELECT region,
	SUM(amount) OVER(
		PARTITION BY region
	) FROM sales;


-- Har region ki average sale amount show karo.
SELECT region,
	AVG(amount) OVER(
		PARTITION BY region
	) FROM sales;


-- Har region mein kitni sales hain, show karo.
SELECT region,
	COUNT(*) OVER(
		PARTITION BY region
	) FROM sales;


-- Har region ki minimum aur maximum sale amount show karo.
SELECT region,
	MAX(amount) OVER(
		PARTITION BY region
	) ,
	MIN(amount) OVER (
	PARTITION BY region)
FROM sales;
-------------------------------------------------------
-- Part E — Running Total
-------------------------------------------------------

-- Sales ko date ke order mein arrange karke running total calculate karo.
SELECT  salesperson,sale_date,
	SUM(amount) OVER(
		ORDER BY sale_date
	) AS running_total
FROM sales;

-- Har region ka running total calculate karo.
SELECT region,sale_date,
	SUM(amount) OVER(
		PARTITION BY region
		ORDER BY sale_date
	)
FROM sales;
-------------------------------------------------------
-- Part F — LAG & LEAD
-------------------------------------------------------

-- Har sale ke saath previous sale amount show karo.
SELECT salesperson, amount,
	LAG(amount) OVER(
		ORDER BY amount
	) AS previous_amount
FROM  sales;


-- Har sale ke saath next sale amount show karo.
SELECT salesperson, amount,
	LEAD(amount) OVER(
		ORDER BY sale_date
	) AS next_amount
FROM  sales;


-- Current sale aur previous sale ke amount ka difference calculate karo.
SELECT salesperson, amount,
	amount - LAG(amount) OVER(
		ORDER BY sale_date
	) AS amount_difference
FROM  sales;
-- use of cume dist
SELECT salesperson,amount,
	CUME_DIST() OVER(
		ORDER BY amount
	)AS cume_dist
FROM sales;
-- use of percent_rank
SELECT salesperson,amount,
    PERCENT_RANK() OVER (
        ORDER BY order_date
    ) AS percent_rank
FROM sales;





















