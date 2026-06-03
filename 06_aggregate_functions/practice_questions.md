
# DBMS Mastery - Aggregate Functions Practice Questions with Answers

## Assumption

```sql
employees(
    employee_id,
    name,
    department,
    salary,
    age,
    city
)
```

---

# COUNT() Questions

### Q1. Count total employees.

```sql
SELECT COUNT(*) AS total_employees
FROM employees;
```

### Q2. Count employees in the IT department.

```sql
SELECT COUNT(*) AS it_employees
FROM employees
WHERE department = 'IT';
```

### Q3. Count employees from Lucknow.

```sql
SELECT COUNT(*) AS lucknow_employees
FROM employees
WHERE city = 'Lucknow';
```

### Q4. Count employees with salary greater than 50000.

```sql
SELECT COUNT(*) AS high_salary_employees
FROM employees
WHERE salary > 50000;
```

### Q5. Count distinct departments.

```sql
SELECT COUNT(DISTINCT department) AS total_departments
FROM employees;
```

---

# SUM() Questions

### Q1. Find total salary of all employees.

```sql
SELECT SUM(salary) AS total_salary
FROM employees;
```

### Q2. Find total salary of IT employees.

```sql
SELECT SUM(salary) AS it_total_salary
FROM employees
WHERE department = 'IT';
```

### Q3. Find total salary of employees from Delhi.

```sql
SELECT SUM(salary) AS delhi_salary
FROM employees
WHERE city = 'Delhi';
```

### Q4. Find total salary where age > 30.

```sql
SELECT SUM(salary) AS salary_above_30
FROM employees
WHERE age > 30;
```

### Q5. Find total salary of HR employees.

```sql
SELECT SUM(salary) AS hr_total_salary
FROM employees
WHERE department = 'HR';
```

---

# AVG() Questions

### Q1. Find average salary of all employees.

```sql
SELECT AVG(salary) AS average_salary
FROM employees;
```

### Q2. Find average age of employees.

```sql
SELECT AVG(age) AS average_age
FROM employees;
```

### Q3. Find average salary of IT employees.

```sql
SELECT AVG(salary) AS avg_it_salary
FROM employees
WHERE department = 'IT';
```

### Q4. Find average salary of employees from Mumbai.

```sql
SELECT AVG(salary) AS avg_mumbai_salary
FROM employees
WHERE city = 'Mumbai';
```

### Q5. Find average age of HR employees.

```sql
SELECT AVG(age) AS avg_hr_age
FROM employees
WHERE department = 'HR';
```

---

# MAX() Questions

### Q1. Find highest salary.

```sql
SELECT MAX(salary) AS highest_salary
FROM employees;
```

### Q2. Find maximum age.

```sql
SELECT MAX(age) AS highest_age
FROM employees;
```

### Q3. Find highest salary in IT department.

```sql
SELECT MAX(salary) AS highest_it_salary
FROM employees
WHERE department = 'IT';
```

### Q4. Find highest salary from Delhi employees.

```sql
SELECT MAX(salary) AS highest_delhi_salary
FROM employees
WHERE city = 'Delhi';
```

### Q5. Find employee with highest salary.

```sql
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);
```

---

# MIN() Questions

### Q1. Find lowest salary.

```sql
SELECT MIN(salary) AS lowest_salary
FROM employees;
```

### Q2. Find minimum age.

```sql
SELECT MIN(age) AS minimum_age
FROM employees;
```

### Q3. Find lowest salary in IT department.

```sql
SELECT MIN(salary) AS lowest_it_salary
FROM employees
WHERE department = 'IT';
```

### Q4. Find lowest salary from Mumbai employees.

```sql
SELECT MIN(salary) AS lowest_mumbai_salary
FROM employees
WHERE city = 'Mumbai';
```

### Q5. Find employee with minimum salary.

```sql
SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);
```

---

# GROUP BY Questions

### Q1. Find total employees in each department.

```sql
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;
```

### Q2. Find average salary by department.

```sql
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
```

### Q3. Find total salary by department.

```sql
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;
```

### Q4. Find maximum salary by department.

```sql
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;
```

### Q5. Find minimum salary by department.

```sql
SELECT department, MIN(salary) AS min_salary
FROM employees
GROUP BY department;
```

---

# HAVING Questions

### Q1. Show departments having more than 5 employees.

```sql
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

### Q2. Show departments whose average salary is greater than 50000.

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
```

### Q3. Show departments whose total salary exceeds 200000.

```sql
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 200000;
```

### Q4. Show departments with maximum salary above 80000.

```sql
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 80000;
```

### Q5. Show departments with minimum salary less than 25000.

```sql
SELECT department, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department
HAVING MIN(salary) < 25000;
```

---

Total Questions: 35

COUNT()   → 5 Questions
SUM()     → 5 Questions
AVG()     → 5 Questions
MAX()     → 5 Questions
MIN()     → 5 Questions
GROUP BY  → 5 Questions
HAVING    → 5 Questions

Level: Beginner → Intermediate
