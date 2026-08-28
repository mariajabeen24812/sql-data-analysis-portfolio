-- Today concept 
-- CASE WHEN , COALESCE , NULLIF , CAST
-- create table 
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    age INTEGER,
    salary NUMERIC(10,2),
    performance_score NUMERIC(5,2),
    attendance NUMERIC(5,2),
    bonus NUMERIC(10,2),
    joining_date DATE,
    is_active BOOLEAN
);
-- insert data in data
INSERT INTO employees
(employee_name, department, city, age, salary, performance_score, attendance, bonus, joining_date, is_active)
VALUES
('Ali Khan', 'IT', 'Lahore', 25, 85000, 88, 95, 10000, '2023-01-10', TRUE),
('Sara Ahmed', 'HR', 'Karachi', 28, 65000, 72, 89, NULL, '2022-05-15', TRUE),
('Ahmed Raza', 'IT', 'Islamabad', 30, 120000, 94, 97, 20000, '2021-03-20', TRUE),
('Hina Shah', 'Finance', 'Lahore', 27, 75000, 81, 92, 8000, '2023-07-12', TRUE),
('Bilal Khan', 'Sales', 'Karachi', 24, 55000, 65, 78, 5000, '2024-01-05', TRUE),
('Ayesha Noor', 'IT', 'Lahore', 26, 95000, 91, 96, NULL, '2022-09-18', TRUE),
('Usman Ali', 'Finance', 'Multan', 32, 90000, 76, 85, 7000, '2020-11-22', FALSE),
('Maham Javed', 'HR', 'Islamabad', 29, 70000, 86, 93, 9000, '2021-06-30', TRUE),
('Danish Malik', 'Sales', 'Lahore', 31, 60000, 58, 72, NULL, '2024-02-14', FALSE),
('Iqra Ahmed', 'Finance', 'Karachi', 25, 82000, 89, 94, 10000, '2023-04-08', TRUE),
('Saad Khan', 'IT', 'Multan', 27, 110000, 96, 98, 25000, '2020-08-19', TRUE),
('Laiba Ali', 'Sales', 'Islamabad', 23, 58000, 74, 88, 4000, '2024-03-10', TRUE),
('Hamza Raza', 'HR', 'Lahore', 35, 78000, 68, 81, NULL, '2019-12-01', FALSE),
('Zainab Khan', 'IT', 'Karachi', 29, 105000, 87, 91, 15000, '2021-10-25', TRUE),
('Farhan Ahmed', 'Sales', 'Multan', 26, 62000, 82, 90, 6000, '2023-08-17', TRUE);

-- show employee table 

SELECT * FROM employees;

-- Part 1 — CASE WHEN
-- Q1- Har employee ko performance ke according classify karo:
-- 90+ → Excellent
-- 80–89 → Good
-- 70–79 → Average
-- 70 se kam → Poor
SELECT employee_name,performance_score,
CASE
	WHEN performance_score >=90 THEN 'Excellent'
	WHEN performance_score >= 80 AND performance_score <=89 THEN 'Good'
	WHEN  performance_score >= 70 AND performance_score <= 79  THEN 'Average'
	else 'Poor'
	END AS performance 
FROM employees;

-- Q2- Salary ke according employees ko classify karo:
-- 100000+ → High Salary
-- 70000–99999 → Medium Salary
-- Below 70000 → Low Salary
SELECT employee_name, 
CASE
	WHEN salary >= 100000 THEN 'High Salary'
    WHEN salary BETWEEN 70000 AND 99999 THEN 'Medium Salary
	ELSE 'Low salary' END
FROM employees;
-- Q3-  Employee active hai ya nahi, readable status mein show karo:
-- TRUE → Active
-- FALSE → Inactive
SELECT employee_name,
CASE
	WHEN is_active = TRUE THEN 'Áctive' 
	ELSE 'Ínactive'
	END
FROM employees;

-- Part 2 — CASE + AND / OR
-- Q4
-- Aise employees find/classify karo jinka:
-- performance score 85+
-- AND
-- attendance 90+
-- Baaki employees ko Needs Improvement show karo.
SELECT employee_name,
CASE
	WHEN salary >= 100000 THEN 'High Salary'
	WHEN salary BETWEEN 70000 AND 99999 THEN 'Medium Salary'
	ELSE 'Needs improvement' END AS performance
FROM employees;
-- Q5 Agar employee:IT department ka ORFinance department ka hai to "Technical/Finance" show karo, 
-- warna "Other".
SELECT employee_name,
CASE 
	WHEN department = 'IT' OR  department = 'Finance' THEN 'Technical/Finance'
	ELSE 'Other' END 
FROM employees;

-- Part 3 — Conditional Aggregation
-- SUM(CASE WHEN ... THEN ... ELSE ... END)
-- Q6
-- Har department mein kitne active employees hain?
SELECT department, SUM(
CASE 
	WHEN is_active = TRUE THEN 1
	ELSE 0
	END
) AS active_employee
FROM employees
GROUP BY department;

-- Q7
-- Har department mein kitne employees ka performance score 80+ hai?
SELECT department, SUM(
CASE
	WHEN performance_score >=80 THEN 1
	ELSE 0
	END
) AS performance
FROM employees
GROUP BY department;
-- Part 5 — COALESCE
-- Q8
-- Jin employees ka bonus NULL hai, unka bonus 0 show karo.
SELECT COALESCE(bonus,0) FROM employees;
-- Q9
-- Employee name aur bonus show karo, lekin NULL bonus ki jagah "No Bonus" show karo.
SELECT employee_name,bonus,
COALESCE(bonus:: text,'No bonus') 
FROM employees;
SELECT employee_name,
       COALESCE(bonus::text, 'No Bonus') AS bonus
FROM employees;
-- Q10
-- Har employee ki salary + bonus calculate karo. NULL bonus ki wajah se result NULL nahi hona chahiye.
SELECT employee_name,
COALESCE(salary,0)+COALESCE(bonus,0) AS total_salary
FROM employees;
--  Part 4 — NULLIF
-- Q11 ager salary or bonus ki value null hai tu null ahe otherwise sum return karo 
SELECT NULLIF(salary,bonus) FROM employees;

-- Part 5 — CAST / Type Conversion
-- Q12
-- Salary ko integer format mein show karo.
SELECT CAST(salary AS int) FROM employees;
-- column::datatype
SELECT salary :: int FROM employees;
--Part 6 — CASE + Date
-- Q13
-- Joining date ke according employees ko classify karo:
-- 2023 ya uske baad → Recent
-- 2021–2022 → Experienced
-- 2020 ya usse pehle → Senior
SELECT employee_name,
CASE
	WHEN  EXTRACT(year from joining_date) >=2023 THEN 'Recent'
	WHEN EXTRACT(YEAR from joining_date)  BETWEEN 2021 AND  2022 THEN 'Experienced'
	ELSE 'senior' END AS employee_level
FROM employees;


-- Part 7 — CASE + GROUP BY + group by + having
-- Q14
-- Har department ki total salary calculate karo aur sirf woh departments show karo jinki total salary 250000+ hai.
SELECT department,sum(
CASE 
	WHEN salary >= 250000 THEN salary
	ELSE 0
	END ) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) >= 250000
ORDER BY total_salary DESC;

-- Q15
-- Har department mein 90+ performance score wale employees count karo aur sirf woh departments show karo jahan kam az kam 2 high performers hain.
SELECT department, COUNT(
CASE
	WHEN performance_score >= 90 THEN performance_score
	ELSE NULL -- it will not count
	END
) AS count_score
FROM employees
GROUP BY  department
HAVING COUNT( CASE
               WHEN performance_score >= 90 THEN 1
           END)>=2
order by count_score DESC;


