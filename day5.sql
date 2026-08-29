-- today concept practics
-- joins, set operators
-- create employees table
DROP TABLE if exists employees;
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    manager_id INT,
    city_id INT,
    salary NUMERIC(10,2)
);

INSERT INTO employees
(employee_name, department_id, manager_id, city_id, salary)
VALUES
('Ali Khan', 1, NULL, 1, 120000),
('Sara Ahmed', 2, 1, 2, 85000),
('Ahmed Raza', 1, 1, 3, 95000),
('Hina Shah', 3, 1, 1, 110000),
('Bilal Khan', 4, 2, 2, 70000),
('Ayesha Noor', 1, 3, 4, 100000),
('Usman Ali', 3, 4, 5, 90000),
('Maham Javed', 2, 2, 3, 75000),
('Danish Malik', 4, 5, 1, 65000),
('Iqra Ahmed', 3, 4, 6, 88000);

-- create departmet table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');

-- create cities tables
CREATE TABLE cities (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(50)
);

INSERT INTO cities
VALUES
(1, 'Lahore'),
(2, 'Karachi'),
(3, 'Islamabad'),
(4, 'Multan'),
(5, 'Faisalabad'),
(6, 'Peshawar'),
(7, 'Quetta');

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);
-- create customers tables
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO customers
(customer_name, city)
VALUES
('Hamza', 'Lahore'),
('Laiba', 'Karachi'),
('Zainab', 'Islamabad'),
('Farhan', 'Multan'),
('Maria', 'Quetta'),
('Sana', 'Peshawar');

-- show all table
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM cities;
-- Practice Questions
-- Part 1 — INNER JOIN
-- Q1 Har employee ka employee name + department name show karo.
SELECT e.employee_name,d.department_id
FROM employees e
inner join
department d
on d.department_id = e.department_id;
-- Q2 Har employee ka employee name + city name show karo.
SELECT e.employee_name,c.city_name
FROM employees e
INNER JOIN
cities c
on c.city_id = e.city_id;
-- Q3 Employee name, department name aur salary show karo.
SELECT e.employee_name,d.department_name
FROM employees e
INNER JOIN  department d
on d.department_id = e.department_id;
-- Part 2 — LEFT JOIN AND RIGHT JOIN
-- Q4-Saare employees show karo, chahe unka department exist karta ho ya nahi.
SELECT e.employee_name,d.department_name
FROM employees e
LEFT JOIN  departments d 
ON e.department_id = d.department_id;
-- Q5  Saare departments show karo aur unke employees show karo.
-- Marketing bhi result mein aana chahiye.
SELECT d.department_name,e.employee_name
FROM departments d
RIGHT JOIN employees e
on d.department_id = e.department_id;

-- Part 3 — FULL JOIN 
-- Q6- Employees aur departments ka FULL JOIN karo.
SELECT e.employee_name,d.department_name
FROM employees e
FULL JOIN
department d
on d.department_id = e.department_id;
-- Q7 Cities aur employees ka FULL JOIN karo.
SELECT e.employee_name,c.city_name
FROM employees e
FULL JOIN 
cities c
ON e.city_id = c.city_id;

-- Part 4 — SELF JOIN 
--Q8 Employees table mein: employee_id manager_id already diya hua hai.
SELECT e1.employee_name,e2.salary
FROM employees e1
JOIN 
employees e2
on e1.employee_id = e2.manager_id;

-- Part 5 — Multi-Table JOIN 
-- Q9- Employee ka: employee name department name city name salary
SELECT e.employee_name,d.department_name,c.city_name,e.salary
FROM employees e
INNER JOIN 
departments d
on d.department_id = e.department_id
INNER JOIN 
cities c
on c.city_id = e.city_id;
-- Part 6 — UNION
-- Q10 Employees aur customers ke cities ko combine karo aur duplicate cities remove karo.
SELECT c.city_name FROM employees e
inner join cities c
on c.city_id = e.city_id
UNION ALL
SELECT city FROM customers ;
-- Part 7 — INTERSECT
-- Q11 Find karo kaun si cities employees aur customers dono mein hain.
SELECT city_name FROM cities 
INTERSECT 
SELECT c.city_name FROM employees e
inner join cities c
on  c.city_id = e.city_id;


-- Part 8 — EXCEPT
-- Q12-Find karo kaun si cities employees mein hain lekin customers mein nahi hain.
SELECT c.city_name FROM employees e
INNER JOIN 
cities c
ON c.city_id = e.city_id
EXCEPT 
SELECT city FROM customers;












