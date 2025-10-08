--? Create a products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price INT,
    stock INT
);

--? Insert data into the products table
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


--? Default sorting by name or ASC
SELECT * FROM products ORDER BY name;

--? Sorting by DESC by name 
SELECT * FROM products ORDER BY name DESC;

--? Sorting by DESC by name and price
SELECT * FROM products ORDER BY name, price DESC;

--? Example of offset
--? Return data by skipping first 2 items
SELECT * FROM products OFFSET 2;

--? Example of limit
--? It will take first 5 records
SELECT * FROM products ORDER BY price LIMIT 5;

--? Example of limit & Offset
--? It will take first 5 records by skipping first 2 items
--? We need to declare LIMIT before OFFSET by convention
SELECT * FROM products ORDER BY price LIMIT 5 OFFSET 2;