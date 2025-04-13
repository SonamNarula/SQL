CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

INSERT INTO student VALUES (1, "SONAM", 19);
INSERT INTO student VALUES (2, "ARPIT", 21);

SELECT * FROM student;