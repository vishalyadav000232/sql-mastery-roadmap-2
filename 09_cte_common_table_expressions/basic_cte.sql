




----     CTE --> Common Table Expretions 

-- A CTE is a temporary result set that you define usinf WITH keyword and use like normal table inside your query .




/*. 

| id | name   | department | salary |
| -- | ------ | ---------- | ------ |
| 1  | Vishal | IT         | 60000  |
| 2  | Rahul  | HR         | 45000  |
| 3  | Aman   | IT         | 70000  |
| 4  | Neha   | Sales      | 55000  |


*/


-- Without Cte 


SELECT * FROM (
  SELECT * FROM employee
  WHERE salary > 50000

  
  ) AS high_salary;



  -- WITH CTE 


  WITH high_salary AS(
    SELECT * FROM empoyeee
    WHERE salary > 50000
    ) SELECT * FROM high_salary;

/*

| id | name   | salary |
| -- | ------ | ------ |
| 1  | Vishal | 60000  |
| 3  | Aman   | 70000  |
| 4  | Neha   | 55000  |


*/



--- Multiple CTEs

WITH
it_employees AS (
    SELECT *
    FROM employees
    WHERE department='IT'
),

high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 50000
)

SELECT *
FROM high_salary;


-- CTE with Aggregate Functions


WITH avg_salary AS (
    SELECT AVG(salary) AS avg_sal
    FROM employees
)

SELECT *
FROM avg_salary;


-- CTE with JOIN 


WITH employee_department AS (
    SELECT
        e.name,
        d.dept_name
    FROM employees e
    JOIN departments d
    ON e.dept_id = d.dept_id
)

SELECT *
FROM employee_department;