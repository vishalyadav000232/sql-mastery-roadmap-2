
-- GROUP AGREEGATE FUNCTIONS


-- Group by is used to combine a similer value into the single value. 
--After grouping, we usually apply Aggregate Functions like:
-- MAX
-- SUM
-- MIN
-- AVG
-- COUNT





SELECT department, AVG(salary)
FROM employee
GROUP BY department;



--- GROUP BY  + ORDER BY --> Sortin the data on the basis of group 




SELECT department,
       AVG(salary) AS avg_salary
FROM employee
GROUP BY department
ORDER BY avg_salary DESC;

--- GROUP BY + HAVING  --> filter the group using the having with aggregate function s



SELECT department,
       AVG(salary)
FROM employee
GROUP BY department
HAVING AVG(salary) > 40000;