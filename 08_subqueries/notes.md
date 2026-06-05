# 📚 DBMS Mastery - Subqueries Complete Notes

# 📦 08_subqueries

---

# What is a Subquery?

A **subquery** is a query written inside another SQL query.

It is also known as:

* Inner Query
* Nested Query
* Inner Select

The outer query uses the result produced by the inner query.

## General Syntax

```sql
SELECT column_name
FROM table_name
WHERE column_name operator
(
    SELECT column_name
    FROM table_name
);
```

---

# Why Do We Use Subqueries?

Subqueries help when:

✅ One query depends on another query

✅ Dynamic filtering is required

✅ Comparing values with calculated results

✅ Finding highest/lowest values

✅ Advanced reporting

✅ Data analysis

---

# Example Database

## Employees Table

```sql
employee
(
    emp_id,
    emp_name,
    department,
    salary,
    manager_id
)
```

| emp_id | emp_name | department | salary |
| ------ | -------- | ---------- | ------ |
| 1      | Vishal   | IT         | 60000  |
| 2      | Aman     | IT         | 70000  |
| 3      | Ravi     | HR         | 50000  |
| 4      | Priya    | HR         | 45000  |
| 5      | Neha     | Sales      | 80000  |

---

# Types of Subqueries

1. Single Row Subquery
2. Multi Row Subquery
3. Nested Subquery
4. Correlated Subquery

---

# 1️⃣ Single Row Subquery

---

## Definition

A subquery that returns exactly one row.

Usually used with:

```sql
=
>
<
>=
<=
<>
```

---

## Example 1

Find employees earning more than the average salary.

```sql
SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);
```

### Step 1

Inner Query

```sql
SELECT AVG(salary)
FROM employee;
```

Result:

```sql
61000
```

### Step 2

Outer Query

```sql
SELECT *
FROM employee
WHERE salary > 61000;
```

Result:

```sql
Aman
Neha
```

---

## Example 2

Find employee having maximum salary.

```sql
SELECT *
FROM employee
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee
);
```

Result:

```sql
Neha
```

---

## Example 3

Find employee with minimum salary.

```sql
SELECT *
FROM employee
WHERE salary =
(
    SELECT MIN(salary)
    FROM employee
);
```

---

## Real World Use Cases

### E-Commerce

Highest order amount

```sql
SELECT *
FROM orders
WHERE amount =
(
    SELECT MAX(amount)
    FROM orders
);
```

### Banking

Account having highest balance

### Hospital

Doctor with highest consultation fee

---

## Interview Question

Q. Why use a subquery instead of manually writing value?

Because values change dynamically.

---

# 2️⃣ Multi Row Subquery

---

## Definition

A subquery returning multiple rows.

Since multiple rows are returned, operators like:

```sql
=
>
<
```

cannot be used directly.

Instead use:

```sql
IN
ANY
ALL
EXISTS
```

---

## Example Data

```sql
department
(
    dept_id,
    dept_name
)
```

---

## Example 1

Find employees from IT and HR.

```sql
SELECT *
FROM employee
WHERE department IN
(
    SELECT department
    FROM employee
    WHERE department IN ('IT','HR')
);
```

---

## IN Operator

Checks whether a value exists in a list.

```sql
SELECT *
FROM employee
WHERE department IN
(
    SELECT department
    FROM employee
    WHERE salary > 50000
);
```

---

## ANY Operator

Returns TRUE if condition matches ANY value.

Example:

```sql
SELECT *
FROM employee
WHERE salary > ANY
(
    SELECT salary
    FROM employee
    WHERE department='HR'
);
```

HR salaries:

```sql
50000
45000
```

Condition becomes:

```sql
salary > 50000 OR salary > 45000
```

---

## ALL Operator

Condition must satisfy ALL values.

```sql
SELECT *
FROM employee
WHERE salary > ALL
(
    SELECT salary
    FROM employee
    WHERE department='HR'
);
```

Means:

```sql
salary > 50000
AND
salary > 45000
```

---

## Difference

### ANY

At least one condition true.

### ALL

Every condition true.

---

## EXISTS

Checks whether rows exist.

```sql
SELECT *
FROM employee e
WHERE EXISTS
(
    SELECT *
    FROM employee
    WHERE department='IT'
);
```

If IT department exists, query returns all employees.

---

## Real World Uses

### Shopping Site

Products belonging to categories.

### Banking

Customers having multiple accounts.

### HR

Employees belonging to selected departments.

---

# 3️⃣ Nested Subquery

---

## Definition

A subquery inside another subquery.

Query inside query inside query.

---

## Structure

```sql
SELECT ...
(
    SELECT ...
    (
        SELECT ...
    )
)
```

---

## Example

Find employee with highest salary in IT department.

```sql
SELECT *
FROM employee
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee
    WHERE department =
    (
        SELECT department
        FROM employee
        WHERE emp_name='Aman'
    )
);
```

---

## Execution

### Inner Query

```sql
SELECT department
FROM employee
WHERE emp_name='Aman';
```

Result:

```sql
IT
```

---

### Second Query

```sql
SELECT MAX(salary)
FROM employee
WHERE department='IT';
```

Result:

```sql
70000
```

---

### Outer Query

```sql
SELECT *
FROM employee
WHERE salary=70000;
```

Result:

```sql
Aman
```

---

## Advantages

* Powerful filtering
* Complex reports
* Dynamic calculations

---

## Disadvantages

* Hard to read
* Slower performance
* Difficult debugging

---

# 4️⃣ Correlated Subquery

---

## Definition

A subquery that depends on the outer query.

The inner query executes once for every row of the outer query.

---

## Normal Subquery

Runs only once.

```sql
SELECT AVG(salary)
FROM employee;
```

Executed:

```sql
1 time
```

---

## Correlated Subquery

Runs for each row.

```sql
100 rows
=
100 executions
```

---

## Example

Find employees earning more than their department average.

```sql
SELECT *
FROM employee e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee e2
    WHERE e1.department = e2.department
);
```

---

## How It Works

For Vishal (IT)

```sql
AVG(IT)
```

For Aman (IT)

```sql
AVG(IT)
```

For Ravi (HR)

```sql
AVG(HR)
```

For Priya (HR)

```sql
AVG(HR)
```

---

## Result

Employees earning above department average.

---

## Another Example

Find highest-paid employee in each department.

```sql
SELECT *
FROM employee e1
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee e2
    WHERE e1.department = e2.department
);
```

Result:

```sql
Aman
Ravi
Neha
```

---

# Correlated vs Normal Subquery

| Feature    | Normal      | Correlated             |
| ---------- | ----------- | ---------------------- |
| Execution  | Once        | Every row              |
| Speed      | Faster      | Slower                 |
| Dependency | Independent | Depends on outer query |
| Complexity | Low         | High                   |

---

# Execution Order of SQL with Subqueries

Generally:

```sql
1. Inner Query
2. Outer Query
```

Example:

```sql
SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);
```

First:

```sql
AVG(salary)
```

Then:

```sql
salary > result
```

---

# Common Mistakes

## Mistake 1

Using = with multiple rows

❌ Wrong

```sql
SELECT *
FROM employee
WHERE department =
(
    SELECT department
    FROM employee
);
```

✅ Correct

```sql
SELECT *
FROM employee
WHERE department IN
(
    SELECT department
    FROM employee
);
```

---

## Mistake 2

Returning multiple columns

❌ Wrong

```sql
SELECT *
FROM employee
WHERE salary =
(
    SELECT emp_name, salary
    FROM employee
);
```

---

## Mistake 3

Ignoring NULL values

Always handle NULL carefully.

---

# Performance Tips

✅ Prefer JOIN when possible

✅ Use indexes

✅ Avoid deep nested subqueries

✅ Use EXISTS instead of IN for very large tables

✅ Optimize correlated subqueries

---

# Interview Questions

### Q1 What is a subquery?

A query inside another query.

---

### Q2 Types of subqueries?

* Single Row
* Multi Row
* Nested
* Correlated

---

### Q3 Difference between IN and EXISTS?

IN compares values.

EXISTS checks row existence.

---

### Q4 Difference between ANY and ALL?

ANY → one value match.

ALL → every value match.

---

### Q5 Why are correlated subqueries slower?

Because they execute for every row of the outer query.

---

# Quick Revision

## Single Row

Returns:

```sql
1 Row
```

Operators:

```sql
=
>
<
```

---

## Multi Row

Returns:

```sql
Multiple Rows
```

Operators:

```sql
IN
ANY
ALL
EXISTS
```

---

## Nested

Subquery inside subquery.

```sql
Query → Query → Query
```

---

## Correlated

Depends on outer query.

```sql
Runs once per row
```

---

# Industry Examples

### Amazon

Products above category average price.

### Flipkart

Top-selling products per category.

### Bank

Customers with balance above branch average.

### Hospital

Doctors earning more than department average.

### HR Analytics

Highest-paid employee in each department.

---

# Final Formula

```text
Single Row
    ↓
One Value

Multi Row
    ↓
Many Values

Nested
    ↓
Query Inside Query

Correlated
    ↓
Depends On Outer Query
```

🎯 Master these four subqueries and you can solve nearly 80% of SQL interview questions involving filtering, reporting, analytics, and business logic.
