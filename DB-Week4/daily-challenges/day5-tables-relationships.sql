-- Daily Challenge: Tables Relationships (Week 4 - Day 5)

-- ================= Part I : One to One =================
CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- UNIQUE on customer_id makes it One to One (one profile per customer)
CREATE TABLE customer_profile (
    id SERIAL PRIMARY KEY,
    isLoggedIn BOOLEAN DEFAULT false,
    customer_id INTEGER UNIQUE REFERENCES customer(id) ON DELETE CASCADE
);

INSERT INTO customer (first_name, last_name) VALUES
('John', 'Doe'),
('Jerome', 'Lalu'),
('Lea', 'Rive');

-- Profiles inserted with subqueries (we look up the id by name)
INSERT INTO customer_profile (isLoggedIn, customer_id) VALUES
(true,  (SELECT id FROM customer WHERE first_name = 'John')),
(false, (SELECT id FROM customer WHERE first_name = 'Jerome'));

-- 1. first_name of the logged in customers (INNER JOIN: only those with a profile)
SELECT c.first_name
FROM customer c
JOIN customer_profile cp ON cp.customer_id = c.id
WHERE cp.isLoggedIn = true;

-- 2. All customers + isLoggedIn, even without a profile (LEFT JOIN)
SELECT c.first_name, cp.isLoggedIn
FROM customer c
LEFT JOIN customer_profile cp ON cp.customer_id = c.id;

-- 3. Number of customers NOT logged in
--    (Lea has no profile, so isLoggedIn is NULL: we count her too)
SELECT COUNT(*) AS not_logged_in
FROM customer c
LEFT JOIN customer_profile cp ON cp.customer_id = c.id
WHERE cp.isLoggedIn IS NOT TRUE;


-- ================= Part II : Many to Many =================
CREATE TABLE book (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL
);

INSERT INTO book (title, author) VALUES
('Alice In Wonderland', 'Lewis Carroll'),
('Harry Potter', 'J.K Rowling'),
('To kill a mockingbird', 'Harper Lee');

-- CHECK makes sure the age is never bigger than 15
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    age INTEGER CHECK (age <= 15)
);

INSERT INTO student (name, age) VALUES
('John', 12),
('Lera', 11),
('Patrick', 10),
('Bob', 14);

-- Junction table: the pair of foreign keys is the primary key
CREATE TABLE library (
    book_fk_id INTEGER REFERENCES book(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
    student_fk_id INTEGER REFERENCES student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
    borrowed_date DATE,
    PRIMARY KEY (book_fk_id, student_fk_id)
);

INSERT INTO library (book_fk_id, student_fk_id, borrowed_date) VALUES
((SELECT book_id FROM book WHERE title = 'Alice In Wonderland'),
 (SELECT student_id FROM student WHERE name = 'John'), '2022-02-15'),
((SELECT book_id FROM book WHERE title = 'To kill a mockingbird'),
 (SELECT student_id FROM student WHERE name = 'Bob'), '2021-03-03'),
((SELECT book_id FROM book WHERE title = 'Alice In Wonderland'),
 (SELECT student_id FROM student WHERE name = 'Lera'), '2021-05-23'),
((SELECT book_id FROM book WHERE title = 'Harry Potter'),
 (SELECT student_id FROM student WHERE name = 'Bob'), '2021-08-12');

-- All the columns of the junction table
SELECT * FROM library;

-- Name of the student + title of the borrowed book
SELECT s.name, b.title
FROM library l
JOIN student s ON s.student_id = l.student_fk_id
JOIN book b ON b.book_id = l.book_fk_id;

-- Average age of the children who borrowed Alice In Wonderland
SELECT AVG(s.age) AS average_age
FROM library l
JOIN student s ON s.student_id = l.student_fk_id
JOIN book b ON b.book_id = l.book_fk_id
WHERE b.title = 'Alice In Wonderland';

-- Delete a student: what happens in the junction table?
DELETE FROM student WHERE name = 'Bob';
SELECT * FROM library;
-- Answer: Bob's 2 rows disappeared from library too,
-- because of ON DELETE CASCADE on student_fk_id.
