

# First Normal Form (1NF)

## What is 1NF?

### Definition

A table is in **First Normal Form (1NF)** if:

1. Every column contains atomic values.
2. No repeating groups exist.
3. Every row is uniquely identifiable.

---

## Simple Definition

```text
One Cell = One Value
```

If a cell contains:

```text
SQL, Python, DBMS
```

❌ Not 1NF

If a cell contains:

```text
SQL
```

✅ 1NF

---

# Why Was 1NF Introduced?

Before 1NF, databases often stored multiple values in a single column.

Example:

| Student_ID | Name  | Books             |
| ---------- | ----- | ----------------- |
| 1          | Rahul | SQL, Python, DBMS |

Problems:

* Difficult searching
* Difficult filtering
* Difficult joins
* Difficult updates

---

# Real World Analogy

Imagine a phone contact.

## Bad Design

| Name  | Phone Numbers  |
| ----- | -------------- |
| Rahul | 9999,8888,7777 |

Question:

```text
Find all users having phone number 8888
```

Very difficult.

---

## Good Design

| Name  | Phone |
| ----- | ----- |
| Rahul | 9999  |
| Rahul | 8888  |
| Rahul | 7777  |

Easy to search.

---

# Understanding Atomic Values

## Atomic Value Definition

An atomic value means:

```text
Cannot be divided further.
```

Examples:

### Good

| Name  |
| ----- |
| Rahul |

---

### Bad

| Books             |
| ----------------- |
| SQL, Python, DBMS |

Multiple values stored together.

---

# Repeating Groups

## Definition

When multiple values of the same type are stored in a row.

Example:

| Student_ID | Book1 | Book2  | Book3 |
| ---------- | ----- | ------ | ----- |
| 1          | SQL   | Python | DBMS  |

Problem:

Suppose student borrows Book4.

Need new column.

Bad design.

---

# UNF → 1NF

## UNF (Unnormalized Form)

| Student_ID | Name  | Books           |
| ---------- | ----- | --------------- |
| 1          | Rahul | SQL,Python,DBMS |

---

## Problem Analysis

### Problem 1

Multiple values in one cell.

```text
Books
```

contains:

```text
SQL
Python
DBMS
```

---

### Problem 2

Cannot easily query.

Example:

```sql
Find all students who borrowed SQL.
```

Difficult.

---

## Convert To 1NF

| Student_ID | Name  | Book   |
| ---------- | ----- | ------ |
| 1          | Rahul | SQL    |
| 1          | Rahul | Python |
| 1          | Rahul | DBMS   |

Now:

```text
Every cell contains one value.
```

---

# ER Diagram

## Before

```text
+----------------------+
| Library              |
+----------------------+
| Student_ID           |
| Name                 |
| Books                |
+----------------------+
```

---

## After

```text
+----------------------+
| Student_Books        |
+----------------------+
| Student_ID           |
| Name                 |
| Book                 |
+----------------------+
```

---

# PostgreSQL Implementation

## Create Table

```sql
CREATE TABLE student_books(
    student_id INT,
    student_name VARCHAR(100),
    book_name VARCHAR(100)
);
```

---

## Insert Data

```sql
INSERT INTO student_books
VALUES
(1,'Rahul','SQL'),
(1,'Rahul','Python'),
(1,'Rahul','DBMS');
```

---

## View Data

```sql
SELECT * FROM student_books;
```

Output:

| student_id | student_name | book_name |
| ---------- | ------------ | --------- |
| 1          | Rahul        | SQL       |
| 1          | Rahul        | Python    |
| 1          | Rahul        | DBMS      |

---

# Practical Queries

## Find Books Borrowed By Rahul

```sql
SELECT book_name
FROM student_books
WHERE student_name='Rahul';
```

---

## Find Students Who Borrowed SQL

```sql
SELECT student_name
FROM student_books
WHERE book_name='SQL';
```

Very easy because data is atomic.

---

# Problems Remaining After 1NF

Look carefully:

| Student_ID | Name  | Book   |
| ---------- | ----- | ------ |
| 1          | Rahul | SQL    |
| 1          | Rahul | Python |
| 1          | Rahul | DBMS   |

Student information repeats.

```text
Rahul
Rahul
Rahul
```

This is called:

## Data Redundancy

---

# Anomalies Still Exist

## Update Anomaly

Suppose:

```text
Rahul → Rahul Kumar
```

Need to update:

```text
Row 1
Row 2
Row 3
```

Miss one row.

Database becomes inconsistent.

---

## Delete Anomaly

Delete last borrowed book.

Student information may disappear.

---

## Insert Anomaly

Cannot add student without book.

---

# Why 1NF Is Not Enough

1NF only solves:

```text
Multiple values in one column
```

It does NOT solve:

```text
Redundancy
Update anomaly
Delete anomaly
Insert anomaly
```

Those are solved in:

```text
2NF
3NF
```

---

# Real Engineering Example

## Instagram

### Bad

| Post_ID | Tags             |
| ------- | ---------------- |
| 1       | SQL,DBMS,Backend |

Not 1NF.

---

### Good

| Post_ID | Tag     |
| ------- | ------- |
| 1       | SQL     |
| 1       | DBMS    |
| 1       | Backend |

Now tags can be searched individually.

---

# Interview Questions

## Beginner

### What is 1NF?

A table where every column contains atomic values.

---

### What is an atomic value?

A single indivisible value.

---

### What is a repeating group?

Multiple values stored in the same row or column group.

---

## Intermediate

### Does 1NF remove redundancy?

No.

1NF only removes repeating groups and multi-valued attributes.

---

### Can a table be in 1NF and still have anomalies?

Yes.

Update, delete, and insert anomalies may still exist.

---

# Common Mistakes

## Mistake 1

```text
Books = SQL,Python,DBMS
```

inside one column.

---

## Mistake 2

```text
Phone Numbers = 9999,8888,7777
```

inside one column.

---

## Mistake 3

Creating:

```text
Book1
Book2
Book3
Book4
```

columns.

---

# Memory Trick

```text
1NF
=
One Cell
One Value
```

or

```text
No Commas
No Arrays
No Repeating Groups
```

---

# Real Backend Engineering Usage

When designing PostgreSQL databases:

❌ Avoid

```text
skills = Python,SQL,FastAPI
```

✅ Use

```text
users
user_skills
skills
```

This makes searching, filtering, indexing, and joining efficient.

---

# Summary

1NF is the first step of normalization.

Its main goal is:

```text
One Cell = One Value
```

It removes:

* Repeating groups
* Multi-valued attributes

But it does not remove:

* Redundancy
* Update anomalies
* Delete anomalies
* Insert anomalies

These problems are solved in 2NF and 3NF.
