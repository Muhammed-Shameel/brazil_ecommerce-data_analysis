USE brazil_ecommerce_db;

SELECT *
FROM geolocation;


SELECT
    COUNT(geolocation_city) AS geolocation_record,
    geolocation_city
FROM geolocation
GROUP BY geolocation_city
ORDER BY geolocation_record DESC;

SELECT
    COUNT(geolocation_state) AS geolocation_record,
    geolocation_state
FROM geolocation
GROUP BY geolocation_state
ORDER BY geolocation_record DESC;