-- Daily Challenge: SQL Puzzle (Week 4 - Day 4)

CREATE TABLE FirstTab (
    id integer,
    name VARCHAR(10)
);

INSERT INTO FirstTab VALUES
(5,'Pawan'),
(6,'Sharlee'),
(7,'Krish'),
(NULL,'Avtaar');

SELECT * FROM FirstTab;

CREATE TABLE SecondTab (
    id integer
);

INSERT INTO SecondTab VALUES
(5),
(NULL);

SELECT * FROM SecondTab;

-- Rule: x NOT IN (a, b) means x <> a AND x <> b.
-- Any comparison with NULL is UNKNOWN, and WHERE only keeps TRUE rows.

-- Q1 -> 0
-- Subquery returns (NULL). Every "id <> NULL" is UNKNOWN, so no row is kept.
SELECT COUNT(*)
FROM FirstTab AS ft WHERE ft.id NOT IN ( SELECT id FROM SecondTab WHERE id IS NULL );

-- Q2 -> 2
-- Subquery returns (5). 6 and 7 are kept. 5 is excluded.
-- The NULL row (Avtaar) is UNKNOWN, so it is not counted.
SELECT COUNT(*)
FROM FirstTab AS ft WHERE ft.id NOT IN ( SELECT id FROM SecondTab WHERE id = 5 );

-- Q3 -> 0
-- Subquery returns (5, NULL). The NULL in the list makes every test UNKNOWN.
SELECT COUNT(*)
FROM FirstTab AS ft WHERE ft.id NOT IN ( SELECT id FROM SecondTab );

-- Q4 -> 2
-- Subquery returns (5) again, same as Q2: Sharlee and Krish.
SELECT COUNT(*)
FROM FirstTab AS ft WHERE ft.id NOT IN ( SELECT id FROM SecondTab WHERE id IS NOT NULL );

-- Lesson: never use NOT IN on a column that can contain NULL
-- (use NOT EXISTS, or filter with IS NOT NULL like in Q4).
