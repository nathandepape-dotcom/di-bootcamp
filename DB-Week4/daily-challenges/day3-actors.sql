-- Daily Challenge: Actors (Week 4 - Day 3)
-- Table from the lesson (if needed):
-- CREATE TABLE actors (
--     actor_id SERIAL PRIMARY KEY,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(100) NOT NULL,
--     age DATE NOT NULL,
--     number_oscars SMALLINT NOT NULL
-- );

-- 1. Count how many actors are in the table
SELECT COUNT(*) AS number_of_actors FROM actors;

-- 2. Add a new actor with some blank fields
-- Prediction: the insert fails, because the columns are NOT NULL.
INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES ('Tom', NULL, NULL, NULL);
-- Result: ERROR: null value in column "last_name" of relation "actors"
--         violates not-null constraint
-- Note: an empty string '' is NOT NULL, so VALUES ('Tom', '', ...) would pass
--       for a VARCHAR column, but not for DATE / SMALLINT columns.
