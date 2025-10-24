--? Create products and orders tables for demonstration
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price INT,
    stock INT,
    category VARCHAR(100)
);
--? Inserting sample data into products table
INSERT INTO products (name, price, stock, category) VALUES
    ('iPhone 12', 999, 50, 'Electronics'),
    ('Samsung Galaxy S21', 899, 70, 'Electronics'),
    ('Dell XPS 13', 1199, 30, 'Computers'),
    ('MacBook Pro', 1299, 20, 'Computers'),
    ('Sony WH-1000XM4', 349, 100, 'Accessories'),
    ('Bose QuietComfort 35 II', 299, 80, 'Accessories'),
    ('Google Pixel 5', 699, 60, 'Electronics')
;
--? Create orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    product_id INT,
    user_id INT,
    amount INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id)
);
--? Inserting sample data into orders table
INSERT INTO orders (product_id, user_id, amount) VALUES
    (1, 1, 999),
    (2, 2, 899),
    (3, 3, 1199),
    (4, 1, 1299),
    (5, 4, 349),
    (6, 5, 299),
    (7, 2, 699) 
;


--? Example of subqueries with SELECT statements
--? It will return products with price greater than average price of all products   
SELECT name, price FROM products
WHERE price > (SELECT AVG(price) FROM products);

--? It will return users who have placed orders with amount greater than 500
SELECT name FROM users
WHERE id IN (SELECT user_id FROM orders WHERE amount > 500);

--? It will return products that have never been ordered
SELECT name FROM products
WHERE id NOT IN (SELECT DISTINCT product_id FROM orders);

--? It will return users along with their total order amount
SELECT users.name, 
       (SELECT SUM(amount) FROM orders WHERE orders.user_id = users.id) AS total_amount 
FROM users;


--? It will return products along with the number of times they have been ordered
SELECT products.name, 
       (SELECT COUNT(*) FROM orders WHERE orders.product_id = products.id) AS order_count   
FROM products;

--? It will return users who have placed more than 2 orders
SELECT name FROM users
WHERE (SELECT COUNT(*) FROM orders WHERE orders.user_id = users.id) > 2;

--? It will return products with price greater than average price of products in 'Electronics' category
SELECT name, price FROM products
WHERE price > (SELECT AVG(price) FROM products WHERE category = 'Electronics');

--? It will return products along with the total number of products in the table using subqueries in JOIN
SELECT p1.name, 
(SELECT COUNT(name) FROM products)
FROM (SELECT * FROM products) AS p1
JOIN (SELECT * FROM products) AS p2 ON p1.id = p2.id
WHERE p1.id IN (SELECT id FROM products);

--? It will return products along with the highest price in the products table
SELECT name, price, 
(SELECT max(price) as highest_price FROM products) 
FROM products WHERE price > 899;

--? It will return products where the price to stock ratio is greater than 3 using subquery in FROM clause
SELECT name, price_stock_ratio
FROM (SELECT name, price / stock 
  AS price_stock_ratio FROM products) 
  as p
WHERE price_stock_ratio > 3;

--? It will return products with price greater than all of the prices in 'Industrial' department
SELECT name, department, price
FROM products
WHERE price > ALL (
  SELECT price FROM products
  WHERE department = 'Industrial'
);

--? It will return products with price greater than some of the prices in 'Industrial' department
SELECT name, department, price
FROM products
WHERE price > SOME (
  SELECT price FROM products
  WHERE department = 'Industrial'
);
