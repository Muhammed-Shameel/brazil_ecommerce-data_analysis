USE brazil_ecommerce_db;

/* Products Table */
SELECT *
FROM products;


/* Number of unique products */
SELECT
COUNT(DISTINCT product_category_name) AS "Number of Unique Products"
FROM products;

