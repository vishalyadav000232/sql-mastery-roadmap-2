

-- 🎯 Definition

-- A Correlated Subquery is a subquery that depends on the outer query.

-- It cannot run independently.

-- The inner query executes once for every row processed by the outer query.


-- Normal SubQuery 

SELECT *
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);

-- correlated subquerry  
SELECT *
FROM employees e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.dept_id = e1.dept_id
);