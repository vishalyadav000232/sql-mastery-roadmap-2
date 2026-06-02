






-- MIN() is an Aggregate Function that returns the smallest value from a column.

-- SELECT MIN(column_name)
-- FROM table_name;


SELECT MIN(salary)
FROM employee;


SELECT department,
       MIN(salary)
FROM employee
GROUP BY department
HAVING MIN(salary) > 40000;