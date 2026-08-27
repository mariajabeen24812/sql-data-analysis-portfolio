--Day 3 concepts
-- Aggregrate function, group by, having

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    salesperson VARCHAR(100),
    city VARCHAR(50),
    quantity INTEGER,
    unit_price NUMERIC(10,2),
    total_amount NUMERIC(10,2),
    sale_date DATE,
    payment_method VARCHAR(30),
    is_completed BOOLEAN
);
-- insert data in table
INSERT INTO sales
(product_name, category, salesperson, city, quantity, unit_price, total_amount, sale_date, payment_method, is_completed)
VALUES
('Laptop', 'Electronics', 'Ali', 'Lahore', 2, 120000, 240000, '2026-01-05', 'Cash', TRUE),
('Mouse', 'Accessories', 'Sara', 'Karachi', 10, 2500, 25000, '2026-01-06', 'Card', TRUE),
('Keyboard', 'Accessories', 'Ahmed', 'Lahore', 5, 3500, 17500, '2026-01-07', 'Cash', TRUE),
('Monitor', 'Electronics', 'Hina', 'Islamabad', 3, 45000, 135000, '2026-01-08', 'Card', TRUE),
('Laptop', 'Electronics', 'Bilal', 'Karachi', 1, 125000, 125000, '2026-01-09', 'Online', TRUE),
('Headphones', 'Accessories', 'Sara', 'Lahore', 8, 5000, 40000, '2026-01-10', 'Card', FALSE),
('Printer', 'Office', 'Ahmed', 'Multan', 2, 30000, 60000, '2026-01-11', 'Cash', TRUE),
('Desk', 'Furniture', 'Hina', 'Islamabad', 4, 18000, 72000, '2026-01-12', 'Online', TRUE),
('Chair', 'Furniture', 'Ali', 'Lahore', 6, 12000, 72000, '2026-01-13', 'Card', TRUE),
('Tablet', 'Electronics', 'Bilal', 'Karachi', 3, 55000, 165000, '2026-01-14', 'Online', TRUE),
('Mouse', 'Accessories', 'Sara', 'Islamabad', 15, 2500, 37500, '2026-01-15', 'Cash', TRUE),
('Printer', 'Office', 'Ahmed', 'Lahore', 1, 30000, 30000, '2026-01-16', 'Card', FALSE),
('Laptop', 'Electronics', 'Hina', 'Multan', 2, 118000, 236000, '2026-01-17', 'Online', TRUE),
('Chair', 'Furniture', 'Ali', 'Karachi', 5, 12000, 60000, '2026-01-18', 'Cash', TRUE),
('Keyboard', 'Accessories', 'Bilal', 'Islamabad', 7, 3500, 24500, '2026-01-19', 'Card', TRUE);
-- Part 1 — Basic Aggregate Functions

-- Q1. Total sales records kitne hain?
-- COUNT()
SELECT COUNT(total_amount) FROM sales;
-- Q2. Total quantity sold find karo.
-- SUM()
SELECT SUM(quantity) AS count_of_quantity FROM sales;
-- Q3. Total sales amount find karo.
-- SUM()
SELECT SUM(total_amount) as Total_amount FROM sales;
-- Q4. Average sale amount find karo.
-- AVG()
SELECT AVG(total_amount) AS Average_amount FROM sales;
-- Q5. Sabse zyada sale amount find karo.
-- MAX()
SELECT Max(total_amount) AS Max_amunt FROM sales;
-- Q6. Sabse kam sale amount find karo.
-- MIN()
SELECT Min(total_amount) AS Min_amunt FROM sales;


-- Part 2 — GROUP By
-- Q7. Har category mein kitni sales hui hain?
SELECT category ,COUNT(*) AS Total_sales_count  
FROM sales
GROUP BY category;

-- Q8. Har category ki total quantity find karo.
SELECT category , SUM(quantity) AS Total_sales  
FROM sales
GROUP BY category;

-- Q9. Har category ka total sales amount find karo.

SELECT category , SUM(total_amount) AS Total_sales 
FROM sales
GROUP BY category;

-- Q10. Har category ka average sale amount find karo.
SELECT category ,AVG(total_amount) AS avg_sales 
FROM sales
GROUP BY category;
-- Q11. Har city mein kitni sales hui hain?
SELECT city , COUNT(*) AS Total_sales
FROM sales
GROUP BY city;
-- Q12. Har salesperson ki total sales amount find karo.
SELECT salesperson , SUM(total_amount) AS Total_sales
FROM sales
GROUP BY salesperson;

-- Part 3 — GROUP BY + Aggregate
-- Q13. Har category ki highest sale amount find karo.
SELECT category, MAX(total_amount) AS max_sale_amount FROM sales
GROUP BY category;
-- Q14. Har category ki lowest sale amount find karo.
SELECT category, MIN(total_amount) AS min_sale_amount FROM sales
GROUP BY category;
-- Q15. Har salesperson ne total kitni quantity sell ki?
SELECT salesperson , SUM(quantity) AS sales_quantity FROM sales
GROUP BY salesperson;
-- Q16. Har city ki average sale amount find karo.
SELECT city , AVG(total_amount) AS Avg_sales
FROM sales
GROUP BY city;
-- Part 4 — WHERE + Aggregate
-- Q17. Sirf completed sales ka total amount find karo.
SELECT is_completed , SUM(total_amount) FROM sales
WHERE is_completed = TRUE 
GROUP BY is_completed;
-- Q18. Lahore ki total sales amount find karo.
SELECT city, SUM(total_amount) FROM sales
WHERE city = 'Lahore'
GROUP BY city;
-- Q19. Electronics category ki total quantity find karo.
SELECT category, SUM(quantity) FROM sales
WHERE category = 'Electronics'
GROUP BY category;
-- Q20. Online payment se kitni total sales hui hain?
SELECT payment_method, SUM(total_amount) FROM sales
WHERE payment_method = 'Online'
GROUP BY payment_method;
-- Part 5 — GROUP BY + HAVING 
-- Q21. Sirf woh categories show karo jinki total sales amount 100000 se zyada hai.
SELECT category,SUM(total_amount) as total_sale FROM sales
GROUP BY category
HAVING SUM(total_amount) >100000;
-- Q22. Sirf woh cities show karo jahan 2 se zyada sales records hain.
SELECT city, count(*)  AS count_record FROM sales
GROUP BY city
HAVING COUNT(*) > 2;
-- Q23. Sirf woh salespersons show karo jinki average sale amount 50000 se zyada hai.
SELECT salesperson, AVG(total_amount)  AS avg_amount FROM sales
GROUP BY salesperson
HAVING AVG(total_amount) > 50000;
-- Q24. Sirf woh categories show karo jinki average sale amount 50000 se zyada hai.
SELECT category, AVG(total_amount)  AS avg_amount FROM sales
GROUP BY category
HAVING AVG(total_amount) > 50000;
-- Part 6 — Advanced Combination 
-- Q25. Completed sales ko category-wise group karo aur har category ka total sales amount find karo.
SELECT category,  SUM(total_amount) FROM sales
where is_completed =  TRUE 
GROUP BY category;
-- Q26. Completed sales mein salesperson-wise total sales amount find karo aur highest sales wale salesperson ko top par rakho.
SELECT  salesperson, SUM(total_amount) AS sale_amount FROM sales
WHERE is_completed = TRUE
GROUP BY  salesperson
ORDER BY sale_amount DESC;
-- Q27. Har category ki total sales amount find karo, sirf woh categories show karo jinki total sales 100000+ hai, aur result ko highest sales se lowest sales order mein show karo.
SELECT category, sum(total_amount) AS total_sales FROM sales
GROUP BY category
HAVING SUM(total_amount) >= 100000  
ORDER BY total_sales DESC;

-- Q28. Lahore aur Karachi ki completed sales ko category-wise group karo aur har category ka total sales amount find karo.
SELECT city,  category ,SUM(total_amount) FROM sales
WHERE city IN ('Lahore', 'Karachi') AND is_completed  = TRUE
GROUP BY category ,  city;
-- Q29. Har city ka average sale amount find karo aur sirf woh cities show karo jinka average 50000+ hai.
SELECT city, AVG(total_amount) as sale_amount FROM sales
GROUP BY city
HAVING AVG(total_amount) >50000;
-- Q30. Challenge: Completed sales mein har salesperson ki total sales amount find karo, sirf un salespersons ko show karo jinki total sales 100000+ hai, aur highest total sales ko top par rakho.
SELECT  salesperson,SUM(total_amount) AS total_sales FROM sales
WHERE is_completed = TRUE
GROUP BY salesperson
HAVING SUM(total_amount) >= 100000
ORDER BY total_sales DESC;








