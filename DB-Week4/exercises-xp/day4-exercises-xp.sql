-- Exercises XP (Week 4 - Day 4)

-- ========== Exercise 1 : Items and customers (database "public") ==========

-- All items, ordered by price (lowest to highest)
SELECT * FROM items ORDER BY price ASC;

-- Items with a price above 80 (80 included), highest to lowest
SELECT * FROM items WHERE price >= 80 ORDER BY price DESC;

-- First 3 customers, alphabetical order of first name, without the primary key
SELECT first_name, last_name FROM customers ORDER BY first_name ASC LIMIT 3;

-- All last names only, reverse alphabetical order
SELECT last_name FROM customers ORDER BY last_name DESC;


-- ========== Exercise 2 : dvdrental database ==========

-- All the columns of the customer table
SELECT * FROM customer;

-- Names with an alias full_name
SELECT first_name || ' ' || last_name AS full_name FROM customer;

-- All the dates accounts were created, no duplicates
SELECT DISTINCT create_date FROM customer;

-- All customer details, descending order by first name
SELECT * FROM customer ORDER BY first_name DESC;

-- Film id, title, description, year, rental rate, ascending rental rate
SELECT film_id, title, description, release_year, rental_rate
FROM film
ORDER BY rental_rate ASC;

-- Address and phone of customers living in the Texas district
SELECT a.address, a.phone
FROM customer c
JOIN address a ON a.address_id = c.address_id
WHERE a.district = 'Texas';

-- Movies with id 15 or 150
SELECT * FROM film WHERE film_id IN (15, 150);

-- Does my favorite movie exist?
SELECT film_id, title, description, length, rental_rate
FROM film
WHERE title = 'Gladiator Westward';

-- Movies starting with the 2 first letters of my favorite movie
SELECT film_id, title, description, length, rental_rate
FROM film
WHERE title ILIKE 'Gl%';

-- The 10 cheapest movies
SELECT film_id, title, rental_rate
FROM film
ORDER BY rental_rate ASC, film_id ASC
LIMIT 10;

-- The next 10 cheapest movies
SELECT film_id, title, rental_rate
FROM film
ORDER BY rental_rate ASC, film_id ASC
OFFSET 10 LIMIT 10;

-- Bonus: same without LIMIT (window function)
SELECT film_id, title, rental_rate
FROM (
    SELECT film_id, title, rental_rate,
           ROW_NUMBER() OVER (ORDER BY rental_rate ASC, film_id ASC) AS position
    FROM film
) AS ranked
WHERE position BETWEEN 11 AND 20;

-- Customers joined with their payments, ordered by customer id
SELECT c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date
FROM customer c
JOIN payment p ON p.customer_id = c.customer_id
ORDER BY c.customer_id;

-- Movies which are not in inventory
SELECT f.film_id, f.title
FROM film f
LEFT JOIN inventory i ON i.film_id = f.film_id
WHERE i.inventory_id IS NULL;

-- Which city is in which country
SELECT ci.city, co.country
FROM city ci
JOIN country co ON co.country_id = ci.country_id
ORDER BY co.country, ci.city;

-- Bonus: sales ordered by the staff member who sold the dvd
SELECT p.staff_id, c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date
FROM payment p
JOIN customer c ON c.customer_id = p.customer_id
ORDER BY p.staff_id, c.customer_id;
