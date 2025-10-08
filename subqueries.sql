--? Create a products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    weight INT NOT NULL
);

--? Insert data into products table
INSERT into products (name, price, weight)
VALUES 
    ('iPhone 12', 999, 164),
    ('Samsung Galaxy S21', 799, 171),
    ('Google Pixel 5', 699, 151),
    ('OnePlus 9', 729, 192),
    ('Sony X-peria 5', 899, 163),    
    ('LG Velvet', 599, 180),
    ('Motorola Edge', 699, 188),
    ('Nokia 8.3', 649, 220),
    ('Huawei P40', 799, 175),
    ('Xiaomi Mi 11', 749, 196)
;

--? Create a sales table
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    product_id INT,     
    quantity INT NOT NULL,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

--? Insert data into sales table
INSERT into sales (product_id, quantity)
VALUES      
    (1, 5),     
    (2, 3),     
    (3, 4),     
    (4, 2),     
    (5, 1),     
    (6, 6),     
    (7, 2),     
    (8, 3),
    (9, 4),
    (10, 5)
;

--? Example of subquery
--? It will return products with price greater than average price of all products
SELECT name, price FROM products
WHERE price > (SELECT AVG(price) FROM products)
;

--? Example of correlated subquery 
--? It will return products with price greater than price of product with id = 3
SELECT name, price, (SELECT price FROM products WHERE id = 3) AS id_3_price
FROM products
where price > 599
;

--? Example of subquery in FROM clause
--? It will return products with price to weight ratio greater than 3
--? Here, the subquery calculates price to weight ratio for each product
--? The outer query filters products based on this ratio
SELECT name, price_weight_ratio 
FROM (SELECT name, price / weight AS price_weight_ratio FROM products) AS p
where price_weight_ratio > 3
;


--? Example of subquery with GROUP BY
--? It will return average number of orders per user
--? Here, the subquery groups orders by user_id and counts number of orders per user
--? The outer query calculates average number of orders from this grouped data
--? Assuming there is a user_id column in orders table
--? If user_id column does not exist, this query will throw an error
SELECT AVG(order_count) FROM (SELECT user_id, COUNT(*) AS order_count FROM orders GROUP BY user_id) AS p;