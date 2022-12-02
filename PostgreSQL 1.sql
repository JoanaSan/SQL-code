/*

SQL queries on PostgreSQL - Topic: DVD rentals

Basic queries such as: select, where, order by, limit, group by, date, having

Tables: actor, address, category, city, country, customer, film, film_actor, film_category, city,
country, customer, film, film_actor, film_category, inventory, language, payment, rental, staff, store

I will be stating situations as a dvd rental company, from looking up customers, inventory, costs, etc. 
*/

-- Send a promotional email to our current customers

SELECT first_name, last_name, email
FROM customer
ORDER BY 2,1

-- What type of ratings do we currently have on our movies?

SELECT DISTINCT rating
FROM film
ORDER BY rating

-- Send a mail to a customer called Nancy Thomas that forgot their wallet at the store

SELECT email
FROM customer
WHERE first_name = 'Nancy'
AND last_name = 'Thomas'

--What's the movie "Outlaw Hanky" about?

SELECT title, description FROM film
WHERE title ILIKE '%hanky%'

-- Follow up customer that are late on their movie return and lives at "259 Ipoh Drive"

SELECT phone
FROM address
WHERE address ILIKE '%ipoh drive%'

-- Reward our first 10 paying customers

SELECT customer_id 
FROM payment
ORDER BY payment_date ASC
LIMIT 10

-- What are our 5 shortest (in leght) movies?

SELECT * 
FROM film
WHERE length <= 50
ORDER BY length

-- How many payment transactions were greater than $ 5.00?

SELECT * FROM payment
WHERE amount >= 5
ORDER BY amount


-- How many unqie districts are our customers from?

SELECT count(DISTINCT(district))
FROM address

-- Which districts are our customers from?

SELECT DISTINCT (district)
FROM address
ORDER district

-- How many films have a rating of R and a replacement cost between $ 5 and $ 15?

SELECT count(*) FROM film
WHERE RATING = 'R'
AND replacement_cost BETWEEN 5 AND 15

-- Films with the word TRUMAN in the title

SELECT * FROM film
WHERE title ILIKE '%TRUMAN%'

-- What customer id is spending the most money?

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC

-- How many transactions do the clients have in total?

SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC

-- How much have the customers spent in total with each staff?

SELECT customer_id, staff_id, SUM (amount)
FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id, sum(amount)

-- How much payments have we received each day?

SELECT DATE(payment_date), SUM(amount)
FROM payment
GROUP BY DATE(payment_date)
ORDER BY DATE(payment_date)

-- Which staff member handled the most payments regarding sells and not dollar amount?

SELECT staff_id, COUNT(amount)
FROM payment
GROUP BY staff_id
ORDER BY count(amount) DESC

-- Average replacement cost per rating

SELECT ROUND(AVG(replacement_cost), 2), rating
FROM film
GROUP BY rating

-- Reward 5 top customers with coupons

SELECT customer_id, SUM(amount) 
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount)DESC
LIMIT 5

-- 40 top customers that have 40 or more transaction payment

SELECT customer_id, COUNT(amount) 
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40

-- Customer IDs who have spent at least $110 with the staff member with ID 2

SELECT customer_id, staff_id, SUM(amount)
FROM payment
GROUP BY customer_id, staff_id
HAVING NOT staff_id = 1
AND SUM(amount) >= 110
ORDER BY SUM(amount)

-- How many films begin with the letter J?

SELECT COUNT(title) FROM film
WHERE title ILIKE 'j%'

-- What customer has the highest customerID number whose name starts with an 'E' and has an address ID lower than 500?

SELECT customer_id, first_name, last_name, address_id
FROM customer
WHERE first_name ILIKE 'e%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1
