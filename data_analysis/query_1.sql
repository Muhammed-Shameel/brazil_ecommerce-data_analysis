-- Active: 1784524641507@@127.0.0.1@3306@brazil_ecommerce_db
USE brazil_ecommerce_db;

SHOW tables;

SELECT * FROM customers LIMIT 5;

SELECT
    customer_state AS "State",
    COUNT(customer_unique_id) AS Customer_Count
FROM customers
GROUP BY customer_state
ORDER BY Customer_Count DESC;

SELECT
    customer_city AS "City",
    COUNT(customer_unique_id) AS Customer_Count
FROM customers
GROUP BY customer_city
ORDER BY Customer_Count DESC;

