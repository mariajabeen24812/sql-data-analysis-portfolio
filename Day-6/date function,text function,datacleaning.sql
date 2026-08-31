---------------------------------------------------------------
-- TODAY CONCEPT:date function, text function, data cleaning
----------------------------------------------------------------


DROP TABLE IF EXISTS patient_cleaning;

CREATE TABLE patient_cleaning (
    patient_id SERIAL PRIMARY KEY,
    patient_name VARCHAR(100),
    city VARCHAR(50),
    gender VARCHAR(20),
    age VARCHAR(10),
    phone VARCHAR(30),
    registration_date DATE,
    email VARCHAR(100)
);
INSERT INTO patient_cleaning
(patient_name, city, gender, age, phone, registration_date, email)
VALUES
('  Ali Khan  ', 'lahore', 'Male', '45', '03001234567', '2023-01-15', 'ali@gmail.com'),
('Sara Ahmed', 'LAHORE', 'female', '32', NULL, '2023-03-20', 'sara@gmail.com'),
(' Ahmed Raza', 'Karachi ', 'Male', '67', '03111234567', '2022-07-10', 'ahmed@gmail.com'),
('Hina Shah', 'karachi', 'Female', '29', '03221234567', '2024-01-05', NULL),
(' Bilal Khan ', 'Islamabad', 'male', '18', NULL, '2024-02-14', 'bilal@gmail.com'),
('Ayesha Noor', 'ISLAMABAD ', 'Female', '55', '03331234567', '2021-11-25', 'ayesha@gmail.com'),
('Usman Ali', 'Lahore', 'Male', '72', '03441234567', '2020-08-19', 'usman@gmail.com'),
(' Maham Javed', 'karachi', 'Female', '38', NULL, '2023-09-12', 'maham@gmail.com'),
('Danish Malik', 'Islamabad', 'Male', '25', '03551234567', '2024-04-18', 'danish@gmail.com'),
('Iqra Ahmed ', ' Lahore ', 'female', '61', '03661234567', '2022-12-01', NULL);

SELECT * FROM patient_cleaning;
------------------------------------
-- Part A — Date Functions
------------------------------------
-- Q1 Aaj ki date show karo.
SELECT CURRENT_DATE;

-- Q2 Current date + current time show karo.

SELECT  NOW();

-- Q3 Har patient ki registration date aur aaj ke darmiyan kitna time guzra hai, find karo.
SELECT patient_name,
 AGE(current_date , registration_date) AS date
FROM patient_cleaning;

-- Q4 Har patient ki registration date se year extract karo.
SELECT patient_name,
	EXTRACT(year from registration_date) 
FROM patient_cleaning;

-- Q5 Har patient ki registration date se month extract karo.
SELECT patient_name,
	EXTRACT(month from registration_date) 
FROM patient_cleaning;
-- Q6 Har patient ki registration date ko is format mein show karo:
SELECT patient_name,
	TO_CHAR(registration_date, 'dd-mon-yyyy')
FROM patient_cleaning;

-------------------------------------------
-- Part B — Text Functions
-------------------------------------------
-- Q9 Patient names ko uppercase mein show karo.
SELECT upper(patient_name) FROM patient_cleaning;

-- Q10 Patient names ko lowercase mein show karo.

SELECT LOWER(patient_name) FROM patient_cleaning;

-- Q11 Patient names ke extra spaces remove karo.
SELECT TRIM(patient_name) FROM patient_cleaning;

-- Q12 Har patient's name ki length find karo.
SELECT length(patient_name) FROM patient_cleaning;

-- Q13 Patient name aur city ko ek single column mein combine karo.
SELECT CONCAT(patient_name,'_',city) FROM patient_cleaning;

-- Q14 Cities ko uppercase + extra spaces remove karke show karo.
SELECT upper(trim(city)) FROM patient_cleaning;

-- Q15 Patient names mein 'Ali' search karo, case-insensitive.
SELECT patient_name
FROM patient_cleaning
WHERE patient_name ILIKE '%ali%';
-----------------------------------------------------
-- Part C — Data Cleaning
-----------------------------------------------------
-- Q16 Check karo ke city mein kaun kaun si different values stored hain.
SELECT DISTINCT(city) FROM patient_cleaning;


-- Q17 City ko clean karo:
SELECT UPPER(TRIM(city)) FROM patient_cleaning;

-- Q18 Patient names ke extra spaces remove karke clean names show karo.
SELECT TRIM(patient_name) FROM patient_cleaning;
-- Q19
-- Missing phone numbers ko:No Phone se replace karo.
SELECT COALESCE(phone,'No Phone') FROM patient_cleaning;

-- Q20 Missing emails ko: No Email se replace karo.
SELECT COALESCE(email,'No Email') FROM patient_cleaning;
-- Q21 age VARCHAR mein hai. Isko INTEGER mein convert karke show karo.
SELECT age :: INT FROM patient_cleaning;

-- Q22 Clean patient data show karo jisme:patient name → extra spaces removed city → uppercase + spaces removed
-- gender → uppercase -- age → integer -- phone NULL → No Phone
-- email NULL → No Email
SELECT TRIM(patient_name),
	TRIM(UPPER(city)),
	UPPER(gender),
	age:: INT,
	COALESCE(phone,'No Phone'),
	COALESCE(email,'No Email')
FROM patient_cleaning;
-------------------------------------------------
-- Part D — Data Cleaning + Date
-------------------------------------------------
-- Q23 Clean city aur registration year dono show karo.
SELECT UPPER(TRIM(city)),EXTRACT (year from registration_date) FROM patient_cleaning;

-- Q24 Sirf un patients ko show karo jinka registration year 2023 ya uske baad hai.
SELECT patient_name, EXTRACT(year from registration_date) FROM patient_cleaning
where EXTRACT(year from registration_date) >=2023;





