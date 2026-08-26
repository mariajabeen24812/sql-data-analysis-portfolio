-- TODAY LEARNING CONCEPT
-- DATA FILTERATION AND SORTING
-- where
-- comparision operation(and, or, not,between,in , not in, like, ilike,isnotnull,isnull,orderby,offset,limit
-- distinct, as)

-- create table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    gender VARCHAR(20),
    department VARCHAR(50),
    city VARCHAR(50),
    age INTEGER,
    marks NUMERIC(5,2),
    attendance NUMERIC(5,2),
    fee_paid NUMERIC(10,2),
    admission_date DATE,
    scholarship NUMERIC(10,2),
    is_active BOOLEAN
);
-- insert data
INSERT INTO students
(student_name, gender, department, city, age, marks, attendance, fee_paid, admission_date, scholarship, is_active)
VALUES
('Ayesha Khan', 'Female', 'Computer Science', 'Lahore', 20, 88.50, 92.00, 85000, '2025-09-10', 10000, TRUE),
('Ali Raza', 'Male', 'Software Engineering', 'Karachi', 21, 76.00, 85.50, 90000, '2025-09-12', NULL, TRUE),
('Sara Ahmed', 'Female', 'Computer Science', 'Islamabad', 19, 94.00, 96.00, 85000, '2025-09-15', 15000, TRUE),
('Hamza Malik', 'Male', 'Data Science', 'Lahore', 22, 81.50, 88.00, 95000, '2025-09-18', 5000, TRUE),
('Fatima Noor', 'Female', 'Artificial Intelligence', 'Karachi', 20, 91.00, 94.50, 100000, '2025-09-20', 12000, TRUE),
('Usman Tariq', 'Male', 'Computer Science', 'Multan', 23, 68.00, 74.00, 85000, '2025-09-22', NULL, FALSE),
('Hina Shah', 'Female', 'Data Science', 'Peshawar', 21, 79.50, 82.00, 95000, '2025-09-25', 7000, TRUE),
('Bilal Khan', 'Male', 'Software Engineering', 'Lahore', 20, 85.00, 90.00, 90000, '2025-10-01', 8000, TRUE),
('Maham Ali', 'Female', 'Artificial Intelligence', 'Islamabad', 19, 97.00, 98.00, 100000, '2025-10-05', 20000, TRUE),
('Ahmed Hassan', 'Male', 'Data Science', 'Karachi', 22, 73.50, 79.00, 95000, '2025-10-08', NULL, TRUE),
('Zainab Iqbal', 'Female', 'Computer Science', 'Multan', 20, 89.00, 91.50, 85000, '2025-10-12', 10000, TRUE),
('Danish Aslam', 'Male', 'Artificial Intelligence', 'Lahore', 23, 65.00, 70.00, 100000, '2025-10-15', NULL, FALSE),
('Iqra Javed', 'Female', 'Software Engineering', 'Peshawar', 21, 82.00, 87.00, 90000, '2025-10-18', 6000, TRUE),
('Saad Ahmed', 'Male', 'Data Science', 'Islamabad', 20, 90.50, 93.00, 95000, '2025-10-20', 11000, TRUE),
('Laiba Khan', 'Female', 'Computer Science', 'Karachi', 19, 86.00, 89.00, 85000, NULL, NULL, TRUE);
-- show table
SELECT * FROM students;

-- WHERE practice Questions — Day 

-- Part 1 — WHERE with comparison operator

-- Q1. Saare students show karo jinki marks 80 se zyada hain.
SELECT student_name,marks FROM students
WHERE marks >80;

-- Q2. Sirf Computer Science students show karo.
SELECT student_name,department FROM students
WHERE department = 'Computer Science';

-- Q3. Lahore ke students show karo.
SELECT student_name,city FROM students
WHERE city = 'Lahore';

-- Q4. Jin students ki attendance 85 se kam hai unko show karo.
SELECT student_name,attendance FROM students
WHERE attendance < 85;

-- Q5. Jin students ki age 20 hai unko show karo.
SELECT student_name,age FROM students
WHERE age = 20;

-- Q6. Fee paid 90000 se zyada ya equal wale students.
SELECT fee_paid FROM students
WHERE fee_paid >= 90000;

-- Part 2 — AND / OR / NOT

-- Q7. Computer Science ke students AND marks 85 se zyada.
SELECT student_name,department, marks FROM students
WHERE marks > 85 AND department = 'Computer Science';
-- Q8. Lahore ke students AND attendance 85 se zyada.
SELECT student_name, city, attendance FROM students
WHERE city = 'Lahore' AND attendance > 85;
-- Q9. Lahore OR Karachi ke students.
SELECT student_name, city FROM students
WHERE city = 'Karachi' OR city = 'Lahore';
-- Q10. Computer Science OR Data Science students.
SELECT student_name, department FROM students
WHERE department = 'Computer Science' OR department = 'Data Science';
-- Q11. Artificial Intelligence ke ilawa baaki departments ke students.
SELECT student_name, department FROM students
WHERE department <> 'Artificial Intelligence'; 

SELECT student_name, department FROM students
WHERE not(department = 'Artificial Intelligence'); 

-- Part  — BETWEEN

-- Q11. Marks 75 aur 90 ke beech wale students.
SELECT student_name, marks FROM students
WHERE marks BETWEEN  75  AND 90;
-- Q12. Age 20 aur 22 ke beech wale students.
SELECT student_name , age FROM students
WHERE age BETWEEN 20 AND 22;
-- Q13. Attendance 80 aur 95 ke beech wale students.
SELECT student_name, attendance FROM students
WHERE attendance  BETWEEN 80 AND 95;
-- Q14. Admission date 2025-09-01 aur 2025-10-01 ke beech wale students.
SELECT student_name, admission_date FROM students
WHERE admission_date BETWEEN '2025-09-01' AND '2025-10-01';


-- Part 4 — IN / NOT IN

-- Q15. Lahore, Karachi aur Islamabad ke students using IN.
SELECT city FROM students
WHERE city IN ('Lahore','Karachi','Islamabad');
-- Q16. Computer Science, Data Science aur Artificial Intelligence students.
SELECT department FROM students
WHERE department IN ('Computer Science', 'Data Science','Artificial Intelligence');
-- Q17. Lahore aur Karachi ke ilawa students.
SELECT city FROM students
WHERE city NOT IN ('Lahore','Karachi');
-- Q18. Computer Science aur Software Engineering ke ilawa departments.
SELECT department FROM students
WHERE department NOT IN('Computer Science', 'Software Engineering');

-- Part 5 — LIKE

-- Q19. Jin students ke names A se start hote hain.
SELECT student_name FROM students
WHERE student_name LIKE 'A%';
-- Q20. Jin students ke names Khan par end hote hain.
SELECT student_name FROM students
WHERE student_name LIKE '%Khan';
-- Q21. Jin students ke names mein Ali aata hai.
SELECT student_name FROM students
WHERE student_name LIKE '%Ali%';
-- Q22. Jin students ke names mein Ahmed aata hai.
SELECT student_name FROM students
WHERE student_name LIKE '%Ahmed%';
-- Q23. Jin cities ke naam mein a letter aata hai.
SELECT city FROM students
WHERE city LIKE '%a%';

-- Part 6 — ILIKE

-- Q24. Student name mein ahmed ko case-insensitive search karo.
SELECT student_name FROM students
WHERE student_name ILIKE '%AHMED%';
-- Q25. Department mein computer ko case-insensitive search karo.
SELECT department FROM students
WHERE department ILIKE '%computer%';

-- Part 8 — NULL
-- Q26. Jin students ko scholarship nahi mili (NULL), unko find karo.
SELECT student_name,scholarship FROM students
WHERE scholarship ISNULL;
-- Q27. Jin students ki scholarship available hai, unko find karo.
SELECT student_name,scholarship FROM students
WHERE scholarship NOTNULL;
-- Q28. Jin students ki admission date missing hai, unko find karo.
SELECT student_name, admission_date FROM students
WHERE admission_date ISNULL;
-- Q29. Jin students ki admission date available hai, unko find karo.
SELECT student_name, admission_date FROM students
WHERE admission_date NOTNULL;
-- Part 9 — ORDER BY
-- Q30. Students ko marks ke highest → lowest order mein show karo.
SELECT student_name, marks  FROM students
ORDER BY marks  DESC;
-- Q31. Students ko marks ke lowest → highest order mein show karo.
SELECT student_name, marks  FROM students
ORDER BY marks;
-- Q32. Students ko attendance highest → lowest order mein show karo.
SELECT student_name, attendance  FROM students
ORDER BY attendance DESC;
-- Q33. Students ko fee paid ke highest → lowest order mein show karo.
SELECT student_name, fee_paid  FROM students
 ORDER BY fee_paid DESC;
 
 -- Part 10 — LIMIT / OFFSET
-- Q34. Top 5 students by marks.
SELECT student_name, marks FROM students
order by marks DESC 
limit(5);
-- Q35. Top 3 students by attendance.
SELECT student_name, attendance FROM students
order by attendance DESC 
limit(3);
-- Q36. Sabse kam marks wale 5 students.
SELECT student_name,marks FROM students
ORDER BY marks ASC
LIMIT(5);
-- Q37. Marks descending order mein first 5 students skip karke next 5 students.
SELECT student_name, marks FROM students
ORDER BY marks DESC 
LIMIT(5) OFFSET 5;
-- Part 11 — DISTINCT
-- Q38. Unique departments find karo.
SELECT DISTINCT department FROM students;
-- Q30. Unique cities find karo.
SELECT DISTINCT city FROM students;
-- Q40. Unique genders find karo.
SELECT DISTINCT gender FROM students;
-- Part 12 — AS
-- Q41. Student name ko output mein Student Name naam se show karo.
SELECT student_name AS "Student	Name" FROM students;
-- Q42. Marks ko Student Marks naam se show karo.
SELECT marks AS "Student Marks" FROM students;
-- Q43. fee_paid ko Paid Fee naam se show karo.
SELECT fee_paid AS "Paid Fee" FROM students;
-- Final Practice Challenge
-- Q44. Lahore ke active students find karo jinke marks 80+ hain
SELECT student_name , is_active FROM students
where city = 'Lahore' AND marks >80 AND is_active = TRUE;
-- Q45. Female students find karo jo Computer Science ya Data Science mein hain.
SELECT student_name, gender FROM students
WHERE gender = 'Female' and (department = 'Computer Science' OR department = 'Data Science');
-- Q46. Top 5 active students find karo according to marks.
SELECT student_name ,is_active FROM students
WHERE is_active = TRUE
ORDER BY marks DESC 
LIMIT(5);
-- Q47. Aise students find karo jinki attendance 85–95 ke beech hai aur marks 80+ hain.
SELECT student_name, marks, attendance FROM  students
WHERE attendance BETWEEN 85 AND 95 AND marks >= 80;
-- Q48. Aise students find karo jinki scholarship NULL nahi hai aur marks 85+ hain.
SELECT student_name FROM students
WHERE scholarship NOTNULL and marks >= 85;
-- Q49. Lahore, Karachi aur Islamabad ke students ko marks ke descending order mein show karo.
SELECT student_name,city, marks FROM students
WHERE city IN('Lahore','Karachi','Íslamabad')
ORDER BY marks DESC;
-- Q50.  Top 3 active students find karo jinke marks 85+ hain aur attendance 90+ hai.
SELECT student_name,is_active FROM students 
WHERE is_active = TRUE 
AND marks > 85 and attendance >90
ORDER BY  marks DESC
limit(3);
