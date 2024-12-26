USE sakila;
SELECT 
    MAX(length) AS max_duration, MIN(length) AS min_duration
FROM
    film;
SELECT ROUND(AVG(length),0) AS avg_duration
FROM film;

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days
FROM rental;

SELECT *,
MONTH(rental_date) AS rental_month,
WEEKDAY(rental_date) AS rental_day
FROM rental
LIMIT 20;

SELECT *,
MONTH(rental_date) AS rental_month,
WEEKDAY(rental_date) AS rental_day,
CASE 
	WHEN WEEKDAY(rental_date) < 5 THEN 'workday'
	ELSE 'weekend'
END AS day_type
FROM rental;


SELECT title, rental_duration + IFNUll(rental_duration,'Not Available') AS film_available
FROM film
ORDER BY title ASC;

SELECT concat(first_name,last_name, LEFT(email,3)) AS personalized

FROM customer
ORDER BY last_name ASC;
-- Challenge 2 --
SELECT COUNT(DISTINCT title) AS total_film
FROM film;

SELECT rental_rate, COUNT(DISTINCT title) AS number_film FROM film 
GROUP BY(rental_rate);

SELECT rental_rate, COUNT(DISTINCT title) AS number_film FROM film 
GROUP BY(rental_rate)
ORDER BY number_film DESC;
SELECT rental_rate, COUNT(DISTINCT title) AS number_film, ROUND(AVG(length), 2) AS mean_duration FROM film 
GROUP BY(rental_rate)
ORDER BY mean_duration DESC;
SELECT 
    rental_rate,
    COUNT(DISTINCT title) AS number_film,
    ROUND(AVG(length), 2) AS mean_duration
FROM
    film
GROUP BY (rental_rate)
HAVING mean_duration > 120
ORDER BY mean_duration DESC;

SELECT DISTINCT(last_name) FROM actor;
