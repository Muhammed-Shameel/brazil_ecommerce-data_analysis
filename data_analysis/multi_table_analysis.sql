USE brazil_ecommerce_db;

SHOW tables;

SELECT *
FROM ;

/* Top 10 orders */
SELECT 
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
LIMIT 10;

/* Top 10 most paid order by customer */
SELECT 
    c.customer_unique_id,
    SUM(p.payment_value) AS total_payment
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments p
    ON o.order_id = p.order_id

GROUP BY c.customer_unique_id
ORDER BY total_payment DESC
LIMIT 10;

/* Top 10 most item buyed customer */
SELECT 
    c.customer_unique_id,
    COUNT(i.order_item_id) AS total_ordered_items
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items i
    ON o.order_id = i.order_id

GROUP BY c.customer_unique_id
ORDER BY total_ordered_items DESC
LIMIT 10;


/*Which sellers sold the most order items? */

SELECT
    s.seller_id,
    COUNT(i.seller_id) AS total_selled
FROM sellers s
JOIN order_items i
    ON s.seller_id = i.seller_id
GROUP BY s.seller_id
ORDER BY total_selled DESC
LIMIT 10;

/* Which seller produces the most revenue? */
SELECT
    s.seller_id,
    SUM(i.price) AS total_amount
FROM sellers s
JOIN order_items i
    ON s.seller_id = i.seller_id
GROUP BY s.seller_id
ORDER BY total_amount DESC
LIMIT 10;


/* Which are the top selling categories? */

SELECT 
    pt.product_category_name_english,
    COUNT(o.order_id) AS total_orders
FROM
    products p
JOIN order_items i
    ON p.product_id = i.product_id
JOIN product_category_name_translation pt
    ON p.product_category_name = pt.product_category_name
JOIN orders o
    ON i.order_id = o.order_id
GROUP BY pt.product_category_name_english
ORDER BY total_orders DESC
LIMIT 10;


