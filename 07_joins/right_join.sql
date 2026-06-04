-- What is RIGHT JOIN?

-- RIGHT JOIN returns
-- ✅ All records from the right table
-- ✅ Matching records from the left table
-- ✅ If no match exists in the left table, SQL returns NULL
-- Think of it as the opposite of LEFT JOIN.



/*

SELECT columns
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

*/


SELECT columns
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;



-- RIGHT JOIN + Aggregate Functions



SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;