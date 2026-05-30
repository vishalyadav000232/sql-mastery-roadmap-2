# 2NF.md

# Second Normal Form (2NF)

## What is 2NF?

### Definition

A table is in **Second Normal Form (2NF)** if:

1. It is already in **1NF**.
2. It has **no partial dependency**.
3. Every non-key attribute depends on the **entire primary key**.

---

# Simple Definition

```text
2NF = Remove Partial Dependency
```

or

```text
Every column should depend on the whole primary key.
```

---

# Why Was 2NF Introduced?

1NF removes repeating groups.

However, data redundancy may still exist.

Example:

| Student_ID | Course_ID | Student_Name |
| ---------- | --------- | ------------ |
| 1          | 101       | Rahul        |
| 1          | 102       | Rahul        |
| 1          | 103       | Rahul        |

Notice:

```text
Rahul
Rahul
Rahul
```

repeats many times.

This creates:

* Data redundancy
* Update anomalies
* Delete anomalies
* Insert anomalies

2NF solves these problems.

---

# Understanding Composite Keys

## Definition

A primary key made from multiple columns.

Example:

```text
(Student_ID, Course_ID)
```

Together they uniquely identify a record.

---

## Example

| Student_ID | Course_ID |
| ---------- | --------- |
| 1          | 101       |
| 1          | 102       |
| 2          | 101       |

Neither column alone is unique.

Together they are unique.

Therefore:

```text
PRIMARY KEY(Student_ID, Course_ID)
```

is called a Composite Key.

---

# What is Partial Dependency?

## Definition

A non-key column depends on only part of a composite key.

---

## Example

Table:

| Student_ID | Course_ID | Student_Name |
| ---------- | --------- | ------------ |
| 1          | 101       | Rahul        |
| 1          | 102       | Rahul        |

Primary Key:

```text
(Student_ID, Course_ID)
```

Dependency:

```text
Student_ID → Student_Name
```

Student_Name depends only on Student_ID.

It does NOT depend on Course_ID.

This is called:

```text
Partial Dependency
```

---

# Real World Analogy

Imagine a college.

### Bad Design

| Student_ID | Course_ID | Student_Name |
| ---------- | --------- | ------------ |
| 1          | DBMS      | Rahul        |
| 1          | SQL       | Rahul        |
| 1          | Python    | Rahul        |

Student name repeats.

---

### Good Design

Store student information separately.

Store enrollment information separately.

Now data is clean.

---

# Problem Before 2NF

## Enrollment Table

| Student_ID | Course_ID | Student_Name | Course_Name |
| ---------- | --------- | ------------ | ----------- |
| 1          | 101       | Rahul        | DBMS        |
| 1          | 102       | Rahul        | SQL         |
| 2          | 101       | Aman         | DBMS        |

---

# Functional Dependencies

```text
Student_ID → Student_Name
Course_ID → Course_Name
```

But Primary Key is:

```text
(Student_ID, Course_ID)
```

Neither Student_Name nor Course_Name depend on the entire key.

Therefore:

❌ Not 2NF

---

# Problems in This Table

## Update Anomaly

Rahul changes his name.

Need to update:

```text
Row 1
Row 2
```

Miss one row:

Database becomes inconsistent.

---

## Delete Anomaly

Delete last enrollment.

Student information may disappear.

---

## Insert Anomaly

Cannot add a student until a course exists.

---

# Converting to 2NF

## Step 1

Identify composite key.

```text
(Student_ID, Course_ID)
```

---

## Step 2

Find partial dependencies.

```text
Student_ID → Student_Name
Course_ID → Course_Name
```

---

## Step 3

Move dependent columns into separate tables.

---

# Final 2NF Design

## Students

| Student_ID | Student_Name |
| ---------- | ------------ |
| 1          | Rahul        |
| 2          | Aman         |

---

## Courses

| Course_ID | Course_Name |
| --------- | ----------- |
| 101       | DBMS        |
| 102       | SQL         |

---

## Enrollments

| Student_ID | Course_ID |
| ---------- | --------- |
| 1          | 101       |
| 1          | 102       |
| 2          | 101       |

---

# ER Diagram

```text
+-----------+
| Students  |
+-----------+
| student_id|
| name      |
+-----------+
      |
      |
      |
      V

+--------------+
| Enrollments  |
+--------------+
| student_id FK|
| course_id FK |
+--------------+
      ^
      |
      |
+-----------+
| Courses   |
+-----------+
| course_id |
| name      |
+-----------+
```

---

# PostgreSQL Implementation

## Students Table

```sql
CREATE TABLE students(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);
```

---

## Courses Table

```sql
CREATE TABLE courses(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);
```

---

## Enrollments Table

```sql
CREATE TABLE enrollments(

    student_id INT,
    course_id INT,

    PRIMARY KEY(student_id, course_id),

    FOREIGN KEY(student_id)
    REFERENCES students(student_id),

    FOREIGN KEY(course_id)
    REFERENCES courses(course_id)
);
```

---

# Sample Data

## Students

```sql
INSERT INTO students
VALUES
(1,'Rahul'),
(2,'Aman');
```

---

## Courses

```sql
INSERT INTO courses
VALUES
(101,'DBMS'),
(102,'SQL');
```

---

## Enrollments

```sql
INSERT INTO enrollments
VALUES
(1,101),
(1,102),
(2,101);
```

---

# Query Examples

## Show Students and Courses

```sql
SELECT
    s.student_name,
    c.course_name
FROM enrollments e
JOIN students s
ON e.student_id = s.student_id
JOIN courses c
ON e.course_id = c.course_id;
```

---

## Output

| Student | Course |
| ------- | ------ |
| Rahul   | DBMS   |
| Rahul   | SQL    |
| Aman    | DBMS   |

---

# Performance Benefits

## Advantages

### Reduced Redundancy

Student names stored once.

---

### Better Consistency

Single update point.

---

### Less Storage

Repeated values removed.

---

### Easier Maintenance

Cleaner schema.

---

# Drawbacks

More tables.

More JOIN operations.

Slightly more complex queries.

---

# Real Engineering Usage

## Learning Platforms

```text
Students
Courses
Enrollments
```

Examples:

* Udemy
* Coursera
* Skillshare

---

## E-Commerce

```text
Orders
Products
Order_Items
```

Order items often use composite keys.

---

## ERP Systems

```text
Employees
Projects
Assignments
```

Assignments use composite keys.

---

## Library Systems

```text
Students
Books
Borrowed_Books
```

Borrowing records often use composite keys.

---

# Interview Questions

## Beginner

### What is 2NF?

A table in 1NF with no partial dependency.

---

### What is a Composite Key?

A primary key made from multiple columns.

---

### What is Partial Dependency?

When a column depends on only part of a composite key.

---

## Intermediate

### Can a table without a composite key violate 2NF?

No.

2NF problems occur only when composite keys exist.

---

### Does 2NF remove transitive dependency?

No.

That is handled by 3NF.

---

## Advanced

### Why is 2NF important?

It reduces redundancy caused by composite keys and improves consistency.

---

### How do you identify 2NF violations?

Find non-key attributes that depend on only part of a composite key.

---

# Common Mistakes

## Mistake 1

Thinking 2NF applies to single-column primary keys.

It does not.

---

## Mistake 2

Confusing Partial Dependency with Transitive Dependency.

```text
Partial Dependency → 2NF

Transitive Dependency → 3NF
```

---

## Mistake 3

Keeping Student_Name inside Enrollment table.

This creates redundancy.

---

# Memory Trick

```text
1NF
=
One Cell One Value

2NF
=
Depend On Whole Key
```

---

# Quick Revision

## 1NF

Removes:

```text
Repeating Groups
Multi-valued Attributes
```

---

## 2NF

Removes:

```text
Partial Dependency
```

---

## Goal of 2NF

```text
Every non-key column
must depend on the entire primary key.
```

---

# Summary

2NF is achieved when:

1. The table is already in 1NF.
2. Composite key dependencies are analyzed.
3. Partial dependencies are removed.
4. Data redundancy is reduced.
5. Student, Course, Product, Order, or Employee information is stored only once.

This creates cleaner, more maintainable, and production-ready database designs.
