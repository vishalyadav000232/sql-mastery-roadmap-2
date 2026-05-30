# BCNF.md

# Boyce-Codd Normal Form (BCNF)

## What is BCNF?

### Definition

BCNF (Boyce-Codd Normal Form) is an advanced version of 3NF.

A table is in BCNF if:

1. It is already in 3NF.
2. For every Functional Dependency:

   A → B

   A must be a Candidate Key.

---

# Simple Definition

```text
BCNF =
Every Determinant
Must Be A Candidate Key
```

---

# Why Was BCNF Introduced?

3NF removes most redundancy.

However, some special cases still create anomalies.

BCNF solves those remaining anomalies.

Think:

```text
1NF → Remove Repeating Groups

2NF → Remove Partial Dependency

3NF → Remove Transitive Dependency

BCNF → Remove Remaining Dependency Problems
```

---

# Important Terms

Before BCNF, understand:

## Candidate Key

### Definition

A Candidate Key is the smallest set of columns that can uniquely identify a row.

Example:

| Student_ID | Email |
|------------|--------|
| 1 | rahul@gmail.com |

Possible Candidate Keys:

```text
Student_ID
Email
```

Both uniquely identify a row.

---

## Determinant

### Definition

A determinant is the left side of a functional dependency.

Example:

```text
Student_ID → Student_Name
```

Determinant:

```text
Student_ID
```

Because it determines Student_Name.

---

## Functional Dependency Revision

Example:

| Employee_ID | Employee_Name |
|-------------|---------------|
| 1           | Rahul         |

Dependency:

```text
Employee_ID → Employee_Name
```

Meaning:

Knowing Employee_ID allows us to determine Employee_Name.

---

# Real BCNF Problem

This is the most famous BCNF example.

## Course Allocation System

| Student | Course | Instructor |
|----------|---------|------------|
| Rahul    | DBMS | Amit |
| Aman     | DBMS    | Amit |
| Rahul    | SQL     | Neha |

### Business Rules

```text
One Course
Has One Instructor
```

Meaning:

```text
Course → Instructor
```

---

# Candidate Key Analysis

Can Student alone identify a row?

❌ No

Can Course alone identify a row?

❌ No

Can Instructor alone identify a row?

❌ No

Candidate Key:

```text
(Student, Course)
```

---

# Functional Dependencies

### Dependency 1

```text
(Student, Course)
      ↓
Instructor
```

Valid.

---

### Dependency 2

```text
Course
   ↓
Instructor
```

Also valid.

---

# Problem

Look carefully.

Determinant:

```text
Course
```

Is Course a Candidate Key?

❌ No

Therefore:

```text
Course → Instructor
```

Violates BCNF.

---

# Why Is This Bad?

Suppose:

```text
DBMS Instructor changes.
```

Need to update:

| Student | Course | Instructor |
|----------|---------|------------|
| Rahul | DBMS | Amit |
| Aman | DBMS | Amit |

Multiple rows.

Redundancy exists.

---

# Converting To BCNF

Split the table.

---

# Table 1 : Courses

| Course | Instructor |
|---------|------------|
| DBMS | Amit |
| SQL | Neha |

---

# Table 2 : Student_Courses

| Student | Course |
|----------|--------|
| Rahul | DBMS |
| Aman | DBMS |
| Rahul | SQL |

---

# ER Diagram

```text
+------------+
| Students   |
+------------+
| student_id |
| name       |
+------------+
       |
       |
       |
       V

+------------------+
| Student_Courses  |
+------------------+
| student_id FK    |
| course_id FK     |
+------------------+
       ^
       |
       |
+------------+
| Courses    |
+------------+
| course_id  |
| instructor |
+------------+
```

---

# PostgreSQL Implementation

## Students Table

```sql
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100)
);
```

---

## Courses Table

```sql
CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    instructor_name VARCHAR(100)
);
```

---

## Student Courses Table

```sql
CREATE TABLE student_courses(

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
INSERT INTO students(student_name)
VALUES
('Rahul'),
('Aman');
```

---

## Courses

```sql
INSERT INTO courses(course_name,instructor_name)
VALUES
('DBMS','Amit'),
('SQL','Neha');
```

---

## Student Courses

```sql
INSERT INTO student_courses
VALUES
(1,1),
(2,1),
(1,2);
```

---

# Query Example

## Show Student, Course and Instructor

```sql
SELECT
    s.student_name,
    c.course_name,
    c.instructor_name
FROM student_courses sc
JOIN students s
ON sc.student_id = s.student_id
JOIN courses c
ON sc.course_id = c.course_id;
```

---

# Output

| Student | Course | Instructor |
|----------|---------|-----------|
| Rahul | DBMS | Amit |
| Aman | DBMS | Amit |
| Rahul | SQL | Neha |

---

# 3NF vs BCNF

| Feature | 3NF | BCNF |
|----------|------|------|
| Removes Partial Dependency | ✅ | ✅ |
| Removes Transitive Dependency | ✅ | ✅ |
| Removes All Dependency Anomalies | ❌ | ✅ |
| Stricter Rule | ❌ | ✅ |
| Production Usage | Common | Less Common |

---

# Easy Difference

## 3NF Rule

```text
Non-Key Attributes
Must Depend On Key
```

---

## BCNF Rule

```text
Every Determinant
Must Be Candidate Key
```

BCNF is stricter.

---

# Real Engineering Usage

## University Systems

```text
Students
Courses
Professors
Assignments
```

---

## Airline Systems

```text
Flights
Pilots
Aircraft
```

---

## ERP Systems

```text
Employees
Projects
Managers
```

---

## Hospital Systems

```text
Doctors
Departments
Specializations
```

---

# Performance Impact

## Benefits

### Less Redundancy

Data stored once.

### Better Consistency

Single update point.

### Cleaner Relationships

Dependency anomalies removed.

---

## Drawbacks

### More Tables

Database becomes larger structurally.

### More JOINs

Queries become more complex.

### Sometimes Overkill

Many systems stop at 3NF.

---

# Interview Questions

## Beginner

### What is BCNF?

A stronger version of 3NF.

---

### What is a Determinant?

The left side of a functional dependency.

---

### What is a Candidate Key?

A minimal set of attributes that uniquely identifies a row.

---

## Intermediate

### Difference Between 3NF and BCNF?

BCNF requires every determinant to be a candidate key.

3NF does not.

---

### Is Every BCNF Table Also In 3NF?

✅ Yes

---

### Is Every 3NF Table In BCNF?

❌ No

---

## Advanced

### Why Was BCNF Created?

To remove dependency anomalies not handled by 3NF.

---

### When Do We Usually Use BCNF?

When complex business rules create multiple candidate keys and hidden dependencies.

---

# Common Mistakes

## Mistake 1

Thinking BCNF and 3NF are identical.

They are not.

---

## Mistake 2

Ignoring Candidate Keys.

BCNF revolves around candidate keys.

---

## Mistake 3

Not identifying determinants properly.

Always find:

```text
A → B
```

Then ask:

```text
Is A a Candidate Key?
```

---

# Memory Trick

```text
1NF
=
One Value

2NF
=
Whole Key

3NF
=
Only Key

BCNF
=
Every Determinant Is A Key
```

---

# Quick Revision

## 1NF

```text
Remove Repeating Groups
```

---

## 2NF

```text
Remove Partial Dependency
```

---

## 3NF

```text
Remove Transitive Dependency
```

---

## BCNF

```text
Every Determinant
Must Be A Candidate Key
```

---

# Summary

BCNF is an advanced normalization form that eliminates dependency anomalies left behind by 3NF.

Rule:

```text
For Every Functional Dependency

A → B

A Must Be A Candidate Key
```

BCNF is commonly discussed in technical interviews and advanced database design, but many production systems are already well-designed at 3NF.