-- concept 1 : create database
CREATE DATABASE emp_analysis;
-- concept 2 :create table
Drop  TABLE IF EXISTS employees;
CREATE TABLE employees(
 employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary NUMERIC(10,2),
    joining_date DATE
);
-- concept 3 : insert data in table
INSERT INTO  employees
(first_name, last_name, department, city, salary, joining_date)
VALUES
('Ali', 'Khan', 'IT', 'Lahore', 85000, '2023-01-15'),
('Sara', 'Ahmed', 'HR', 'Islamabad', 70000, '2022-06-20'),
('Hamza', 'Raza', 'Finance', 'Karachi', 95000, '2021-09-10'),
('Ayesha', 'Malik', 'IT', 'Lahore', 90000, '2023-03-12'),
('Usman', 'Ali', 'Sales', 'Rawalpindi', 65000, '2024-01-05'),
('Hina', 'Shah', 'Marketing', 'Islamabad', 75000, '2022-11-18'),
('Bilal', 'Khan', 'Finance', 'Lahore', 88000, '2023-07-25'),
('Maham', 'Iqbal', 'Sales', 'Karachi', 62000, '2024-02-14'),
('Zain', 'Haider', 'IT', 'Rawalpindi', 92000, '2021-12-01'),
('Noor', 'Fatima', 'HR', 'Lahore', 68000, '2023-08-30');

-- concept 4: show this table
SELECT * From employees;
