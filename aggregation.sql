--? Create a sample table for demonstration
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    district VARCHAR(100)
);

--? Inserting sample data into the users table
INSERT INTO users (name, age, district) VALUES
('Alice', 30, 'District A'),
('Bob', 25, 'District B'),
('Charlie', 35, 'District A'),
('David', 40, 'District C'),
('Eve', 28, 'District B'),
('Frank', 33, 'District C'),
('Grace', 29, 'District A'),
('Heidi', 31, 'District B'),
('Ivan', 27, 'District C'),
('Judy', 26, 'District A');


--- ? Aggregate functions in PostgreSQL
-- ? Get total number of users
SELECT COUNT(*) FROM users;

-- ? Get total number of unique districts
SELECT COUNT(DISTINCT district) FROM users;

-- ? Get maximum age of users
SELECT MAX(age) FROM users;

-- ? Get minimum age of users
SELECT MIN(age) FROM users;

-- ? Get average age of users
SELECT AVG(age) FROM users;

-- ? Get sum of ages of users
SELECT SUM(age) FROM users;

-- ? Get average age of users from each district, group by district
SELECT district, ROUND(AVG(age)) FROM users GROUP BY district;