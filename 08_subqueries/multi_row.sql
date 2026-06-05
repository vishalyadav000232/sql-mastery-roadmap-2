

-- Multiple row subquery 


-- A Multi-Row Subquery is a subquery that returns more than one row (multiple values).

-- Unlike a Single Row Subquery, the outer query must compare against multiple values, so operators like IN, ANY, ALL, and EXISTS are used.

SELECT *
FROM students
WHERE course_id IN
(
    SELECT course_id
    FROM courses
    WHERE status='ACTIVE'
);

SELECT *
FROM employees
WHERE salary >
ANY
(
    SELECT salary
    FROM employees
    WHERE dept_id=2
);

SELECT *
FROM employees
WHERE salary >
ALL
(
    SELECT salary
    FROM employees
    WHERE dept_id=2
);

SELECT *
FROM departments d
WHERE EXISTS
(
    SELECT *
    FROM employees e
    WHERE e.dept_id=d.dept_id
);