-- Drop table if exists
DROP TABLE employees;

-- Creating Employees Table

CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	department TEXT,
	salary INT
);

-- Retrieving Data from the table Employees
SELECT * FROM employees;

-- Adding values to the table Employees
INSERT INTO employees (employee_id, first_name, last_name, department, salary)
VALUES
(1, 'John', 'Mac', 'Sales', 50000),
(2, 'Mike', 'Ross', 'Sales', 60000),
(3, 'John', 'Paul', 'Purchasing', 75000),
(4, 'John', 'Sean', 'Sales', 75000),
(5, 'John', 'Risse', 'Purchasing', 65000),
(6, 'John', 'Ross', 'Admin', 75000),
(7, 'Mike', 'Paul', 'Admin', 85000);

-- Retrieving Sales Department Employee Information
SELECT first_name, last_name, salary 
FROM employees
WHERE department = 'Sales';

-- Finding Total # of Employees in Each Department
SELECT department, COUNT(*) as num_employees
FROM employees
GROUP BY department;

-- Finding Average Salary in Each Department
SELECT AVG(salary) AS avg_salary, department
FROM employees
GROUP BY department;

-- Finding Highest Salary amount
SELECT MAX(salary) AS highest_salary
FROM employees;

-- Retrieving Employees with Salary greater then 70000
SELECT first_name, last_name
FROM employees
WHERE SALARY > 70000;

-- List of employees with the same first name
SELECT first_name, COUNT(*) AS name_count
FROM employees
GROUP BY first_name
HAVING COUNT(*) > 1;

-- Finding Employee with lowest salary in each department
SELECT department, first_name, last_name, salary
FROM employees e1
WHERE salary = (SELECT MIN(salary) FROM employees e2 WHERE e1.department = e2.department);