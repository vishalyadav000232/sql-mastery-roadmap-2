


--- SUM() is an Aggregate Function that calculates the total of all numeric values in a column.

-- SELECT SUM(column_name)
-- FROM table_name;


SELECT SUM(salary)
FROM employee;



SELECT SUM(salary)
FROM employee
WHERE department = 'IT';



SELECT department,
       SUM(salary) AS total_salary
FROM employee
GROUP BY department;




SELECT department,
       SUM(salary)
FROM employee
GROUP BY department
HAVING SUM(salary) > 100000;
