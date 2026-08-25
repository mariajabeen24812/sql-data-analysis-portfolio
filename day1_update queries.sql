SELECT * FROM employees;
-- concept 6 : rename column name
ALTER TABLE employees
RENAME COLUMN department to emp_department ;
-- cocept 7 : insert new column
ALTER TABLE employees
ADD COLUMN email varchar(120);
-- concept 8 : update or add new row data without where 
insert into employees(
first_name,last_name,emp_department, city,salary, joining_date, email)
values
('maria','jabeen', 'data science', 'wahcantt', 500000, '8-24-2027','mariajabeen@gmail.com'
);
-- concept 9: update table name
ALTER TABLE employees
RENAME TO store_product;
-- concept 10: change table data type
ALTER TABLE employees
ALTER  COLUMN salary TYPE int;

