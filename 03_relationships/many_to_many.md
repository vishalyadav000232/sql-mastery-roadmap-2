
# Many-to-Many Relationship in DBMS

---

# What is Many-to-Many Relationship?

A many-to-many relationship means:

```text
One row from Table A
can be connected to many rows in Table B

AND

One row from Table B
can also be connected to many rows in Table A
```

---

# Real-World Example

## Students and Courses

* One student can enroll in many courses
* One course can have many students

So this becomes:

```text
Students  ↔  Courses
```

This is called:

# Many-to-Many (M:N)

---

# Visual Understanding

```text
Rahul → DBMS
Rahul → Python
Rahul → Java

Aman → DBMS
Aman → Web Development
```

Here:

* Rahul joined many courses
* DBMS has many students

So relationship is many-to-many.

---

# Problem in Direct Relationship

If we directly connect both tables:

```text
students
courses
```

Then database design becomes messy.

Because:

* Duplicate data increases
* Relationships become hard to manage
* Scalability issues occur

So DBMS uses a special table.

---

# Solution → Junction Table

A third table is created.

This table is called:

* Junction Table
* Mapping Table
* Bridge Table
* Associative Table

---

# Structure

```text
STUDENTS
-----------
student_id
student_name

COURSES
-----------
course_id
course_name

ENROLLMENTS
-----------
student_id
course_id
```

`ENROLLMENTS` table connects both tables.

---

# SQL Example

## Step 1 → Create Students Table

```sql
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);
```

---

## Step 2 → Create Courses Table

```sql
CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);
```

---

## Step 3 → Create Junction Table

```sql
CREATE TABLE enrollments(

    student_id INT,
    course_id INT,

    PRIMARY KEY(student_id, course_id),

    CONSTRAINT fk_student
    FOREIGN KEY(student_id)
    REFERENCES students(student_id)
    ON DELETE CASCADE,

    CONSTRAINT fk_course
    FOREIGN KEY(course_id)
    REFERENCES courses(course_id)
    ON DELETE CASCADE
);
```

---

# Why Composite Primary Key?

```sql
PRIMARY KEY(student_id, course_id)
```

This prevents duplicate enrollments.

Example:

❌ Wrong

```text
Rahul → DBMS
Rahul → DBMS
```

Same course should not repeat.

Composite key solves this problem.

---

# Insert Data Example

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
INSERT INTO courses(course_name)
VALUES
('DBMS'),
('Python'),
('Java');
```

---

## Enrollments

```sql
INSERT INTO enrollments(student_id, course_id)
VALUES
(1,1),
(1,2),
(1,3),
(2,1);
```

---

# Result

```text
Rahul → DBMS
Rahul → Python
Rahul → Java

Aman → DBMS
```

---

# How to Fetch Many-to-Many Data

We use:

# JOIN

---

# Query Example

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

# Output

```text
Rahul → DBMS
Rahul → Python
Rahul → Java
Aman → DBMS
```

---

# Real-World Examples

| Example            | Relationship |
| ------------------ | ------------ |
| Students ↔ Courses | Many-to-Many |
| Actors ↔ Movies    | Many-to-Many |
| Users ↔ Roles      | Many-to-Many |
| Products ↔ Orders  | Many-to-Many |
| Doctors ↔ Patients | Many-to-Many |

---

# Why Many-to-Many is Important?

Used heavily in:

* Backend Development
* Social Media Apps
* E-commerce
* Banking Systems
* ERP Systems
* Learning Platforms

---

# Industry-Level Example

## E-Commerce

```text
Orders ↔ Products
```

One order can contain many products.

One product can appear in many orders.

So:

```text
orders
products
order_items
```

`order_items` becomes junction table.

---

# Advanced Junction Table

Sometimes junction table stores extra data.

Example:

```sql
CREATE TABLE enrollments(

    student_id INT,
    course_id INT,

    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    status VARCHAR(50),

    PRIMARY KEY(student_id, course_id),

    FOREIGN KEY(student_id)
    REFERENCES students(student_id),

    FOREIGN KEY(course_id)
    REFERENCES courses(course_id)
);
```

---

# Why Extra Columns?

Because relationship itself may contain information.

Example:

* enrollment date
* payment status
* progress
* grades

---

# Important Concepts

| Concept               | Meaning                         |
| --------------------- | ------------------------------- |
| Junction Table        | Connects two tables             |
| Composite Key         | Multiple columns as PK          |
| Foreign Key           | Maintains relationship          |
| Referential Integrity | Keeps valid data                |
| Cascading             | Automatic relationship handling |

---

# Common Beginner Mistakes

## 1. Forgetting Composite Primary Key

Without this:

```sql
PRIMARY KEY(student_id, course_id)
```

Duplicate relationships can occur.

---

## 2. Not Using Foreign Keys

Without foreign keys:

* Invalid data can enter
* Relationships break

---

## 3. Storing Multiple Values in One Column

❌ Wrong

```text
courses = 'DBMS, Python, Java'
```

This breaks normalization.

Always use separate tables.

---

# Interview Questions

## Q1: What is Many-to-Many Relationship?

### Answer

A relationship where:

* One row from first table relates to many rows of second table
* One row from second table also relates to many rows of first table

---

## Q2: Why use Junction Table?

### Answer

Because relational databases cannot directly implement many-to-many relationships efficiently.

Junction table manages relationships properly.

---

## Q3: Why Composite Primary Key is Used?

### Answer

To prevent duplicate relationships and uniquely identify each mapping.

---

# Final Summary

Many-to-many relationship is implemented using:

* Two main tables
* One junction table

Key concepts:

* Foreign Keys
* Composite Primary Key
* JOINS
* Referential Integrity
* Cascading

This concept is one of the most important topics in:

* DBMS
* PostgreSQL
* Backend Development
* System Design
* Real-world Database Engineering
