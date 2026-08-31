---------------------------------------
---------HOSPITAL PROJECT--------------
---------------------------------------

-- create patients table
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(20),
    age INTEGER,
    city VARCHAR(50),
    phone VARCHAR(20),
    registration_date DATE
);

INSERT INTO patients
(patient_name, gender, age, city, phone, registration_date)
VALUES
('Ali Khan', 'Male', 25, 'Lahore', '03001234567', '2026-01-10'),
('Sara Ahmed', 'Female', 32, 'Karachi', '03111234567', '2026-01-15'),
('Ahmed Raza', 'Male', 45, 'Islamabad', '03221234567', '2026-02-05'),
('Hina Shah', 'Female', 29, 'Lahore', '03331234567', '2026-02-12'),
('Bilal Khan', 'Male', 51, 'Multan', '03441234567', '2026-02-20'),
('Ayesha Noor', 'Female', 38, 'Karachi', '03551234567', '2026-03-01'),
('Usman Ali', 'Male', 62, 'Lahore', '03661234567', '2026-03-05'),
('Maham Javed', 'Female', 27, 'Islamabad', '03771234567', '2026-03-10'),
('Danish Malik', 'Male', 34, 'Multan', '03881234567', '2026-03-15'),
('Iqra Ahmed', 'Female', 41, 'Peshawar', '03991234567', '2026-03-20'),
('Saad Khan', 'Male', 56, 'Karachi', '03011234567', '2026-04-01'),
('Laiba Ali', 'Female', 23, 'Lahore', '03121234567', '2026-04-05');

-- create table department
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO departments
(department_name)
VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('Dermatology');

-- create table doctors
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    doctor_name VARCHAR(100),
    department_id INT,
    city VARCHAR(50),
    experience_years INTEGER,
    salary NUMERIC(10,2)
);

INSERT INTO doctors
(doctor_name, department_id, city, experience_years, salary)
VALUES
('Dr. Hassan', 1, 'Lahore', 12, 250000),
('Dr. Fatima', 2, 'Karachi', 8, 210000),
('Dr. Kamran', 3, 'Islamabad', 10, 230000),
('Dr. Sana', 4, 'Lahore', 6, 180000),
('Dr. Bilal', 5, 'Karachi', 7, 190000),
('Dr. Asad', 1, 'Multan', 15, 280000),
('Dr. Maria', 2, 'Islamabad', 9, 220000),
('Dr. Zain', 3, 'Lahore', 5, 170000);

--create table appointments
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(30),
    diagnosis VARCHAR(100)
);

INSERT INTO appointments
(patient_id, doctor_id, appointment_date, appointment_time, status, diagnosis)
VALUES
(1, 1, '2026-04-10', '10:00:00', 'Completed', 'Heart Checkup'),
(2, 2, '2026-04-11', '11:00:00', 'Completed', 'Migraine'),
(3, 3, '2026-04-12', '09:30:00', 'Cancelled', 'Back Pain'),
(4, 1, '2026-04-13', '12:00:00', 'Completed', 'Heart Checkup'),
(5, 6, '2026-04-14', '10:30:00', 'Completed', 'Chest Pain'),
(6, 5, '2026-04-15', '02:00:00', 'Pending', 'Skin Allergy'),
(7, 6, '2026-04-16', '11:30:00', 'Completed', 'Blood Pressure'),
(8, 7, '2026-04-17', '01:00:00', 'Cancelled', 'Migraine'),
(9, 8, '2026-04-18', '03:00:00', 'Completed', 'Knee Pain'),
(10, 2, '2026-04-19', '10:00:00', 'Completed', 'Headache'),
(11, 1, '2026-04-20', '11:00:00', 'Pending', 'Heart Checkup'),
(12, 4, '2026-04-21', '09:00:00', 'Completed', 'Child Checkup'),
(1, 6, '2026-04-22', '10:00:00', 'Completed', 'Follow-up'),
(4, 8, '2026-04-23', '02:30:00', 'Completed', 'Joint Pain');

-- payments table
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    appointment_id INT,
    amount NUMERIC(10,2),
    payment_method VARCHAR(30),
    payment_date DATE,
    payment_status VARCHAR(30)
);

INSERT INTO payments
(appointment_id, amount, payment_method, payment_date, payment_status)
VALUES
(1, 5000, 'Cash', '2026-04-10', 'Paid'),
(2, 4000, 'Card', '2026-04-11', 'Paid'),
(3, 3000, 'Cash', '2026-04-12', 'Refunded'),
(4, 5000, 'Card', '2026-04-13', 'Paid'),
(5, 6000, 'Online', '2026-04-14', 'Paid'),
(6, 3500, 'Cash', '2026-04-15', 'Pending'),
(7, 5500, 'Card', '2026-04-16', 'Paid'),
(8, 4000, 'Online', '2026-04-17', 'Refunded'),
(9, 4500, 'Cash', '2026-04-18', 'Paid'),
(10, 4000, 'Card', '2026-04-19', 'Paid'),
(11, 5000, 'Online', '2026-04-20', 'Pending'),
(12, 3000, 'Cash', '2026-04-21', 'Paid'),
(13, 3500, 'Card', '2026-04-22', 'Paid'),
(14, 4500, 'Online', '2026-04-23', 'Paid');
-- show all
SELECT * FROM patients;
SELECT * FROM departments;
SELECT * FROM doctors;
SELECT * FROM appointments;
SELECT * FROM payments;
-------------------------------------------
-- Hospital Analytics — SQL Practice
-- Part 1 — INSERT / UPDATE / DELETE
--------------------------------------------
-- Q1. Ek new patient add karo:

-- Name: Noor Fatima
-- Gender: Female
-- Age: 30
-- City: Lahore
INSERT INTO patients
(patient_name,gender,age,city,phone,registration_date)
VALUES
('Noor Fatima', 'Female', 30, 'Lahore', '03001234567', '2026-04-25');

-- Q2. Patient Ali Khan ki city ko Lahore se Karachi update karo.
UPDATE patients
SET city = 'Karachi'
Where patient_name = 'Ali Khan' AND city = 'Lahore';
SELECT * FROM patients;
--Q3. Jitne patients ki age 60 se zyada hai, unki city Senior Care set karo.
UPDATE patients
SET city = 'Senior Care'
WHERE age > 60;
-- Q4. Patient Danish Malik ka record delete karo
DELETE FROM patients
WHERE patient_id = 9;
SELECT * FROM patients;
-------------------------------------------
--  Part 2 — WHERE + Filtering
--------------------------------------------
-- Q5. Lahore ke saare patients show karo.
SELECT patient_name,city FROM patients
WHERE city = 'Lahore';
-- Q6. Age 40 se zyada patients show karo.
SELECT patient_name, age FROM patients
WHERE age > 40;
-- Q7. Age 20 aur 40 ke beech patients show karo.
SELECT patient_name,age FROM patients
WHERE age BETWEEN 20 AND 40;
-- Q8. Karachi ya Lahore ke patients show karo .
SELECT patient_name, city FROM patients
WHERE city = 'Karachi' OR city = 'Lahore';
-- Q9. Karachi aur Lahore ke ilawa patients show karo .
SELECT patient_name,city FROM patients
WHERE city not in ('Karachi','Lahore');
-- Q10. Aise patients find karo jinka naam A se start hota hai .
SELECT patient_name FROM patients
WHERE patient_name LIKE 'A%';
-- Q11. Case-insensitive search karo jahan patient name mein ali aaye .
SELECT patient_name FROM patients
WHERE patient_name ilike '%ali%';
-- Q12. Female patients jinki age 30 se zyada hai.
SELECT patient_name FROM patients
WHERE age > 30 AND  gender = 'Female';
-- Q13. Male patients jo Lahore ya Karachi mein hain.
SELECT patient_name FROM patients
WHERE city = 'Karachi' OR( city = 'Lahore' AND  gender = 'Male');
-------------------------------------------------------
-- Part 3 — DISTINCT / ORDER BY / LIMIT / OFFSET
-------------------------------------------------------
-- Q14. Patients ki unique cities show karo.
SELECT DISTINCT(city) FROM  patients;
-- Q15. Patients ko age ke hisaab se highest se lowest order mein show karo.
SELECT age FROM patients
ORDER BY age DESC;
-- Q16. Top 5 oldest patients show karo.
SELECT patient_name,age FROM patients
ORDER BY age DESC
LIMIT (5);
-- Q17.  doctors ko salary ke hisaab se highest-paid doctor se lowest-paid doctor tak show karo.
SELECT doctor_name,salary  FROM doctors
ORDER BY salary DESC;

-- Q18. Doctors ke top 3 highest salaries show karo.
SELECT doctor_name,salary  FROM doctors
ORDER BY salary DESC
LIMIT (3);
-- Q19. Patients ko registration date ke newest se oldest order mein show karo.
SELECT patient_name,registration_date  FROM patients
ORDER BY registration_date DESC;
-- Q20. First 5 patients skip karke next 5 patients show karo using OFFSET + LIMIT.
SELECT patient_name FROM patients
limit(5) offset(5);
------------------------------------------
-- Part 4 — Aggregate Functions
------------------------------------------
-- Q21. Total patients count karo.
SELECT count(*) AS total_patients FROM patients
-- Q22. Average patient age find karo.
SELECT AVG(age) AS avg_age FROM patients;
-- Q23. Maximum patient age find karo.
SELECT MAX(age) AS max_age FROM patients;
-- Q24. Minimum patient age find karo.
SELECT MIN(age) AS min_age FROM patients;
-- Q25. Doctors ki total salary find karo.
SELECT SUM(salary) AS total_salary FROM doctors;
-- Q26. Doctors ki average salary find karo.
SELECT AVG(salary) AS total_salary FROM doctors;
-- Q27. Total payment amount find karo.
 SELECT SUM(amount) AS total_payment FROM payments;
----------------------------------------------------
--   Part 6 — HAVING
-----------------------------------------------------
-- Q34. Sirf woh cities show karo jahan 2 ya zyada patients hain.
SELECT city,COUNT(*) FROM patients
GROUP BY city
HAVING COUNT(*) >= 2;
-- Q35. Sirf woh doctors show karo jinhon ne 2 ya zyada appointments handle ki hain.
SELECT doctor_id, COUNT(*) FROM appointments
GROUP BY doctor_id
HAVING COUNT(*) >= 2;
-- Q36.  Sirf woh appointment statuses show karo jinke 3 se zyada records hain.
SELECT count(patient_id) FROM appointments
GROUP BY status 
HAVING count(patient_id )> 3;
-----------------------------------------------
--  Part 7 — CASE WHEN
-----------------------------------------------
-- Q37. Patients ko age ke according classify karo:

-- 60+       → Senior
-- 40–59     → Middle Age
-- 20–39     → Adult
-- Below 20  → Young

SELECT patient_name, age,
CASE
    WHEN age::INT >= 60 THEN 'Senior'
    WHEN age::INT BETWEEN 40 AND 59 THEN 'Middle Age'
    WHEN age::INT BETWEEN 20 AND 39 THEN 'Adult'
    ELSE 'Young'
END AS age_group
FROM patients;

-- Q39. Doctors ko experience ke according classify karo:
-- 10+       → Expert
-- 5–9       → Experienced
-- Below 5   → Junior
SELECT experience_years,
CASE
    WHEN experience_years >= 10 THEN 'Expert'
	WHEN experience_years BETWEEN 5 and 9 THEN  'Experienced'
	ELSE 'Junior'
END AS experience_level
FROM doctors;
-- Q40. Appointment status ko readable form mein show karo:

-- Completed → Done
-- Pending   → Waiting
-- Cancelled → Cancelled

SELECT status, 
CASE
	WHEN status = 'Completed' THEN 'Done'
	WHEN status = 'Pending' THEN 'Waiting'
 	ELSE 'Cancelled'
	END
FROM appointments;
-------------------------------------------------
--  Part 8 — INNER JOIN
-------------------------------------------------
-- Q41. Patient name + appointment date show karo.
SELECT p.patient_name,a.appointment_date FROM appointments a
INNER JOIN patients p
ON p.patient_id = a.patient_id;
-- Q42. Patient name + doctor name show karo.
SELECT p.patient_name,d.doctor_name FROM appointments a
INNER JOIN doctors d
ON d.doctor_id = a.doctor_id
INNER JOIN patients p 
ON p.patient_id = a.patient_id;
-- Q43. Doctor name + department name show karo.

SELECT d.doctor_name,t.department_name FROM doctors d
INNER JOIN departments t
on d.department_id = t.department_id;
-- Q44. Patient name + doctor name + appointment status show karo.
SELECT p.patient_name,d.doctor_name,a.status FROM appointments a
INNER JOIN patients p
ON  p.patient_id = a.patient_id
inner join doctors d
on d.doctor_id = a.doctor_id;
-- Q45. Patient name + doctor name + diagnosis show karo.
SELECT p.patient_name,d.doctor_name,a.diagnosis FROM appointments a
INNER JOIN patients p
ON  p.patient_id = a.patient_id
inner join doctors d
on d.doctor_id = a.doctor_id;
------------------------------------------
-- Part 9 — Multi-Table JOIN
------------------------------------------
-- Q46. Patient name, doctor name, department name aur salary show karo.
SELECT p.patient_name,d.doctor_name,t.department_name FROM appointments a
INNER JOIN patients p
ON  p.patient_id = a.patient_id
inner join doctors d
on d.doctor_id = a.doctor_id
inner join departments t
on t.department_id = d.department_id;
-- Q47. Patient name, doctor name, appointment status aur payment amount show karo.
SELECT p.patient_name,d.doctor_name,a.status,py.amount FROM appointments a
INNER JOIN patients p
ON  p.patient_id = a.patient_id
inner join doctors d
on d.doctor_id = a.doctor_id
inner join payments py
on PY.appointment_id = a.appointment_id;

-- Q48. Doctor name, department name aur total payment amount find karo.
SELECT d.doctor_name,t.department_name,p.amount FROM appointments a 
INNER JOIN doctors d 
on d.doctor_id = a.doctor_id 
inner join departments t
on d.department_id = t.department_id
inner join payments p
on p.appointment_id = a.appointment_id;
-- Q49. Har department ki total payment amount find karo.
SELECT t.department_name,sum(p.amount) FROM appointments a 
INNER JOIN doctors d 
on d.doctor_id = a.doctor_id 
inner join departments t
on d.doctor_id = t.department_id
inner join payments p
on p.appointment_id = a.appointment_id
GROUP BY t.department_name, p.amount ;
-- Q50. Har doctor ne kitne completed appointments handle kiye hain?
SELECT d.doctor_name,COUNT(a.status) AS completed_appointments FROM appointments a
INNER JOIN doctors d
ON  d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
group by d.doctor_name , a.status;
------------------------------------------------------------
--  Part 10 — LEFT / RIGHT / FULL JOIN
----------------------------------------------------------------
-- Q51. Saare departments show karo, chahe unka koi doctor ho ya nahi.
SELECT t.department_name,d.doctor_name FROM departments t
LEFT join doctors d
on d.department_id = t.department_id;
-- Q52. Saare doctors show karo, chahe department matching ho ya nahi.
SELECT t.department_name,d.doctor_name FROM doctors d
LEFT join departments t
on d.department_id = t.department_id;
-- Q53. Employees/doctors aur departments ka FULL JOIN karke dono sides ka data show karo.
SELECT t.department_name,d.doctor_name FROM departments t
full join  doctors d
on d.department_id = t.department_id;
---------------------------------------
--  Part 11 — SET OPERATORS
---------------------------------------
-- Q55. Patients aur doctors ki cities ko combine karo aur duplicates remove karo.
SELECT city FROM patients
UNION 
SELECT city FROM doctors;
-- Q56. Patients aur doctors ki cities combine karo duplicates ke saath.
SELECT city FROM patients
UNION ALL 
SELECT city FROM doctors;

-- Q57. Find karo kaun si cities patients aur doctors dono mein hain.
SELECT city FROM patients
INTERSECT
select city FROM doctors;
-- Q58. Find karo kaun si cities patients mein hain lekin doctors mein nahi.
SELECT city FROM patients
EXCEPT
select city FROM doctors;
---------------------------------------
--  Final Challenge
---------------------------------------
-- Q59.Har department ki total completed-payment amount find karo. Sirf woh departments show karo jinki total payment 10,000+ hai, aur highest payment ko top par rakho.	
SELECT t.department_name,sum(p.amount)AS total_payment FROM departments t
inner join doctors d
on d.department_id = t.department_id
inner join appointments a
on d.doctor_id = a.doctor_id
inner join payments p
on p.appointment_id = a.appointment_id
WHERE a.status = 'Completed'
GROUP BY t.department_name
HAVING SUM(p.amount) >= 10000
ORDER BY total_payment DESC;


