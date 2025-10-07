--? Join examples 
--> users and orders tables
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT,
    product VARCHAR(100),
    amount INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

--? Inserting sample data into the users table
INSERT INTO users (name, age) VALUES
('Alice', 30),
('Bob', 25),
('Charlie', 35);    

--? Inserting sample data into the orders table
INSERT INTO orders (user_id, product, amount) VALUES
(1, 'Laptop', 1200),
(2, 'Smartphone', 800),
(1, 'Tablet', 400),
(3, 'Monitor', 300);

--? Inner join example
-- ? Retrieve all users along with their orders
-- ? Only users with orders will be included
SELECT users.name, orders.product, orders.amount
FROM users
INNER JOIN orders ON users.id = orders.user_id;

--? Left join example
--? Retrieve all users and their orders, including users without orders
SELECT users.name, orders.product, orders.amount
FROM users
LEFT JOIN orders ON users.id = orders.user_id;

--? Right join example
--? Retrieve all orders and their associated users, including orders without users
SELECT users.name, orders.product, orders.amount
FROM users
RIGHT JOIN orders ON users.id = orders.user_id;

--? Full outer join example
--? Retrieve all users and all orders, matching where possible
SELECT users.name, orders.product, orders.amount
FROM users
FULL OUTER JOIN orders ON users.id = orders.user_id;