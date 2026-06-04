
/*


1. SELF JOIN
What is Self Join?

A table joins with itself.

Employee Table

| employee_id | name   | manager_id |
| ----------- | ------ | ---------- |
| 1           | CEO    | NULL       |
| 2           | Vishal | 1          |
| 3           | Rahul  | 1          |
| 4           | Amit   | 2          |


*/



SELECT
    e.name AS employee,
    m.name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

/*

| employee | manager |
| -------- | ------- |
| CEO      | NULL    |
| Vishal   | CEO     |
| Rahul    | CEO     |
| Amit     | Vishal  |


*/




-- 2. CROSS JOIN
-- What is Cross Join?

-- Every row from Table A combines with every row from Table B.



-- | color |
-- | ----- |
-- | Red   |
-- | Blue  |


-- | size |
-- | ---- |
-- | S    |
-- | M    |
-- | L    |



SELECT *
FROM colors
CROSS JOIN sizes;




-- | color | size |
-- | ----- | ---- |
-- | Red   | S    |
-- | Red   | M    |
-- | Red   | L    |
-- | Blue  | S    |
-- | Blue  | M    |
-- | Blue  | L    |




SELECT
    s.name,
    c.course_name
FROM students s
INNER JOIN enrollments e
ON s.student_id = e.student_id
INNER JOIN courses c
ON e.course_id = c.course_id;
