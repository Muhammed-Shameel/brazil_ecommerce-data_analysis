-- Active: 1784524641507@@127.0.0.1@3306@brazil_ecommerce_db
USE brazil_ecommerce_db;

SHOW tables;

/* Selecting 5 raws from the customers table */
SELECT * FROM customers LIMIT 5;

SELECT COUNT(*)
FROM customers;

SELECT customer_id,
COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT customer_unique_id,
COUNT(*)
FROM customers
GROUP BY customer_unique_id
HAVING COUNT(*) > 1;
/*Which states have the highest number of customers? */
SELECT
    customer_state AS "State",
    COUNT(customer_unique_id) AS Customer_Count
FROM customers
GROUP BY customer_state
ORDER BY Customer_Count DESC;

/*How many distint states and there and which are they? */
SELECT COUNT(DISTINCT customer_state)
FROM customers;
SELECT DISTINCT customer_state
FROM customers;

/*Which city have the highest number of customers?*/
SELECT
    customer_city AS "City",
    COUNT(customer_unique_id) AS Customer_Count
FROM customers
GROUP BY customer_city
ORDER BY Customer_Count DESC LIMIT 10;


/* Which are the top 10 cities */
SELECT
customer_city,
COUNT(*) AS customers
FROM customers
GROUP BY customer_city
ORDER BY customers DESC
LIMIT 10;

/* Which are the top 10 states */
SELECT
customer_state,
COUNT(*) AS customers
FROM customers
GROUP BY customer_state
ORDER BY customers DESC
LIMIT 10;

SELECT
COUNT(DISTINCT customer_city)
FROM customers;

SELECT
COUNT(DISTINCT customer_unique_id)
FROM customers;


