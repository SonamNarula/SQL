CREATE DATABASE new_college;
USE new_college;

CREATE TABLE Student_ (
    rollno INT PRIMARY KEY,
    full_name VARCHAR(50),
    marks INT,
    city VARCHAR(30),
    age INT
);

INSERT INTO Student_ (rollno, full_name, marks, city, age) VALUES
(1, 'Aarav Sharma', 85, 'Delhi', 18),
(2, 'Priya Mehta', 90, 'Mumbai', 19),
(3, 'Rohit Verma', 78, 'Delhi', 18),
(4, 'Anjali Singh', 88, 'Kolkata', 20),
(5, 'Neha Kapoor', 70, 'Mumbai', 18);

CREATE TABLE Course_ (
    rollno INT,
    course_name VARCHAR(50),
    duration INT,
    FOREIGN KEY (rollno) REFERENCES Student_(rollno)
);

INSERT INTO Course_ (rollno, course_name, duration) VALUES
(1, 'Mathematics', 3),
(2, 'Physics', 4),
(3, 'Chemistry', 3),
(4, 'Biology', 2),
(5, 'Computer Science', 4);

SHOW TABLES;

SELECT * FROM Student_;


DESCRIBE Student_;
DESCRIBE Course_;

SELECT 
    A.full_name AS Student1,
    B.full_name AS Student2,
    A.city
FROM 
    Student_ A
JOIN 
    Student_ B 
ON 
    A.city = B.city AND A.rollno < B.rollno;
    
SELECT Student_.full_name, Course_.course_name
FROM Student_
INNER JOIN Course_ ON Student_.rollno = Course_.rollno;

SELECT Student_.full_name, Course_.course_name
FROM Student_
LEFT JOIN Course_ ON Student_.rollno = Course_.rollno;


SELECT Student_.full_name, Course_.course_name
FROM Student_
RIGHT JOIN Course_ ON Student_.rollno = Course_.rollno;



SELECT Student_.full_name, Course_.course_name
FROM Student_
LEFT JOIN Course_ ON Student_.rollno = Course_.rollno

UNION

SELECT Student_.full_name, Course_.course_name
FROM Student_
RIGHT JOIN Course_ ON Student_.rollno = Course_.rollno;


SELECT Student_.full_name, Course_.course_name
FROM Student_
CROSS JOIN Course_;