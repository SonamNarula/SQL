CREATE DATABASE IF NOT EXISTS colleges;
USE colleges;

CREATE TABLE IF NOT EXISTS students (
    rollno INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    marks INT NOT NULL,
    grade VARCHAR(2),
    city VARCHAR(30),
    age INT
);
ALTER TABLE students
CHANGE name full_name VARCHAR(50) NOT NULL;

DELETE FROM students
WHERE marks < 80;

ALTER TABLE students
DROP COLUMN grade;


INSERT INTO students (rollno, full_name, marks, grade, city, age)
VALUES 
(1, 'A', 70, 'C', 'Delhi', 18),
(2, 'B', 80, 'B', 'Mumbai', 19),
(3, 'C', 90, 'A', 'Kolkata', 18),
(4, 'D', 60, 'D', 'Chennai', 20);

SELECT * FROM students;