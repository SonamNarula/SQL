CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE students(
	Rollno INT PRIMARY KEY, 
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

SELECT * FROM students;

INSERT INTO students
(RollNo, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

SELECT DISTINCT city FROM students;

SELECT  city
FROM students
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks)>90 
ORDER BY city DESC
ORDER BY city ASC;
