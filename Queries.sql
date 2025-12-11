CREATE DATABASE hospital_db;
USE hospital_db;


SET FOREIGN_KEY_CHECKS = 0;

SET FOREIGN_KEY_CHECKS = 1;

-- 1. PATIENTS
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(20),
    address VARCHAR(200),
    created_date DATE
);


-- 2. DEPARTMENTS
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);


-- 3. DOCTORS
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100),
    phone VARCHAR(20),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


-- 4. APPOINTMENTS
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- 5. ROOMS
CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_type VARCHAR(50),
    charges_per_day DECIMAL(10,2)
);

-- 6. ADMISSIONS
CREATE TABLE admissions (
    admission_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    room_id INT,
    admit_date DATE,
    discharge_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- 7. BILLING
CREATE TABLE billing (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);


-- 8. PAYMENTS
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    bill_id INT,
    payment_date DATE,
    method VARCHAR(20),
    amount DECIMAL(10,2),
    FOREIGN KEY (bill_id) REFERENCES billing(bill_id)
);



INSERT INTO departments (name) VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('General Medicine');


INSERT INTO patients (name, age, gender, phone, address, created_date) VALUES
('Patient1', 30, 'Male', '8881112221', 'City1', '2024-10-20'),
('Patient2', 25, 'Female', '8881112222', 'City2', '2024-10-21'),
('Patient3', 40, 'Male', '8881112223', 'City3', '2024-10-22'),
('Patient4', 35, 'Female', '8881112224', 'City4', '2024-10-23'),
('Patient5', 28, 'Male', '8881112225', 'City5', '2024-10-24'),
('Patient6', 50, 'Male', '8881112226', 'City6', '2024-10-25'),
('Patient7', 45, 'Female', '8881112227', 'City7', '2024-10-26'),
('Patient8', 32, 'Male', '8881112228', 'City8', '2024-10-27'),
('Patient9', 29, 'Female', '8881112229', 'City9', '2024-10-28'),
('Patient10', 55, 'Male', '8881112230', 'City10', '2024-10-29');



INSERT INTO doctors (name, specialty, department_id, phone) VALUES
('Dr. Amit Joshi', 'Heart Specialist', 1, '9000011111'),
('Dr. Sarika Nair', 'Brain Specialist', 2, '9000022222'),
('Dr. Rohit Mane', 'Bone Specialist', 3, '9000033333'),
('Dr. Snehal Patki', 'Child Specialist', 4, '9000044444'),
('Dr. Kiran Shukla', 'Physician', 5, '9000055555'),
('Dr. Ritesh Kulkarni', 'Cardiologist', 1, '9000066666'),
('Dr. Priyanka Sane', 'Neurologist', 2, '9000077777'),
('Dr. Ajay Thorat', 'Orthopedic Surgeon', 3, '9000088888'),
('Dr. Manasi Puri', 'Pediatrician', 4, '9000099999'),
('Dr. Vivek Jadhav', 'General Physician', 5, '9000012345');

INSERT INTO doctors (name, specialty, department_id, phone)
VALUES
('Doctor1', 'Cardiology', 1, '9000000001'),
('Doctor2', 'Neurology', 2, '9000000002'),
('Doctor3', 'Orthopedic', 3, '9000000003'),
('Doctor4', 'Pediatrics', 4, '9000000004'),
('Doctor5', 'Dermatology', 5, '9000000005'),
('Doctor6', 'General', 1, '9000000006'),
('Doctor7', 'General', 2, '9000000007'),
('Doctor8', 'General', 3, '9000000008'),
('Doctor9', 'General', 4, '9000000009'),
('Doctor10', 'General', 5, '9000000010');





INSERT INTO appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2024-11-01', 'Completed'),
(2, 2, '2024-11-02', 'Completed'),
(3, 3, '2024-11-02', 'Cancelled'),
(4, 4, '2024-11-03', 'Completed'),
(5, 5, '2024-11-03', 'Pending'),
(6, 1, '2024-11-04', 'Completed'),
(7, 2, '2024-11-05', 'Pending'),
(8, 3, '2024-11-05', 'Completed'),
(9, 4, '2024-11-06', 'Completed'),
(10, 5, '2024-11-07', 'Completed'),
(1, 6, '2024-11-08', 'Completed'),
(2, 7, '2024-11-09', 'Pending'),
(3, 8, '2024-11-10', 'Completed'),
(4, 9, '2024-11-11', 'Completed'),
(5, 10, '2024-11-12', 'Pending');


INSERT INTO rooms (room_type, charges_per_day) VALUES
('General Ward', 1200),
('Private Room', 3000),
('Semi-Private Room', 2000),
('ICU', 8000),
('Deluxe Room', 5000);

INSERT INTO admissions (patient_id, room_id, admit_date, discharge_date) VALUES
(1, 2, '2024-10-20', '2024-10-23'),
(2, 3, '2024-10-18', '2024-10-20'),
(3, 1, '2024-10-25', NULL),
(4, 5, '2024-10-19', '2024-10-21'),
(5, 4, '2024-10-15', '2024-10-17'),
(6, 2, '2024-10-22', NULL),
(7, 3, '2024-10-10', '2024-10-13'),
(8, 1, '2024-10-12', '2024-10-16'),
(9, 4, '2024-10-11', NULL),
(10, 5, '2024-10-14', '2024-10-16');

INSERT INTO billing (appointment_id, amount, status) VALUES
(1, 1500, 'Paid'),
(2, 1800, 'Paid'),
(3, 0, 'Cancelled'),
(4, 2000, 'Paid'),
(5, 1200, 'Unpaid'),
(6, 1500, 'Paid'),
(7, 2200, 'Unpaid'),
(8, 1300, 'Paid'),
(9, 1600, 'Paid'),
(10, 1400, 'Paid'),
(11, 1500, 'Paid'),
(12, 2200, 'Unpaid'),
(13, 2100, 'Paid'),
(14, 1800, 'Paid'),
(15, 1200, 'Unpaid');


INSERT INTO payments (bill_id, payment_date, method, amount) VALUES
(1, '2024-11-02', 'UPI', 1500),
(2, '2024-11-03', 'Card', 1800),
(4, '2024-11-04', 'UPI', 2000),
(6, '2024-11-05', 'Cash', 1500),
(8, '2024-11-06', 'UPI', 1300),
(9, '2024-11-07', 'Card', 1600),
(10, '2024-11-08', 'UPI', 1400),
(11, '2024-11-09', 'UPI', 1500),
(13, '2024-11-10', 'Card', 2100),
(14, '2024-11-11', 'Cash', 1800);

-- TOP 25 SQL QUERIES (Hospital Project)
# TOP 25 SQL QUERIES (Hospital Project)
/*  
TOP 25 SQL QUERIES (Hospital Project)
*/


-- 1)  All Patients List
SELECT * FROM patients;


-- 2)  All Doctors With Their Departments

SELECT d.name AS doctor, d.specialty, dept.name AS department
FROM doctors d
JOIN departments dept ON d.department_id = dept.department_id;



-- 3)  Appointments Details With Patient & Doctor Names

SELECT a.appointment_id, p.name AS patient, d.name AS doctor, a.appointment_date, a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 4)  Count Patients in Each City

SELECT address, COUNT(*) AS total_patients
FROM patients
GROUP BY address;

-- 5)  Total Doctors in Each Department

SELECT department_id, COUNT(*) AS total_doctors
FROM doctors
GROUP BY department_id;

-- 6) Find Doctors Who Have More Than 1 Appointment

SELECT doctor_id, COUNT(*) AS total_appointments
FROM appointments
GROUP BY doctor_id
HAVING COUNT(*) > 1;

-- 7) Find All Pending Appointments

SELECT * FROM appointments
WHERE status = 'Pending';

-- 8) Patients Who Paid Bill Using UPI

SELECT pay.payment_id, b.bill_id, pay.method
FROM payments pay
JOIN billing b ON pay.bill_id = b.bill_id
WHERE pay.method = 'UPI';

-- 9)  Total Revenue Collected (Paid Bills)
SELECT pay.payment_id, b.bill_id, pay.method
FROM payments pay
JOIN billing b ON pay.bill_id = b.bill_id
WHERE pay.method = 'UPI';

-- 10) Patients Admitted but Not Discharged
SELECT p.name, a.room_id, a.admit_date
FROM admissions a
JOIN patients p ON a.patient_id = p.patient_id
WHERE discharge_date IS NULL;

-- 11) Doctor Wise Appointment Count
SELECT d.name, COUNT(*) AS total_appointments
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.name;

-- 12) Patient Wise Billing Summary
SELECT p.name, SUM(b.amount) AS total_amount
FROM billing b
JOIN appointments a ON b.appointment_id = a.appointment_id
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY p.name;

-- 13) Highest Bill Amount
SELECT *
FROM billing
ORDER BY amount DESC
LIMIT 1;

-- 14) Patients With More Than 2 Appointments
SELECT p.name, COUNT(*) AS total_visits
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY p.name
HAVING total_visits > 2;


-- 15) Most Expensive Room Type
SELECT *
FROM rooms
ORDER BY charges_per_day DESC
LIMIT 1;

-- 16) Doctors Who Have No Appointments
SELECT d.name
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
WHERE a.appointment_id IS NULL;

-- 17) Patients Without Any Billing
SELECT p.name
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
LEFT JOIN billing b ON a.appointment_id = b.appointment_id
WHERE b.bill_id IS NULL;

-- 18) Department Wise Total Revenue
SELECT dept.name AS department, SUM(b.amount) AS department_revenue
FROM billing b
JOIN appointments a ON b.appointment_id = a.appointment_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN departments dept ON d.department_id = dept.department_id
WHERE b.status = 'Paid'
GROUP BY dept.name;

-- 19) Latest 3 Appointments
SELECT *
FROM appointments
ORDER BY appointment_date DESC
LIMIT 3;

-- 20) Most Frequent Patient (Most Visits)
SELECT p.name, COUNT(*) AS visits
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY p.patient_id
ORDER BY visits DESC
LIMIT 1;

-- 21) Rank Patients by Total Bill Amount
SELECT p.name, SUM(b.amount) AS total_bill,
RANK() OVER (ORDER BY SUM(b.amount) DESC) AS bill_rank
FROM billing b
JOIN appointments a ON b.appointment_id = a.appointment_id
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY p.name;

-- 22) Rank Doctors by Number of Appointments
SELECT d.name, COUNT(*) AS total_appointments,
DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS doctor_rank
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.name;

-- 23) Running Total of Revenue Over Time
SELECT payment_date, amount,
SUM(amount) OVER (ORDER BY payment_date) AS running_total
FROM payments;

-- 24) Month Wise Patient Visit Count
SELECT DATE_FORMAT(appointment_date, '%Y-%m') AS month, COUNT(*) AS visits
FROM appointments
GROUP BY month;

-- 25) Find Which Payment Method Has Highest Usage
SELECT method, COUNT(*) AS total
FROM payments
GROUP BY method
ORDER BY total DESC;

----------------------------   END   -------------------------------
