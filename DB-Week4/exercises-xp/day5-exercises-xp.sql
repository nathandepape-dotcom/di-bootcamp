-- Exercises XP (Week 4 - Day 5) : dvdrental database

-- ================= Exercise 1 =================

-- All the languages
SELECT * FROM language;

-- All films with their language
SELECT f.title, f.description, l.name AS language
FROM film f
JOIN language l ON l.language_id = f.language_id;

-- All languages, even with no films (RIGHT JOIN keeps every language)
SELECT f.title, f.description, l.name AS language
FROM film f
RIGHT JOIN language l ON l.language_id = f.language_id;

-- New table new_film
CREATE TABLE new_film (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO new_film (name) VALUES
('Inception'),
('Interstellar'),
('The Matrix');

-- customer_review: deleting a film deletes its reviews (ON DELETE CASCADE)
CREATE TABLE customer_review (
    review_id SERIAL PRIMARY KEY NOT NULL,
    film_id INTEGER NOT NULL REFERENCES new_film(id) ON DELETE CASCADE,
    language_id INTEGER NOT NULL REFERENCES language(language_id),
    title VARCHAR(255) NOT NULL,
    score INTEGER CHECK (score BETWEEN 1 AND 10),
    review_text TEXT,
    last_update TIMESTAMP DEFAULT NOW()
);

INSERT INTO customer_review (film_id, language_id, title, score, review_text) VALUES
((SELECT id FROM new_film WHERE name = 'Inception'),
 (SELECT language_id FROM language WHERE name = 'English'),
 'Mind blowing', 9, 'A dream inside a dream, I loved every minute.'),
((SELECT id FROM new_film WHERE name = 'The Matrix'),
 (SELECT language_id FROM language WHERE name = 'French'),
 'Un classique', 8, 'Toujours aussi bon, meme 25 ans apres.');

-- Delete a film that has a review
DELETE FROM new_film WHERE name = 'Inception';
SELECT * FROM customer_review;
-- Answer: its review was deleted automatically (ON DELETE CASCADE).


-- ================= Exercise 2 =================

-- Change the language of some films (valid languages only)
UPDATE film
SET language_id = (SELECT language_id FROM language WHERE name = 'Italian')
WHERE film_id IN (1, 2, 3);

-- Foreign keys of the customer table:
--   customer.address_id -> address.address_id
--   (and store_id, which refers to the store)
-- Effect on INSERT: the address (and store) must exist BEFORE we insert
-- the customer, otherwise the insert fails with a foreign key error.

-- Drop customer_review
DROP TABLE customer_review;
-- It is an easy step: no other table references customer_review,
-- so nothing depends on it. (Dropping a table that is referenced, like
-- new_film or language, would need extra checking or CASCADE.)

-- How many rentals are still outstanding (not returned yet)
SELECT COUNT(*) AS outstanding_rentals
FROM rental
WHERE return_date IS NULL;

-- The 30 most expensive outstanding movies
SELECT f.film_id, f.title, f.replacement_cost
FROM rental r
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
WHERE r.return_date IS NULL
ORDER BY f.replacement_cost DESC
LIMIT 30;

-- Help the friend find his 4 movies

-- 1st: about a sumo wrestler, with the actor Penelope Monroe
SELECT f.film_id, f.title, f.description
FROM film f
JOIN film_actor fa ON fa.film_id = f.film_id
JOIN actor a ON a.actor_id = fa.actor_id
WHERE a.first_name ILIKE 'Penelope' AND a.last_name ILIKE 'Monroe'
  AND f.description ILIKE '%sumo%';

-- 2nd: short documentary (< 60 min), rated R
SELECT f.film_id, f.title, f.length, f.rating
FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id
WHERE c.name = 'Documentary' AND f.length < 60 AND f.rating = 'R';

-- 3rd: rented by Matthew Mahan, paid over $4.00,
--      returned between 28 July and 1 August 2005
SELECT DISTINCT f.film_id, f.title
FROM customer cu
JOIN rental r ON r.customer_id = cu.customer_id
JOIN payment p ON p.rental_id = r.rental_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
WHERE cu.first_name ILIKE 'Matthew' AND cu.last_name ILIKE 'Mahan'
  AND p.amount > 4.00
  AND r.return_date BETWEEN '2005-07-28' AND '2005-08-01 23:59:59';

-- 4th: also watched by Matthew Mahan, "boat" in the title or description,
--      very expensive to replace
SELECT DISTINCT f.film_id, f.title, f.replacement_cost
FROM customer cu
JOIN rental r ON r.customer_id = cu.customer_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
WHERE cu.first_name ILIKE 'Matthew' AND cu.last_name ILIKE 'Mahan'
  AND (f.title ILIKE '%boat%' OR f.description ILIKE '%boat%')
ORDER BY f.replacement_cost DESC
LIMIT 1;  -- the most expensive one is the answer
