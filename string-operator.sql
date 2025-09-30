--? Calculate the length of a string
SELECT LENGTH('Hello World') AS string_length;

--? Convert a string to upper case
SELECT UPPER('PostgreSQL') AS upper_case_string;

--? Convert a string to lower case
SELECT LOWER('PostgreSQL') AS upper_case_string;

--? Capitalize the first letter of each word in a string
SELECT INITCAP('hello world'); AS capitalize_string;

--? Concatenate two strings with a space in between using the CONCAT function
SELECT CONCAT('Hello', ' ', 'World'); AS concatenated_string;
--? Concatenate two strings using the || operator
SELECT 'Hello' || ' ' || 'World' AS greeting;

--? trim leading and trailing spaces from a string
SELECT TRIM('  PostgreSQL  '); AS trimmed_string;


--? Get the number of characters in a string
SELECT CHAR_LENGTH('PostgreSQL') AS char_length;

--? Find the position of a substring within a string
SELECT POSITION('gres' IN 'PostgreSQL') AS position_in_string;