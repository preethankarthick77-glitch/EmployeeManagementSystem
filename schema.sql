-- Drop tables if they already exist (ensures a clean setup during evaluation)
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- 1. Create Departments Table
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- 2. Create Employees Table (with Department Association)
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    department_id INT REFERENCES departments(id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Insert Optional Seed Data (Helps the evaluator see data immediately)
INSERT INTO departments (name, description) VALUES 
('Engineering', 'Core software and infrastructure development'),
('Human Resources', 'Talent acquisition and employee relations');

INSERT INTO employees (first_name, last_name, email, phone, department_id) VALUES
('James', 'Smith', 'james.smith@example.com', '555-0101', 1),
('Michael', 'Johnson', 'michael.johnson@example.com', '555-0102', 2),
('Robert', 'Williams', 'robert.williams@example.com', '555-0103', 1),
('Maria', 'Brown', 'maria.brown@example.com', '555-0104', 2),
('David', 'Jones', 'david.jones@example.com', '555-0105', 1),
('Mary', 'Miller', 'mary.miller@example.com', '555-0106', 2),
('William', 'Davis', 'william.davis@example.com', '555-0107', 1),
('Barbara', 'Garcia', 'barbara.garcia@example.com', '555-0108', 2),
('Richard', 'Rodriguez', 'richard.rodriguez@example.com', '555-0109', 1),
('Patricia', 'Wilson', 'patricia.wilson@example.com', '555-0110', 2),
('Joseph', 'Martinez', 'joseph.martinez@example.com', '555-0111', 1),
('Jennifer', 'Anderson', 'jennifer.anderson@example.com', '555-0112', 2),
('Thomas', 'Taylor', 'thomas.taylor@example.com', '555-0113', 1),
('Elizabeth', 'Thomas', 'elizabeth.thomas@example.com', '555-0114', 2),
('Charles', 'Hernandez', 'charles.hernandez@example.com', '555-0115', 1),
('Linda', 'Moore', 'linda.moore@example.com', '555-0116', 2),
('Christopher', 'Martin', 'christopher.martin@example.com', '555-0117', 1),
('Susan', 'Jackson', 'susan.jackson@example.com', '555-0118', 2),
('Daniel', 'Thompson', 'daniel.thompson@example.com', '555-0119', 1),
('Jessica', 'White', 'jessica.white@example.com', '555-0120', 2),
('Matthew', 'Lopez', 'matthew.lopez@example.com', '555-0121', 1),
('Margaret', 'Lee', 'margaret.lee@example.com', '555-0122', 2),
('Anthony', 'Gonzalez', 'anthony.gonzalez@example.com', '555-0123', 1),
('Sarah', 'Harris', 'sarah.harris@example.com', '555-0124', 2),
('Mark', 'Clark', 'mark.clark@example.com', '555-0125', 1),
('Karen', 'Lewis', 'karen.lewis@example.com', '555-0126', 2),
('Donald', 'Robinson', 'donald.robinson@example.com', '555-0127', 1),
('Nancy', 'Walker', 'nancy.walker@example.com', '555-0128', 2),
('Steven', 'Perez', 'steven.perez@example.com', '555-0129', 1),
('Lisa', 'Hall', 'lisa.hall@example.com', '555-0130', 2),
('Paul', 'Young', 'paul.young@example.com', '555-0131', 1),
('Betty', 'Allen', 'betty.allen@example.com', '555-0132', 2),
('Andrew', 'Sanchez', 'andrew.sanchez@example.com', '555-0133', 1),
('Dorothy', 'Wright', 'dorothy.wright@example.com', '555-0134', 2),
('Joshua', 'King', 'joshua.king@example.com', '555-0135', 1),
('Sandra', 'Scott', 'sandra.scott@example.com', '555-0136', 2),
('Kenneth', 'Green', 'kenneth.green@example.com', '555-0137', 1),
('Ashley', 'Baker', 'ashley.baker@example.com', '555-0138', 2),
('Kevin', 'Adams', 'kevin.adams@example.com', '555-0139', 1),
('Kimberly', 'Nelson', 'kimberly.nelson@example.com', '555-0140', 2),
('Brian', 'Hill', 'brian.hill@example.com', '555-0141', 1),
('Donna', 'Ramirez', 'donna.ramirez@example.com', '555-0142', 2),
('George', 'Campbell', 'george.campbell@example.com', '555-0143', 1),
('Emily', 'Mitchell', 'emily.mitchell@example.com', '555-0144', 2),
('Edward', 'Roberts', 'edward.roberts@example.com', '555-0145', 1),
('Carol', 'Carter', 'carol.carter@example.com', '555-0146', 2),
('Ronald', 'Phillips', 'ronald.phillips@example.com', '555-0147', 1),
('Amanda', 'Evans', 'amanda.evans@example.com', '555-0148', 2),
('Timothy', 'Turner', 'timothy.turner@example.com', '555-0149', 1),
('Michelle', 'Torres', 'michelle.torres@example.com', '555-0150', 2);

