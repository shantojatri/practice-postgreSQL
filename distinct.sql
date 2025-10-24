--? Example of distinct
--? It will return distinct product categories from products table  
SELECT DISTINCT category FROM products;

--? It will return distinct combinations of product category and price range
SELECT DISTINCT category, 
       CASE 
           WHEN price < 500 THEN 'Low'
           WHEN price BETWEEN 500 AND 1000 THEN 'Medium'
           ELSE 'High'
       END AS price_range   
FROM products;

--? It will return distinct user districts from users table
SELECT DISTINCT district FROM users;

--? It will return distinct combinations of user age group and district
SELECT DISTINCT 
       CASE 
           WHEN age < 25 THEN 'Youth'
           WHEN age BETWEEN 25 AND 40 THEN 'Adult'
           ELSE 'Senior'
       END AS age_group,
       district 
FROM users;

--? It will return distinct product names from orders table
SELECT DISTINCT product FROM orders;

--? It will return distinct combinations of product and amount greater than 500
SELECT DISTINCT product, 
       CASE 
           WHEN amount > 500 THEN 'High Value'
           ELSE 'Regular'
       END AS amount_category       
FROM orders;

--? It will return distinct combinations of user name and age group
SELECT DISTINCT name, 
       CASE 
           WHEN age < 25 THEN 'Youth'
           WHEN age BETWEEN 25 AND 40 THEN 'Adult'
           ELSE 'Senior'
       END AS age_group 
FROM users;
