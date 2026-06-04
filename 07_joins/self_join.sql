

-- 🤔 Why Do We Need SELF JOIN?

-- Suppose an employee's manager is also an employee.🤔 Why Do We Need SELF JOIN?

-- Suppose an employee's manager is also an employee.


-- Problem

-- | employee_id | employee_name | manager_id |
-- -- | ----------- | ------------- | ---------- |
-- -- | 1           | CEO           | NULL       |
-- -- | 2           | Vishal        | 1          |
-- -- | 3           | Rahul         | 1          |
-- -- | 4           | Amit          | 2          |
-- -- | 5           | Neha          | 2          |



-- | Employee | Manager |
-- | -------- | ------- |
-- | Vishal   | CEO     |
-- | Rahul    | CEO     |
-- | Amit     | Vishal  |
-- | Neha     | Vishal  |


-- We need to connect the table to itself.


SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;