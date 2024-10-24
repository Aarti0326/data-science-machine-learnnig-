-- Step 1: Create the hospital management database
CREATE DATABASE hospital_management;

-- Step 2: Switch to the new database
USE hospital_management;

-- Step 3: Create Hospital table
CREATE TABLE Hospital (
    hospital_id INT PRIMARY KEY AUTO_INCREMENT,
    hospital_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Step 4: Create Doctor table
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(50),
    hospital_id INT,
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id) 
    ON DELETE CASCADE
);

-- Step 5: Create Orders table for tracking customer orders
CREATE TABLE Orders (
    order_no INT PRIMARY KEY AUTO_INCREMENT,
    purchase_amount DECIMAL(10, 2),
    salesman_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

-- Step 6: Create Salesman table
CREATE TABLE Salesman (
    salesman_id INT PRIMARY KEY AUTO_INCREMENT,
    salesman_name VARCHAR(100),
    city VARCHAR(50)
);


-- 2) Fetch Hospital and Doctor Information Using hospital_id and 

SELECT h.hospital_name, h.location, d.doctor_name, d.specialty
FROM Hospital h
JOIN Doctor d ON h.hospital_id = d.hospital_id
WHERE h.hospital_id = 1 AND d.doctor_id = 2;


-- 3) Get a List of Doctors from a Given Hospital
SELECT doctor_name, specialty 
FROM Doctor
WHERE hospital_id = 1;


-- 4) Retrieve the Unique salesman_id Values from Orders Table

SELECT DISTINCT salesman_id 
FROM Orders
WHERE salesman_id IS NOT NULL;


-- 5) List Salesman Name, Customer Name, and Their Cities (Same City)

SELECT s.salesman_name, o.customer_name, s.city
FROM Salesman s
JOIN Orders o ON s.city = o.city;

-- 6) List Orders with Purchase Amount Between 500 and 2000

SELECT order_no, purchase_amount, customer_name, city
FROM Orders
WHERE purchase_amount BETWEEN 500 AND 2000;

select * from hospital


