-- Exercises XP (Week 4 - Day 3) : Items and customers
-- (run in a database called "public")

CREATE TABLE items (
    item_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INTEGER NOT NULL
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

INSERT INTO items (name, price) VALUES
('Small Desk', 100),
('Large desk', 300),
('Fan', 80);

INSERT INTO customers (first_name, last_name) VALUES
('Greg', 'Jones'),
('Sandra', 'Jones'),
('Scott', 'Scott'),
('Trevor', 'Green'),
('Melanie', 'Johnson');

-- All the items
SELECT * FROM items;

-- Items with a price above 80 (80 not included)
SELECT * FROM items WHERE price > 80;

-- Items with a price below 300 (300 included)
SELECT * FROM items WHERE price <= 300;

-- Customers whose last name is 'Smith'
-- Outcome: 0 rows, there is no Smith in the table
SELECT * FROM customers WHERE last_name = 'Smith';

-- Customers whose last name is 'Jones'
SELECT * FROM customers WHERE last_name = 'Jones';

-- Customers whose first name is not 'Scott'
SELECT * FROM customers WHERE first_name <> 'Scott';
