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
    ('Sony Xperia 5', 899, 163),    
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