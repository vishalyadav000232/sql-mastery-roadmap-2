










WITH RECURSIVE numbers AS (

    SELECT 1

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 10
)

SELECT *
FROM numbers;


---- output 

-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
-- 10


WITH RECURSIVE employee_tree AS (

    SELECT
        id,
        name,
        manager_id
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.id,
        e.name,
        e.manager_id
    FROM employees e
    JOIN employee_tree et
    ON e.manager_id = et.id
)

SELECT *
FROM employee_tree;