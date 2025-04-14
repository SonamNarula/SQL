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

SELECT full_name, city
FROM Student_
WHERE city = 'Delhi'
UNION
SELECT full_name, city
FROM Student_
WHERE city = 'Mumbai';



SELECT full_name, city
FROM Student_
WHERE city = 'Delhi'
UNION ALL
SELECT full_name, city
FROM Student_
WHERE city = 'Mumbai';


SELECT full_name, city
FROM Student_
WHERE age = 18
UNION
SELECT full_name, city
FROM Student_
WHERE marks > 80;


SELECT full_name AS Name, city AS City
FROM Student_
WHERE age = 18
UNION
SELECT full_name AS Name, city AS City
FROM Student_
WHERE marks > 80;
