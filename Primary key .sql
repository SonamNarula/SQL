CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE student1(
	rollno INT PRIMARY KEY, 
    name VARCHAR(50)
);

SELECT * FROM student1;

CREATE TABLE temp1(
	id INT ,
    name VARCHAR(50),
    age INT, 
    city VARCHAR (20),
    PRIMARY KEY (id)
);
