# 📘 SQL CTE (Common Table Expressions) Complete Notes

# Table of Contents

1. What is a CTE?
2. Why Do We Need CTE?
3. Basic CTE Syntax
4. How CTE Works Internally
5. Basic Examples
6. Multiple CTEs
7. CTE Depending on Another CTE
8. CTE with Aggregate Functions
9. CTE with JOIN
10. Advanced CTE Example
11. CTE vs Subquery
12. Recursive CTE
13. Recursive CTE Execution Flow
14. Hierarchy Example
15. Real World Applications
16. Interview Questions
17. Summary

---

# What is a CTE?

CTE stands for **Common Table Expression**.

A CTE is a temporary named result set that exists only during the execution of a SQL query.

Think of it as:

```text
Temporary Table
+
Readable Query
+
Reusable Query Block
```

A CTE is created using the `WITH` keyword.

---

# Why Do We Need CTE?

Suppose we write:

```sql
SELECT *
FROM (
    SELECT *
    FROM employees
    WHERE salary > 50000
) AS temp_table;
```

This is manageable.

But in large projects:

```sql
SELECT *
FROM (
    SELECT *
    FROM (
        SELECT *
        FROM (
            ...
        )
    )
);
```

The query becomes difficult to:

* Read
* Maintain
* Debug
* Modify

CTE solves this problem.

---

# Basic CTE Syntax

```sql
WITH cte_name AS
(
    SELECT ...
)
SELECT *
FROM cte_name;
```

---

# How CTE Works Internally

Example:

```sql
WITH high_salary AS
(
    SELECT *
    FROM employees
    WHERE salary > 60000
)
SELECT *
FROM high_salary;
```

SQL performs:

### Step 1

```sql
SELECT *
FROM employees
WHERE salary > 60000;
```

Result:

| id | name  | salary |
| -- | ----- | ------ |
| 2  | Rahul | 70000  |
| 3  | Aman  | 80000  |

---

### Step 2

SQL temporarily names this result:

```text
high_salary
```

---

### Step 3

Now SQL executes:

```sql
SELECT *
FROM high_salary;
```

---

### Step 4

Temporary result disappears after query execution.

---

# Example Dataset

```sql
employees
```

| id | name   | department | salary |
| -- | ------ | ---------- | ------ |
| 1  | Vishal | IT         | 50000  |
| 2  | Rahul  | HR         | 70000  |
| 3  | Aman   | IT         | 80000  |
| 4  | Neha   | Sales      | 55000  |

---

# Basic CTE Example

```sql
WITH high_salary AS
(
    SELECT *
    FROM employees
    WHERE salary > 60000
)
SELECT *
FROM high_salary;
```

Output:

| id | name  | salary |
| -- | ----- | ------ |
| 2  | Rahul | 70000  |
| 3  | Aman  | 80000  |

---

# Multiple CTEs

You can create multiple temporary result sets.

```sql
WITH
it_employees AS
(
    SELECT *
    FROM employees
    WHERE department = 'IT'
),

high_salary AS
(
    SELECT *
    FROM employees
    WHERE salary > 60000
)

SELECT *
FROM high_salary;
```

---

# CTE Depending on Another CTE

```sql
WITH
it_employees AS
(
    SELECT *
    FROM employees
    WHERE department='IT'
),

high_salary_it AS
(
    SELECT *
    FROM it_employees
    WHERE salary > 60000
)

SELECT *
FROM high_salary_it;
```

Output:

| id | name | salary |
| -- | ---- | ------ |
| 3  | Aman | 80000  |

---

# CTE with Aggregate Function

Average salary:

```sql
WITH avg_salary AS
(
    SELECT AVG(salary) AS avg_sal
    FROM employees
)

SELECT *
FROM avg_salary;
```

Output:

```text
avg_sal
63750
```

---

# Employees Above Average Salary

```sql
WITH avg_salary AS
(
    SELECT AVG(salary) AS avg_sal
    FROM employees
)

SELECT *
FROM employees
WHERE salary >
(
    SELECT avg_sal
    FROM avg_salary
);
```

Output:

| id    | name |
| ----- | ---- |
| Rahul |      |
| Aman  |      |

---

# CTE with JOIN

Tables:

## Employees

| id | name | dept_id |
| -- | ---- | ------- |

## Departments

| dept_id | dept_name |
| ------- | --------- |

---

```sql
WITH employee_department AS
(
    SELECT
        e.name,
        d.dept_name
    FROM employees e
    JOIN departments d
    ON e.dept_id = d.dept_id
)

SELECT *
FROM employee_department;
```

---

# Advanced Example

Find employees earning more than their department average salary.

```sql
WITH dept_avg AS
(
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)

SELECT
    e.name,
    e.salary,
    d.avg_salary
FROM employees e
JOIN dept_avg d
ON e.department = d.department
WHERE e.salary > d.avg_salary;
```

---

# CTE vs Subquery

| Feature           | CTE         | Subquery  |
| ----------------- | ----------- | --------- |
| Readability       | Excellent   | Average   |
| Reusability       | Yes         | No        |
| Maintenance       | Easy        | Hard      |
| Recursive Support | Yes         | No        |
| Complex Queries   | Best Choice | Difficult |

---

# Recursive CTE

Recursive CTE is a CTE that refers to itself.

Used for:

* Employee Hierarchy
* Organization Structure
* Category Tree
* Folder Structure
* Bill Of Materials
* Generating Sequences

---

# Recursive CTE Syntax

```sql
WITH RECURSIVE cte_name AS
(
    Anchor Query

    UNION ALL

    Recursive Query
)
SELECT *
FROM cte_name;
```

---

# Understanding Anchor Query

Anchor query starts the recursion.

Example:

```sql
SELECT 1
```

Output:

```text
1
```

This becomes the initial row.

---

# Understanding Recursive Query

Recursive query uses previous results to create new rows.

Example:

```sql
SELECT n + 1
FROM numbers
```

If:

```text
n = 1
```

Output:

```text
2
```

---

# Generate Numbers 1 To 10

```sql
WITH RECURSIVE numbers(n) AS
(
    SELECT 1

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 10
)

SELECT *
FROM numbers;
```

Output:

```text
1
2
3
4
5
6
7
8
9
10
```

---

# Dry Run

### Iteration 1

Anchor Query:

```sql
SELECT 1
```

Result:

```text
1
```

---

### Iteration 2

```sql
1 + 1
```

Result:

```text
2
```

---

### Iteration 3

```sql
2 + 1
```

Result:

```text
3
```

---

### Iteration 4

```sql
3 + 1
```

Result:

```text
4
```

---

### Iteration 5

```sql
4 + 1
```

Result:

```text
5
```

Continues until:

```text
10
```

Condition:

```sql
WHERE n < 10
```

becomes false.

Recursion stops.

---

# Employee Hierarchy Example

Table:

| id | name      | manager_id |
| -- | --------- | ---------- |
| 1  | CEO       | NULL       |
| 2  | Manager   | 1          |
| 3  | Team Lead | 2          |
| 4  | Developer | 3          |
| 5  | Intern    | 4          |

---

```sql
WITH RECURSIVE employee_tree AS
(
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
```

Output:

```text
CEO
Manager
Team Lead
Developer
Intern
```

---

# Hierarchy Visualization

```text
CEO
│
├── Manager
│
├── Team Lead
│
├── Developer
│
└── Intern
```

Recursive CTE walks through the hierarchy level by level.

---

# Real World Applications

## 1. Company Hierarchy

```text
CEO
 ├── Manager
 │    ├── Developer
 │    └── Tester
```

---

## 2. E-Commerce Categories

```text
Electronics
 ├── Mobile
 │     ├── Samsung
 │     └── Apple
```

---

## 3. Folder Structure

```text
C:
 ├── Projects
 │    ├── SQL
 │    └── Python
```

---

## 4. Social Networks

Friend-of-friend relationships.

---

## 5. Banking

Transaction chains.

---

## 6. Reporting Systems

Breaking large reports into logical steps.

---

# Advantages of CTE

✅ Better readability

✅ Easy maintenance

✅ Query decomposition

✅ Reusable logic

✅ Supports recursion

✅ Easier debugging

---

# Disadvantages of CTE

❌ Not permanent

❌ Exists only during query execution

❌ Recursive CTE can become expensive on huge datasets

---

# Interview Questions

## Q1 What is CTE?

A temporary named result set created using the WITH clause.

---

## Q2 Why use CTE?

To improve readability and simplify complex queries.

---

## Q3 Difference Between CTE and Temporary Table?

| CTE                  | Temporary Table                  |
| -------------------- | -------------------------------- |
| Exists for one query | Exists for session               |
| No physical storage  | Uses temporary storage           |
| Lightweight          | Heavier                          |
| Good for query logic | Good for large intermediate data |

---

## Q4 Can CTE reference another CTE?

Yes.

```sql
WITH cte1 AS (...),
cte2 AS (...)
SELECT * FROM cte2;
```

---

## Q5 Can a CTE call itself?

Yes.

This is called Recursive CTE.

---

## Q6 Which databases support CTE?

* PostgreSQL
* MySQL 8+
* SQL Server
* Oracle
* SQLite

---

# Quick Revision

## Normal CTE

```sql
WITH temp AS
(
    SELECT ...
)
SELECT *
FROM temp;
```

Meaning:

```text
Create Temporary Table
→ Give Name
→ Use Like Normal Table
```

---

## Recursive CTE

```sql
WITH RECURSIVE temp AS
(
    Anchor Query

    UNION ALL

    Recursive Query
)
SELECT *
FROM temp;
```

Meaning:

```text
Start
↓
Generate New Rows
↓
Repeat
↓
Condition False
↓
Stop
```

---

# One-Line Memory Trick

```text
CTE = Temporary Named Result Set

Recursive CTE = Temporary Result Set That Calls Itself Until A Condition Becomes False
```
