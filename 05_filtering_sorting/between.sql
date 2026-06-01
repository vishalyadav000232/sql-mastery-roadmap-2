

-- The BETWEEN operator is used to filter data within a specific range. The syntax for using the BETWEEN operator is as follows:

-- SELECT column1, column2 FROM table_name
-- WHERE column_name BETWEEN value1 AND value2;

-- Example :

SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 100000;

-- In this example, we are selecting all columns from the employees table where the salary is between 50000 and 100000. This allows us to retrieve rows that have values within the specified range.
  
