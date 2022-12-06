/*
SQL queries on PostgreSQL - Topic: DVD rentals

Queries such as: JOINS, GROUP BY and timestamps.

Tables: actor, address, category, city, country, customer, film, film_actor, film_category, city,
country, customer, film, film_actor, film_category, inventory, language, payment, rental, staff, store

I will be stating situations as a dvd rental company, from looking up customers, inventory, costs, etc. 
*/


-- Emails of the customer who live in California

SELECT email, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district ILIKE 'california'
ORDER BY 1

-- A list of all the movies 'Nick Wahlberg' has been in

SELECT film.title, actor.first_name, actor.last_name
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name ILIKE 'nick'
AND actor.last_name ILIKE 'wahlberg'
ORDER BY 1

-- Amount of movies that each customer have rented out?

SELECT rental.customer_id, customer.first_name, customer.last_name, count(rental.customer_id)
FROM rental
JOIN customer
ON rental.customer_id = customer.customer_id
GROUP BY rental.customer_id, customer.first_name, customer.last_name
ORDER BY 2


-- Who are the customers from USA?

SELECT customer.customer_id, customer.first_name, customer.last_name, city.city, address.district
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country.country ILIKE 'united states'
ORDER BY 1

-- From how many districts are our customers from?

SELECT address.district, COUNT(district)
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id
GROUP BY district
ORDER BY 1

-- Show how many cities are per country?

SELECT country.country, count(city.country_id)
FROM city
INNER JOIN country
ON city.country_id = country.country_id
GROUP BY country.country, city.country_id

-- The top 10 countries where our customers are from
SELECT country.country, count(city.country_id)
FROM city
INNER JOIN country
ON city.country_id = country.country_id
GROUP BY country.country, city.country_id
ORDER BY 2 DESC
LIMIT 10

-- Payment date organized on European standard

SELECT TO_CHAR(payment_date, 'DD-MM-YYYY')
FROM payment

-- During which months did payments occur? (With the full written month)

SELECT DISTINCT(TO_CHAR(payment_date, 'Month'))
FROM payment

-- How many payments occured on a Monday?

SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1
