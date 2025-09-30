--? Example of addition operation in SQL
--? This query calculates the total salary by adding the base salary and the transportation allowance (tda)
--? from the employees table and returns the employee <name> along with the <total salary>
SELECT name, salary + tda AS total_salary FROM employees;

--? Example of subtraction operation in SQL
--? This query calculates the total salary by subtracting the transportation allowance (tda) from the base salary
--? from the employees table and returns the employee <name> along with the <total salary>
SELECT name, salary - tda AS total_salary FROM employees;

--? Example of multiplication operation in SQL 
--? This query calculates the total salary by multiplying the base salary with the transportation allowance (tda)
--? from the employees table and returns the employee <name> along with the <total salary>
SELECT name, salary * tda AS total_salary FROM employees;


--? Example of division operation in SQL
--? This query calculates the total salary by dividing the base salary by the transportation allowance (tda)
--? from the employees table and returns the employee <name> along with the <total salary>
SELECT name, salary / tda AS total_salary FROM employees;