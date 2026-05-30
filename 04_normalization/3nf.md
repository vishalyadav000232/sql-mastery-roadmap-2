# 3nf.md

# Third Normal Form (3NF)

## What is 3NF?

### Definition

A table is in **Third Normal Form (3NF)** if:

1. It is already in **2NF**.
2. It contains **no transitive dependencies**.
3. Every non-key attribute depends directly on the primary key.

---

# Simple Definition

```text
3NF = Remove Transitive Dependency
```

or

```text
Every column should depend
ONLY on the Primary Key.
```

---

# Why Was 3NF Introduced?

Even after achieving 2NF, redundancy can still exist.

Example:

| Employee_ID | Employee_Name | Department_ID | Department_Name |
| ----------- | ------------- | ------------- | --------------- |
| 1           | Rahul         | 101           | IT              |
| 2           | Aman          | 101           | IT              |
| 3           | Neha          | 102           | HR              |

Notice:

```text
IT
IT
```

is repeated.

This creates redundancy.

---

# Understanding Transitive Dependency

## Definition

A transitive dependency exists when:

```text
A → B
B → C
```

Therefore:

```text
A → C
```

indirectly.

---

# Easy Example

Table:

| Employee_ID | Employee_Name | Department_ID | Department_Name |
| ----------- | ------------- | ------------- | --------------- |
| 1           | Rahul         | 101           | IT              |

Dependencies:

```text
Employee_ID
      ↓
Department_ID
      ↓
Department_Name
```

Department_Name depends on Department_ID.

Department_ID depends on Employee_ID.

Thus:

```text
Employee_ID
      ↓
Department_Name
```

indirectly.

This is called:

```text
Transitive Dependency
```

---

# Real World Analogy

Imagine a company.

### Bad Design

| Employee_ID | Employee_Name | Department_Name |
| ----------- | ------------- | --------------- |
| 1           | Rahul         | IT              |
| 2           | Aman          | IT              |
| 3           | Neha          | HR              |

Problem:

Department information repeats for every employee.

---

# Problem Before 3NF

## Employee Table

| Employee_ID | Employee_Name | Department_ID | Department_Name |
| ----------- | ------------- | ------------- | --------------- |
| 1           | Rahul         | 101           | IT              |
| 2           | Aman          | 101           | IT              |
| 3           | Neha          | 102           | HR              |

---

# Functional Dependencies

```text
Employee_ID → Department_ID
Department_ID → Department_Name
```

Therefore:

```text
Employee_ID → Department_Name
```

Transitive dependency exists.

---

# Problems Caused

## Update Anomaly

Suppose:

```text
IT → Information Technology
```

Need to update:

```text
Rahul row
Aman row
```

Miss one row.

Database becomes inconsistent.

---

## Delete Anomaly

Delete last employee from HR.

Department information disappears.

---

## Insert Anomaly

Cannot add a department until an employee exists.

---

# Converting To 3NF

## Step 1

Identify transitive dependency.

```text
Department_ID → Department_Name
```

---

## Step 2

Move department information to a separate table.

---

# Final 3NF Design

## Departments

| Department_ID | Department_Name |
| ------------- | --------------- |
| 101           | IT              |
| 102           | HR              |

---

## Employees

| Employee_ID | Employee_Name | Department_ID |
| ----------- | ------------- | ------------- |
| 1           | Rahul         | 101           |
| 2           | Aman          | 101           |
| 3           | Neha          | 102           |

---

# ER Diagram

```text
+---------------+
| Departments   |
+---------------+
| department_id |
| department_name
+---------------+
        |
        |
        |
        V

+-------------+
| Employees   |
+-------------+
| employee_id |
| employee_name
| department_id FK
+-------------+
```

---

# PostgreSQL Implementation

## Departments Table

```sql
CREATE TABLE departments(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
```

---

## Employees Table

```sql
CREATE TABLE employees(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),

    department_id INT,

    FOREIGN KEY(department_id)
    REFERENCES departments(department_id)
);
```

---

# Sample Data

## Departments

```sql
INSERT INTO departments
VALUES
(101,'IT'),
(102,'HR');
```

---

## Employees

```sql
INSERT INTO employees
VALUES
(1,'Rahul',101),
(2,'Aman',101),
(3,'Neha',102);
```

---

# Query Examples

## Show Employees With Department Names

```sql
SELECT
    e.employee_name,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
```

---

## Output

| Employee | Department |
| -------- | ---------- |
| Rahul    | IT         |
| Aman     | IT         |
| Neha     | HR         |

---

# Another Real Example

## Banking System

### Bad Design

| Account_ID | Customer_Name | Branch_Name |
| ---------- | ------------- | ----------- |
| 1001       | Rahul         | Lucknow     |
| 1002       | Aman          | Lucknow     |

Branch name repeats.

---

### 3NF Design

#### Customers

| Customer_ID | Name  |
| ----------- | ----- |
| 1           | Rahul |

---

#### Branches

| Branch_ID | Branch_Name |
| --------- | ----------- |
| 10        | Lucknow     |

---

#### Accounts

| Account_ID | Customer_ID | Branch_ID |
| ---------- | ----------- | --------- |
| 1001       | 1           | 10        |

---

# Real Engineering Usage

## Amazon

```text
Products
Categories
Suppliers
```

Stored separately.

---

## ERP Systems

```text
Employees
Departments
Locations
```

Stored separately.

---

## Hospital Systems

```text
Patients
Doctors
Departments
```

Stored separately.

---

## Library Management

```text
Books
Authors
Publishers
```

Stored separately.

---

# Performance Impact

## Advantages

### Less Redundancy

Department stored once.

---

### Easier Updates

Update one row.

---

### Better Consistency

No conflicting department names.

---

### Cleaner Schema

Industry-standard design.

---

# Drawbacks

More tables.

More JOIN operations.

Slightly more complex queries.

---

# Interview Questions

## Beginner

### What is 3NF?

A table in 2NF with no transitive dependency.

---

### What is a transitive dependency?

When one non-key column depends on another non-key column.

---

## Intermediate

### Difference Between 2NF and 3NF?

```text
2NF removes Partial Dependency.

3NF removes Transitive Dependency.
```

---

### Does 3NF reduce redundancy?

Yes.

It removes redundancy caused by non-key dependencies.

---

## Advanced

### Can a table be in 2NF but not 3NF?

Yes.

If transitive dependency still exists.

---

### Why is 3NF widely used in production databases?

Because it balances:

```text
Data Integrity
Storage Efficiency
Maintainability
```

---

# Common Mistakes

## Mistake 1

Keeping Department_Name inside Employees table.

---

## Mistake 2

Keeping Author_Name inside Books table.

---

## Mistake 3

Confusing Partial Dependency with Transitive Dependency.

```text
Partial Dependency
=
2NF

Transitive Dependency
=
3NF
```

---

# Memory Trick

```text
1NF
=
One Cell One Value

2NF
=
Depend On Whole Key

3NF
=
Depend Only On Key
```

---

# Quick Revision

## 1NF Removes

```text
Repeating Groups
Multi-valued Attributes
```

---

## 2NF Removes

```text
Partial Dependency
```

---

## 3NF Removes

```text
Transitive Dependency
```

---

# Summary

A table is in 3NF when:

1. It is already in 2NF.
2. Non-key columns depend directly on the primary key.
3. No transitive dependencies exist.
4. Department, Author, Branch, Category, and similar information are stored separately.

This is the normalization level used in most production PostgreSQL applications, SaaS products, ERP systems, banking software, and backend architectures.
