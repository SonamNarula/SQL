CREATE DATABASE SonamNarula;
USE SonamNarula;

CREATE TABLE narulaFamily(
	name VARCHAR (50),
    age INT NOT NULL
);
SELECT * FROM narulaFamily;

INSERT INTO narulaFamily
(name, age)
VALUES
("ARPIT", 16),
("SONAM", 19);