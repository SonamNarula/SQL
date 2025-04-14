CREATE DATABASE customer;
USE customer;

CREATE TABLE payments (
	cust_id INT PRIMARY KEY,
    cust_name VARCHAR(200),
    cust_mode VARCHAR(100),
    cust_city VARCHAR(100)
);

INSERT INTO payments 
(cust_id, cust_name, cust_mode, cust_city)
VALUES
(101, "Olivia Barrett", "Netbanking", "Portland"),
(102, "Ethen Sinclair", "Credit card", "Miami"),
(103, "Maya Hernandez", "Credit card", "Seattle"),
(104, "Liam Donovan", "Netbanking", "Denver"),
(105, "Sophia Nayuyen", "Credit card", "New Orleans"),
(106, "Caleb Foster", "Debit card", "Mimeapollis"),
(107, "Ava Patel", "Debit card", "Phoenix"),
(108, "Lucas Carter", "Netbanking", "Boston"),
(109, "Isabella Martinez", "Netbanking", "Nashville"),
(110, "Jackson Brooks", "Credit card", "Boston");

SELECT * FROM payments;

SELECT cust_mode, COUNT(cust_name)
FROM payments
GROUP BY cust_mode;