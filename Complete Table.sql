CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE IF NOT EXISTS student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50)
);
INSERT INTO student (rollno, name) VALUES
(111, 'Appu'),
(112, 'yoyo'),
(113, 'hkjfhkajhk');

INSERT INTO student VALUES (114, 'Sonam Narula');
SELECT * FROM student;