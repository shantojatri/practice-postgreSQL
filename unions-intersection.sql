--? Example of UNION and UNION ALL
--? Create products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price INT,
    stock INT
);

--? Insert data into products table
INSERT into products (name, price, stock)
VALUES 
    ('Apple 12 pro', 1200, 50),
    ('Iphone 13 pro', 1400, 150),
    ('Iphone 13 pro', 800, 11),     
    ('Iphone 14 pro', 1000, 50),
    ('Iphone 15 pro', 1500, 50),
    ('Mack book pro', 2500, 25),
    ('Samsung S23', 1200, 50),
    ('Nokia N8', 1200, 100)
;

--? Create orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    product_id INT,
    quantity INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

--? Insert data into orders table
INSERT into orders (product_id, quantity)
VALUES 
    (1, 2),    
    (2, 1),     
    (3, 5),     
    (4, 1),     
    (5, 1),     
    (6, 1),     
    (7, 3),     
    (8, 4)
;

--? Example of UNION
--? It will return distinct records from both tables
--? Complex queries need to wrap each SELECT statement in parentheses
--? Here, both SELECT statements have same number of columns and compatible data types
(SELECT name, price FROM products)
UNION
(SELECT 'Total Orders' AS name, SUM(quantity) AS price FROM orders)
;   

--? Example of UNION with same column names but different data
--? It will return distinct records from both selects
--? Here, price and stock are of same data type INT
--? So, we can use UNION, but need to ensure same number of columns and compatible data types
--? If data types are different, we may need to use CAST to convert them to a common type
--? If data types are not compatible with selecting columns, it will throw an error
SELECT name, price FROM products
UNION
SELECT name, stock FROM products;


--? Example of UNION ALL
--? It will return all records from both tables including duplicates
--? Complex queries need to wrap each SELECT statement in parentheses
(SELECT name, price FROM products)
UNION ALL
(SELECT 'Total Orders' AS name, SUM(quantity) AS price FROM orders)
;

--? Example of INTERSECT
--? It will return common records from both tables
--? Complex queries need to wrap each SELECT statement in parentheses
(SELECT name, price FROM products)
INTERSECT
(SELECT 'Total Orders' AS name, SUM(quantity) AS price FROM orders)
;

--? Example of INTERSECT ALL
--? It will return all common records from both tables including duplicates
--? Complex queries need to wrap each SELECT statement in parentheses
(SELECT name, price FROM products)
INTERSECT ALL
(SELECT 'Total Orders' AS name, SUM(quantity) AS price FROM orders)
;

--? Example of EXCEPT
--? It will return records from first table that are not in second table
--? Complex queries need to wrap each SELECT statement in parentheses
(SELECT name, price FROM products)   
EXCEPT
(SELECT 'Total Orders' AS name, SUM(quantity) AS price FROM orders)
;

--? Example of EXCEPT ALL
--? It will return all records from first table that are not in second table including duplicates
--? Complex queries need to wrap each SELECT statement in parentheses
(SELECT name, price FROM products)   
EXCEPT ALL
(SELECT 'Total Orders' AS name, SUM(quantity) AS price FROM orders)
;

--? Clean up
DROP TABLE orders;
DROP TABLE products;