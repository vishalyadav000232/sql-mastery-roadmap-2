# DBMS Mastery - Joins Complete Notes

# 📚 What is a JOIN?

A JOIN is used to combine rows from two or more tables based on a related column between them.

Without JOINs, data stored in separate tables cannot be connected efficiently.

---

# Why Do We Need JOINs?

Suppose we have:

## Employees Table

| employee_id | name   | department_id |
| ----------- | ------ | ------------- |
| 1           | Vishal | 101           |
| 2           | Rahul  | 102           |
| 3           | Amit   | 101           |

## Departments Table

| department_id | department_name |
| ------------- | --------------- |
| 101           | IT              |
| 102           | HR              |

If we want:

| name   | department_name |
| ------ | --------------- |
| Vishal | IT              |
| Rahul  | HR              |
| Amit   | IT              |

We use JOIN.

---

# Types of JOINs

1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN
4. FULL JOIN
5. CROSS JOIN
6. SELF JOIN
7. ADVANCED JOINs

---

# 1. INNER JOIN

## Definition

Returns only matching records from both tables.

## Syntax

```sql
SELECT *
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
```

## Visualization

Employees

| Dept ID |
| ------- |
| 101     |
| 102     |
| 103     |

Departments

| Dept ID |
| ------- |
| 101     |
| 102     |

Result

| Dept ID |
| ------- |
| 101     |
| 102     |

Only common records are returned.

---

## Real World Example

Get employee names with department names.

```sql
SELECT
e.name,
d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
```

---

## Interview Question

Q: Which records are returned by INNER JOIN?

Answer:

Only matching records from both tables.

---

# 2. LEFT JOIN

## Definition

Returns:

* All records from LEFT table
* Matching records from RIGHT table
* NULL where no match exists

---

## Syntax

```sql
SELECT *
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
```

---

## Visualization

Employees

| Dept ID |
| ------- |
| 101     |
| 102     |
| 103     |

Departments

| Dept ID |
| ------- |
| 101     |
| 102     |

Result

| Dept ID  |
| -------- |
| 101      |
| 102      |
| 103 NULL |

---

## Example

Find all employees even if department doesn't exist.

```sql
SELECT
e.name,
d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
```

---

## Real World Usage

* Users without orders
* Customers without payments
* Students without courses

---

## Interview Question

Q: What is the difference between INNER JOIN and LEFT JOIN?

Answer:

INNER JOIN returns only matching rows.

LEFT JOIN returns all rows from left table.

---

# 3. RIGHT JOIN

## Definition

Returns:

* All records from RIGHT table
* Matching records from LEFT table
* NULL if no match exists

---

## Syntax

```sql
SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;
```

---

## Visualization

Employees

| Dept ID |
| ------- |
| 101     |
| 102     |

Departments

| Dept ID |
| ------- |
| 101     |
| 102     |
| 103     |

Result

| Dept ID  |
| -------- |
| 101      |
| 102      |
| NULL 103 |

---

## Example

```sql
SELECT
e.name,
d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;
```

---

## Real World Usage

Find departments with no employees.

---

# 4. FULL JOIN

## Definition

Returns:

* All rows from LEFT table
* All rows from RIGHT table
* Matching rows merged

---

## Syntax

```sql
SELECT *
FROM employees e
FULL JOIN departments d
ON e.department_id = d.department_id;
```

---

## Visualization

Employees

| 101 |
| 102 |
| 104 |

Departments

| 101 |
| 102 |
| 103 |

Result

| 101 |
| 102 |
| 103 |
| 104 |

All records appear.

---

## Real World Usage

Data reconciliation.

Example:

* Old system data
* New system data

Find missing records.

---

# 5. CROSS JOIN

## Definition

Produces Cartesian Product.

Every row of first table combines with every row of second table.

---

## Formula

```text
Rows Returned

=
Rows(Table A)
×
Rows(Table B)
```

---

## Example

Students

| Student |
| ------- |
| A       |
| B       |

Courses

| Course |
| ------ |
| SQL    |
| Python |

Result

| Student | Course |
| ------- | ------ |
| A       | SQL    |
| A       | Python |
| B       | SQL    |
| B       | Python |

---

## Syntax

```sql
SELECT *
FROM students
CROSS JOIN courses;
```

---

## Real World Usage

Generate combinations.

Examples:

* T-shirt size combinations
* Product variants
* Seating arrangements

---

## Interview Question

Q: What is Cartesian Product?

Answer:

Every row of first table combines with every row of second table.

---

# 6. SELF JOIN

## Definition

A table joined with itself.

---

## Why?

When data inside same table is related.

---

## Employee-Manager Example

Employees

| id | name   | manager_id |
| -- | ------ | ---------- |
| 1  | CEO    | NULL       |
| 2  | Vishal | 1          |
| 3  | Rahul  | 1          |

---

## Query

```sql
SELECT
e.name AS employee,
m.name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;
```

---

## Result

| Employee | Manager |
| -------- | ------- |
| Vishal   | CEO     |
| Rahul    | CEO     |

---

## Real World Usage

* Employee hierarchy
* Family tree
* Organization chart

---

# 7. Advanced JOINs

---

## Multiple Table JOIN

Join more than two tables.

```sql
SELECT
e.name,
d.department_name,
p.project_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN projects p
ON e.project_id = p.project_id;
```

---

## JOIN + Aggregate Function

```sql
SELECT
d.department_name,
COUNT(*) AS total_employees
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;
```

---

## JOIN + GROUP BY

```sql
SELECT
d.department_name,
AVG(e.salary)
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;
```

---

## JOIN + HAVING

```sql
SELECT
d.department_name,
COUNT(*)
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(*) > 5;
```

---

## JOIN + Subquery

```sql
SELECT *
FROM employees
WHERE salary >
(
SELECT AVG(salary)
FROM employees
);
```

---

# JOIN Execution Order

```text
FROM
↓
JOIN
↓
ON
↓
WHERE
↓
GROUP BY
↓
HAVING
↓
SELECT
↓
ORDER BY
↓
LIMIT
```

---

# JOIN Performance Tips

### Use Indexes

```sql
CREATE INDEX idx_dept
ON employees(department_id);
```

Indexes speed up JOIN operations.

---

### Avoid SELECT *

Bad

```sql
SELECT *
FROM employees
INNER JOIN departments;
```

Good

```sql
SELECT
e.name,
d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
```

---

# Most Important Interview Questions

### Q1 What is JOIN?

Combines rows from multiple tables.

---

### Q2 Difference between INNER and LEFT JOIN?

INNER → only matching rows

LEFT → all rows from left table

---

### Q3 What is SELF JOIN?

Joining a table with itself.

---

### Q4 What is CROSS JOIN?

Cartesian Product.

---

### Q5 Which JOIN returns all records?

FULL JOIN.

---

### Q6 Can JOIN be used with GROUP BY?

Yes.

Very common in real-world projects.

---

# Real Backend Project Usage

## E-Commerce

Users + Orders

```sql
SELECT
u.name,
o.order_id
FROM users u
INNER JOIN orders o
ON u.user_id = o.user_id;
```

---

## Library Management System (Yadav Library)

Students + Seats

```sql
SELECT
s.student_name,
st.seat_number
FROM students s
INNER JOIN seats st
ON s.seat_id = st.id;
```

---

## HRMS

Employees + Departments

```sql
SELECT
e.name,
d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
```

---

# Final Revision Table

| JOIN       | Returns                   |
| ---------- | ------------------------- |
| INNER JOIN | Matching rows only        |
| LEFT JOIN  | All left + matching right |
| RIGHT JOIN | All right + matching left |
| FULL JOIN  | All rows from both tables |
| CROSS JOIN | Cartesian Product         |
| SELF JOIN  | Table joined with itself  |

---

# Golden Rule

INNER JOIN → Matching Data

LEFT JOIN → Keep Left Data

RIGHT JOIN → Keep Right Data

FULL JOIN → Keep Everything

CROSS JOIN → Every Combination

SELF JOIN → Same Table Relationship
