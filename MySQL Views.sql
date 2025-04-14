
CREATE DATABASE IF NOT EXISTS college_management;
USE college_management;


CREATE TABLE IF NOT EXISTS STUDENTS (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    roll_number VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    pincode VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS academic_records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    semester INT NOT NULL,
    total_marks DECIMAL(5,2),
    percentage DECIMAL(5,2),
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    UNIQUE KEY (student_id, semester)
);


CREATE TABLE IF NOT EXISTS COURSES (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    credits INT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    status ENUM('Active', 'Completed', 'Dropped') DEFAULT 'Active',
    FOREIGN KEY (student_id) REFERENCES STUDENTS(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES COURSES(course_id) ON DELETE CASCADE,
    UNIQUE KEY (student_id, course_id)
);


INSERT INTO STUDENTS (roll_number, first_name, last_name, email, date_of_birth, gender, city) VALUES
('CLG2024001', 'Aarav', 'Sharma', 'aarav.sharma@example.com', '2003-05-15', 'Male', 'Delhi'),
('CLG2024002', 'Priya', 'Patel', 'priya.patel@example.com', '2002-11-22', 'Female', 'Mumbai'),
('CLG2024003', 'Rahul', 'Verma', 'rahul.verma@example.com', '2003-03-08', 'Male', 'Bangalore'),
('CLG2024004', 'Ananya', 'Singh', 'ananya.singh@example.com', '2002-07-30', 'Female', 'Kolkata'),
('CLG2024005', 'Vikram', 'Joshi', 'vikram.joshi@example.com', '2003-01-18', 'Male', 'Hyderabad'),
('CLG2024006', 'Neha', 'Gupta', 'neha.gupta@example.com', '2002-09-05', 'Female', 'Chennai');


INSERT INTO COURSES (course_code, course_name, department, credits, description) VALUES
('CS101', 'Introduction to Programming', 'Computer Science', 4, 'Fundamentals of programming using Python'),
('MATH201', 'Calculus I', 'Mathematics', 3, 'Differential and integral calculus'),
('PHYS101', 'Physics I', 'Physics', 4, 'Mechanics and thermodynamics'),
('ENG101', 'English Composition', 'Humanities', 3, 'Academic writing and communication skills'),
('CHEM101', 'General Chemistry', 'Chemistry', 4, 'Basic principles of chemistry');

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-10'),
(1, 2, '2024-01-10'),
(2, 1, '2024-01-11'),
(2, 3, '2024-01-11'),
(3, 4, '2024-01-12'),
(4, 5, '2024-01-12'),
(5, 2, '2024-01-13'),
(6, 3, '2024-01-13'),
(6, 4, '2024-01-13');


INSERT INTO academic_records (student_id, semester, total_marks, percentage, grade) VALUES
(1, 1, 450, 90.0, 'A'),
(2, 1, 420, 84.0, 'B'),
(3, 1, 380, 76.0, 'C'),
(4, 1, 395, 79.0, 'B'),
(5, 1, 410, 82.0, 'B'),
(6, 1, 440, 88.0, 'A');

SELECT 
    s.roll_number,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    ar.semester,
    ar.percentage,
    ar.grade
FROM 
    STUDENTS s
JOIN 
    academic_records ar ON s.student_id = ar.student_id
ORDER BY 
    ar.percentage DESC;

SELECT 
    s.roll_number,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name
FROM 
    STUDENTS s
JOIN 
    enrollments e ON s.student_id = e.student_id
JOIN 
    COURSES c ON e.course_id = c.course_id
WHERE 
    c.course_code = 'CS101';


SELECT 
    roll_number,
    CONCAT(first_name, ' ', last_name) AS student_name
FROM 
    STUDENTS
WHERE 
    RIGHT(roll_number, 1) % 2 = 0;


SELECT 
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    ar.percentage
FROM 
    STUDENTS s
JOIN 
    academic_records ar ON s.student_id = ar.student_id
WHERE 
    ar.percentage > (SELECT AVG(percentage) FROM academic_records);


SELECT 
    c.course_code,
    c.course_name,
    COUNT(e.student_id) AS enrolled_students
FROM 
    COURSES c
LEFT JOIN 
    enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_id
ORDER BY 
    enrolled_students DESC;
    
    
    
SELECT 
    CONCAT(first_name, ' ', last_name) AS student_name,
    percentage
FROM 
    STUDENTS s
JOIN 
    academic_records ar ON s.student_id = ar.student_id
WHERE 
    ar.percentage > (SELECT AVG(percentage) FROM academic_records)
ORDER BY 
    percentage DESC;
    
    
SELECT 
    roll_number,
    CONCAT(first_name, ' ', last_name) AS student_name
FROM 
    STUDENTS
WHERE 
    RIGHT(roll_number, 1) % 2 = 0
ORDER BY 
    roll_number;
    
    
SELECT 
    MAX(ar.percentage) AS max_percentage_delhi
FROM 
    academic_records ar
JOIN 
    STUDENTS s ON ar.student_id = s.student_id
WHERE 
    s.city = 'Delhi';
    
CREATE VIEW top_performers AS
SELECT 
    s.roll_number,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    ar.percentage,
    ar.grade
FROM 
    STUDENTS s
JOIN 
    academic_records ar ON s.student_id = ar.student_id
WHERE 
    ar.percentage > 85
ORDER BY 
    ar.percentage DESC;
    
CREATE VIEW student_enrollments AS
SELECT 
    s.roll_number,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_code,
    c.course_name,
    e.enrollment_date,
    e.status
FROM 
    STUDENTS s
JOIN 
    enrollments e ON s.student_id = e.student_id
JOIN 
    courses c ON e.course_id = c.course_id;
    
    
CREATE VIEW city_performance_stats AS
SELECT 
    s.city,
    COUNT(*) AS student_count,
    AVG(ar.percentage) AS avg_percentage,
    MAX(ar.percentage) AS max_percentage,
    MIN(ar.percentage) AS min_percentage
FROM 
    STUDENTS s
JOIN 
    academic_records ar ON s.student_id = ar.student_id
GROUP BY 
    s.city
ORDER BY 
    avg_percentage DESC;
    
    
SELECT * FROM top_performers;
SELECT * FROM student_enrollments WHERE roll_number = 'CLG2024001';
SELECT * FROM city_performance_stats;