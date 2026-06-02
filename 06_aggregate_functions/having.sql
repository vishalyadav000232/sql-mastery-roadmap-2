


-- HAVING AGREEGATE FUCITONS


-- HAVING is used to filter groups after GROUP BY.


SELECT department,
       AVG(salary) AS avg_salary
FROM employee
GROUP BY department
HAVING AVG(salary) > 50000;

-- WHERE AND HVING TOGEATHER  

SELECT department,
       AVG(salary)
FROM employee
WHERE salary > 30000
GROUP BY department
HAVING AVG(salary) > 50000;
