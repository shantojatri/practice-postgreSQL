--? Inner join example 
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

-- ? Retrieve all users along with their orders
SELECT users.name, orders.product, orders.amount
FROM users
INNER JOIN orders ON users.id = orders.user_id;