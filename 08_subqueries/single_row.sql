


-- A single row subquery is  return the exactly one row (one value ) . the outer query used it to comparison .

/* 


SELECT column_name
FROM table_name
WHERE column_name operator
(
    SELECT column_name
    FROM table_name
);

*/

/*
Employee 

| emp_id | name  | salary | dept_id |
| ------ | ----- | ------ | ------- |
| 1      | Amit  | 50000  | 1       |
| 2      | Rahul | 70000  | 1       |
| 3      | Priya | 60000  | 2       |
| 4      | Neha  | 40000  | 2       |
| 5      | Mohit | 80000  | 3       |

*/

-- Salary grater then average salary 

-- Find employees whose salary is greater than the average salary.


select name  , salary  from employee
where salary > (
  select AVG(salary) from employee
);

-- Find the employee with the highest salary.

SELECT *
FROM employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
);


-- note Aggregate function are common becouse of the it returun single value 

-- 1. Execute Inner Query
-- 2. Get Single Value
-- 3. Pass Value to Outer Query
-- 4. Execute Outer Query
-- 5. Return Result

-- Single Row Subquery

-- ✔ Returns one value
-- ✔ Executes first
-- ✔ Used with =, >, <, >=, <=, <>
-- ✔ Often uses AVG, MAX, MIN, SUM, COUNT
-- ✔ Outer query uses returned value

-- Examples:
-- Salary > Average Salary
-- Salary = Maximum Salary
-- Salary = Minimum Salary
-- Student Fee > Average Fee
