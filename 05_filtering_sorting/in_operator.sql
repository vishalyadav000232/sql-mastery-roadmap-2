

-- The IN operator is used to specify multiple values in a WHERE clause. The syntax for using the IN operator is as follows:

-- SELECT column1, column2 FROM table_name
-- WHERE column_name IN (value1, value2, ...);

-- Example :

SELECT * FROM employees
WHERE department IN ('Sales', 'Marketing', 'IT');

-- In this example, we are selecting all columns from the employees table where the department is either 'Sales', 'Marketing', or 'IT'. This allows us to retrieve rows that match any of the specified values in the IN clause.  


-- The IN Operators can also be used with subqueries to  filter data based on the results of another query. For example, if we want to select all employees who work in departments that have more than 10 employees, we could use the following queery .


SELECT * FROM employees
WHERE department IN(
  SELECT department from employees
  GROUP BY department
  HAVING COUNT(*)> 10
)


-- In this example, the subquery selects all departments from the employees table, groups them by department, and filters to include only those departments that have more than 10 employees. then the main query selects all employees whose department is in the list of departments returned by the subquery. This allows us to retrieve employees who work in departments with a large number of employees 

