USE brazil_ecommerce_db;

SELECT *
FROM sellers;

SELECT
    COUNT(seller_city) AS num_of_city,
    seller_city
FROM sellers
GROUP BY seller_city
ORDER BY num_of_city DESC;
