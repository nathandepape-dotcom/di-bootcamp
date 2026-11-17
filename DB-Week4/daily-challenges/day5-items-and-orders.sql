-- Daily Challenge: Items and Orders (Week 4 - Day 5)

-- Bonus table first, because product_orders references it
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE
);

-- One user -> many orders
CREATE TABLE product_orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE DEFAULT CURRENT_DATE,
    user_id INTEGER REFERENCES users(user_id) ON DELETE CASCADE
);

-- One order -> many items (an item belongs to only one order)
CREATE TABLE items (
    item_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    order_id INTEGER NOT NULL REFERENCES product_orders(order_id) ON DELETE CASCADE
);

INSERT INTO users (username) VALUES ('nathan'), ('dana');

INSERT INTO product_orders (user_id) VALUES (1), (1), (2);

INSERT INTO items (name, price, order_id) VALUES
('Keyboard', 49.90, 1),
('Mouse', 19.90, 1),
('Screen', 199.00, 2),
('Headphones', 79.50, 3);

-- Function: total price of a given order
CREATE OR REPLACE FUNCTION order_total(p_order_id INTEGER)
RETURNS NUMERIC
LANGUAGE SQL
AS $$
    SELECT COALESCE(SUM(price), 0) FROM items WHERE order_id = p_order_id
$$;

SELECT order_total(1);  -- 69.80

-- Bonus function: total price of a given order of a given user
-- (returns 0 if that order does not belong to that user)
CREATE OR REPLACE FUNCTION user_order_total(p_user_id INTEGER, p_order_id INTEGER)
RETURNS NUMERIC
LANGUAGE SQL
AS $$
    SELECT COALESCE(SUM(i.price), 0)
    FROM items i
    JOIN product_orders o ON o.order_id = i.order_id
    WHERE o.user_id = p_user_id AND o.order_id = p_order_id
$$;

SELECT user_order_total(1, 2);  -- 199.00
SELECT user_order_total(2, 1);  -- 0 (order 1 is not Dana's)
