CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE students(
	Rollno INT PRIMARY KEY, 
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

CREATE TABLE dept(
	ID INT PRIMARY KEY, 
    name VARCHAR(50)
);

INSERT INTO dept
VALUES
(101, "ENGLISH"),
(102, "IT");

SELECT * FROM dept;

UPDATE dept
SET ID = 103
WHERE ID = 102;

CREATE TABLE teachers(
	ID INT PRIMARY KEY, 
    name VARCHAR(50),
	dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(ID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

SELECT * FROM teachers;

INSERT INTO teachers
VALUES
(101, "sonam", 101),
(102, "arpit", 102);
SELECT * FROM teachers;
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




SELECT * FROM students;