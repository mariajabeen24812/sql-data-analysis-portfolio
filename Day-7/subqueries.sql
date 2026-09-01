DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS patients;

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    doctor_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    experience_years INT,
    salary NUMERIC(10,2)
);

INSERT INTO doctors
(doctor_name, department, city, experience_years, salary)
VALUES
('Dr. Ahmed', 'Cardiology', 'Lahore', 12, 180000),
('Dr. Sara', 'Neurology', 'Karachi', 8, 150000),
('Dr. Ali', 'Cardiology', 'Lahore', 5, 120000),
('Dr. Hina', 'Dermatology', 'Islamabad', 10, 140000),
('Dr. Bilal', 'Neurology', 'Karachi', 3, 100000),
('Dr. Ayesha', 'Pediatrics', 'Lahore', 7, 110000),
('Dr. Usman', 'Dermatology', 'Multan', 4, 95000),
('Dr. Maria', 'Pediatrics', 'Karachi', 11, 135000);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(20),
    age INT,
    city VARCHAR(50)
);

INSERT INTO patients
(patient_name, gender, age, city)
VALUES
('Ali Khan', 'Male', 65, 'Lahore'),
('Sara Ahmed', 'Female', 32, 'Karachi'),
('Ahmed Raza', 'Male', 72, 'Islamabad'),
('Hina Shah', 'Female', 45, 'Lahore'),
('Bilal Khan', 'Male', 28, 'Karachi'),
('Ayesha Noor', 'Female', 55, 'Lahore'),
('Usman Ali', 'Male', 67, 'Multan'),
('Maham Javed', 'Female', 38, 'Karachi'),
('Danish Malik', 'Male', 22, 'Islamabad'),
('Iqra Ahmed', 'Female', 61, 'Lahore');

CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(30),
    payment NUMERIC(10,2)
);

INSERT INTO appointments
(patient_id, doctor_id, appointment_date, status, payment)
VALUES
(1, 1, '2026-01-10', 'Completed', 15000),
(2, 2, '2026-01-12', 'Completed', 12000),
(3, 1, '2026-01-15', 'Pending', 0),
(4, 3, '2026-02-05', 'Completed', 10000),
(5, 5, '2026-02-10', 'Completed', 8000),
(6, 6, '2026-02-15', 'Completed', 9000),
(7, 7, '2026-03-01', 'Cancelled', 0),
(8, 8, '2026-03-05', 'Completed', 11000),
(9, 4, '2026-03-10', 'Completed', 13000),
(10, 1, '2026-03-15', 'Completed', 16000),
(1, 2, '2026-04-01', 'Completed', 14000),
(3, 1, '2026-04-05', 'Completed', 17000);

-- Aise doctors find karo jinki salary average doctor salary se zyada hai.
SELECT doctor_name,salary FROM doctors
WHERE salary > (
	SELECT AVG(salary) from doctors
);

-- Aise patients find karo jinki age average patient age se zyada hai.
SELECT patient_name,age FROM patients
WHERE age > (
	SELECT AVG(age) FROM patients
);

-- Aise doctors find karo jinka experience average experience se zyada hai.
SELECT doctor_name,experience_years FROM doctors
WHERE experience_years > (
	SELECT AVG(experience_years) FROM  doctors
);

-- Sabse highest salary wale doctor ko find karo.
SELECT doctor_name,salary FROM doctors
WHERE salary = (
	SELECT MAX(salary) from doctors
);

-- Aise doctors find karo jinki salary minimum salary se zyada hai
SELECT doctor_name,salary FROM doctors
WHERE salary > (
	SELECT MIN(salary) FROM doctors
);

-- Aise patients find karo jinki age maximum age ke equal hai
SELECT patient_name,age FROM patients
WHERE age = (
	SELECT MAX(age) FROM patients
);
----------------------------------------------------------
-- Part B — IN + Subquery
-----------------------------------------------------------
-- Un doctors ko find karo jo un cities mein kaam kar rahe hain jahan patients exist karte hain.
SELECT doctor_name,city FROM doctors
WHERE city IN (
	SELECT city FROM patients
);
-- Un patients ko find karo jinhon ne at least ek appointment li hai.
SELECT p.patient_name,a.appointment_id FROM appointments a
inner join patients p
on a.patient_id = p.patient_id
WHERE appointment_id  IN (
	SELECT appointment_id FROM appointments
	WHERE appointment_id <= 1
);

SELECT patient_name
FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM appointments
);
-- Un doctors ko find karo jinhon ne at least ek appointment handle ki hai.
SELECT doctor_name
FROM doctors
WHERE doctor_id IN (
    SELECT doctor_id
    FROM appointments
);
