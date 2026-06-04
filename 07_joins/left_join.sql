



-- What is LEFT JOIN?

-- LEFT JOIN returns:
-- ✅ All records from the left table
-- ✅ Matching records from the right table
-- ✅ If no match exists in the right table, SQL returns NULL



-- SELECT columns
-- FROM table1
-- LEFT JOIN table2
-- ON table1.column = table2.column;




SELECT
    e.employee_id,
    e.name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;




-- Count Employees in Each Department


SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;
