


-- Inner Join --> Inner Join is used to combine the rows  from two tables with a matching conditon .

-- it return the only that record that matched the conditions 



SELECT * FROM employee e 
INNER JOIN department d  
ON e.departmnet_id = d.department_id ;

-- retrieves only the matching record 
-- Eliminate unmatched row
-- most commonly used in join 

-- Example 1: Average Salary Per Department



SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

--  Example 2: Employee Count Per Department

SELECT
    d.department_name,
    COUNT(*) AS total_employees
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;







-- Departments Having More Than 1 Employee


SELECT
    d.department_name,
    COUNT(*) AS total_employees
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(*) > 1;