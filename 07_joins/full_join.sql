











-- What is FULL JOIN?

-- FULL JOIN returns:

-- ✅ All matching rows from both tables

-- ✅ All unmatched rows from the left table

-- ✅ All unmatched rows from the right table

-- ✅ Missing values are filled with NULL

-- You can think of it as:

      -- LEFT JOIN
      --  +
      -- RIGHT JOIN
      --    =
      -- FULL JOIN






SELECT
    e.employee_id,
    e.name,
    d.department_name
FROM employees e
FULL JOIN departments d
ON e.department_id = d.department_id;







SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM employees e
FULL JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;