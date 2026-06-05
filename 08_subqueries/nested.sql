

-- A Nested Subquery is a subquery that contains another subquery inside it.

-- Outer Query
--    └── Subquery
--           └── Subquery




/*


SELECT ...
FROM ...
WHERE column =
(
    SELECT ...
    FROM ...
    WHERE column =
    (
        SELECT ...
        FROM ...
    )
);

*/

-- Mujhe un employees ki list do jo Rahul ke department mein kaam karte hain."


SELECT *
FROM employees
WHERE dept_id =
(
    SELECT dept_id
    FROM employees
    WHERE name='Rahul'
);


SELECT *
FROM employees
WHERE dept_id =
(
    SELECT dept_id
    FROM departments
    WHERE manager_id =
    (
        SELECT emp_id
        FROM employees
        WHERE name='Rahul'
    )
);