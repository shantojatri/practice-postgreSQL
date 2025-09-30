--? Creating a sample table for cities
CREATE Table cities (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(100),
    population INT,
    area INT,  
);

--? Inserting sample data into the cities table
INSERT INTO cities (id, name, country, population, area) 
VALUES
('New York', 'USA', 8419600, 783),
('Los Angeles', 'USA', 3980400, 1302),
('Toronto', 'Canada', 2731571, 630),
('Vancouver', 'Canada', 631486, 115),
('Mexico City', 'Mexico', 8918653, 1485),
('Guadalajara', 'Mexico', 1495182, 151),
('London', 'UK', 8982000, 1572),
('Manchester', 'UK', 553230, 115),
('Sydney', 'Australia', 5312163, 12367),
('Melbourne', 'Australia', 5078193, 9992)
;

-- ? Find all cities with an area greater than 5000 square kilometers.
SELECT name, area FROM cities WHERE area > 5000;

-- ? Find all cities with an area equal to 6000 square kilometers.
SELECT name, area FROM cities WHERE area = 6000;

-- ? Find all cities with a population less than 1 million.
SELECT name, population FROM cities WHERE population < 1000000;

-- ? Find all cities with a population between 500,000 and 2 million.
SELECT name, population FROM cities WHERE population BETWEEN 500000 AND 2000000;

-- ? Find all cities that are not equal to the country 'USA'.
SELECT name, country FROM cities WHERE country <> 'USA';

-- ? Find all cities with names starting with the letter 'A'.
SELECT name FROM cities WHERE name LIKE 'A%';

-- ? Find all cities with names ending with the letter 'o'.
SELECT name FROM cities WHERE name LIKE '%o';

-- ? Find all cities with names containing the substring 'land'.
SELECT name FROM cities WHERE name LIKE '%land%';

-- ? Find all cities that are in either 'Canada' or 'Mexico'.
SELECT name, country FROM cities WHERE country IN ('Canada', 'Mexico');

-- ? Find all cities that are not in 'Canada' or 'Mexico'.
SELECT name, country FROM cities WHERE country NOT IN ('Canada', 'Mexico');

-- ? Find all cities with a population greater than 1 million and an area less than 3000 square kilometers.
SELECT name, population, area FROM cities WHERE population > 1000000 AND area < 3000;

--? IS NULL example
-- ? Find all cities where the population data is missing (NULL).   
SELECT name, population FROM cities WHERE population IS NULL;

--? IS NOT NULL example
-- ? Find all cities where the area data is available (NOT NULL).
SELECT name, area FROM cities WHERE area IS NOT NULL;

--? EXISTS example
-- ? Find all cities that are in countries with a population greater than 50 million.
SELECT name, country FROM cities WHERE EXISTS (SELECT name, country FROM countries WHERE countries.name = cities.country AND countries.population > 50000000); 

