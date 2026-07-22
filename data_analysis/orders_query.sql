USE brazil_ecommerce_db;

SELECT *
FROM orders
LIMIT 10;


SELECT COUNT(DISTINCT order_id) AS "Distint No.of Orders"
FROM orders;

SELECT COUNT(DISTINCT customer_id) AS "Distinct No.of Customers"
FROM orders;


SELECT 
    order_status, 
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;
