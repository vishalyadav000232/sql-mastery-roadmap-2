# Complete Notes of Constraints in DBMS

# What are Constraints?

Constraints are rules applied to table columns to control what type of data can be stored in the database.

They help maintain:

1. Data Accuracy
2. Data Consistency
3. Data Reliability
4. Data Integrity

Without constraints, invalid or duplicate data can enter the database.

---

# Real-Life Analogy

Imagine a college admission form:

| Field      | Rule                            |
| ---------- | ------------------------------- |
| Name       | Cannot be empty                 |
| Email      | Must be unique                  |
| Age        | Must be greater than 17         |
| Student ID | Automatically generated         |
| Course ID  | Must exist in the Courses table |

These rules are called **constraints** in DBMS.

---

# Why Constraints Are Important

Without constraints:

1. Duplicate data can enter
2. Wrong values can be stored
3. Relationships can break
4. Data becomes unreliable
5. Backend applications may fail

Constraints protect the database from invalid data.

---

# Types of Constraints

```text
NOT NULL                  ---> Prevent empty values
UNIQUE                    ---> Prevent duplicate values
PRIMARY KEY               ---> Unique identity for each row
FOREIGN KEY               ---> Connect tables
CHECK                     ---> Apply custom conditions
DEFAULT                   ---> Set default value
AUTO INCREMENT / SERIAL   ---> Automatic numbering
```

---

# 1. CHECK Constraint

The CHECK constraint is used to apply custom validation rules on columns.

It ensures that only valid data enters the database.

If the condition is TRUE:
→ Data is inserted

If the condition is FALSE:
→ Database throws an error

---

# Basic Syntax

```sql
CREATE TABLE table_name (
    column_name datatype CHECK(condition)
);
```

---

# Beginner Example

```sql
CREATE TABLE students (
    id INT,
    age INT CHECK(age >= 18)
);
```

---

# What This Means

```text
age >= 18
```

Only ages greater than or equal to 18 are allowed.

---

# Valid Insert

```sql
INSERT INTO students VALUES (1, 20);
```

✅ Inserted successfully

Because:

```text
20 >= 18 → TRUE
```

---

# Invalid Insert

```sql
INSERT INTO students VALUES (2, 15);
```

❌ Error generated

Because:

```text
15 >= 18 → FALSE
```

---

# Visual Understanding

| Age | Condition | Result     |
| --- | --------- | ---------- |
| 20  | 20 >= 18  | ✅ Allowed  |
| 25  | 25 >= 18  | ✅ Allowed  |
| 15  | 15 >= 18  | ❌ Rejected |

---

# Why CHECK Constraint Is Important

Without CHECK constraints, invalid data can enter the database.

Example:

| id | age  |
| -- | ---- |
| 1  | -100 |
| 2  | 9999 |

These values are logically incorrect.

CHECK constraints prevent such problems.

---

# Real-World Examples

## Salary Validation

```sql
CREATE TABLE employees (
    id INT,
    salary DECIMAL(10,2)
    CHECK(salary > 0)
);
```

Negative salary is not allowed.

---

## Rating System

```sql
CREATE TABLE reviews (
    id INT,
    rating INT CHECK(rating BETWEEN 1 AND 5)
);
```

Allowed values:

```text
1, 2, 3, 4, 5
```

Rejected values:

```text
0, 6, -1
```

---

## Gender Validation

```sql
CREATE TABLE users (
    id INT,
    gender VARCHAR(10)
    CHECK(gender IN ('Male', 'Female', 'Other'))
);
```

Only predefined values are allowed.

---

## Stock Quantity Validation

```sql
CREATE TABLE products (
    id INT,
    stock INT CHECK(stock >= 0)
);
```

Negative stock values are prevented.

---

# CHECK Constraint with Multiple Conditions

```sql
CREATE TABLE employees (
    age INT,
    salary INT,

    CHECK(age >= 18 AND salary > 10000)
);
```

Both conditions must be TRUE.

---

# CHECK Using BETWEEN

```sql
CHECK(age BETWEEN 18 AND 60)
```

Equivalent to:

```text
18 <= age <= 60
```

---

# CHECK Using IN

```sql
CHECK(status IN ('active', 'inactive'))
```

Only these values are accepted.

---

# Important Concept: NULL with CHECK

Very important concept.

Example:

```sql
CREATE TABLE students (
    age INT CHECK(age >= 18)
);
```

This may still allow:

```sql
INSERT INTO students VALUES (NULL);
```

Why?

Because:

```text
NULL >= 18 → UNKNOWN
```

NOT FALSE.

In many databases, UNKNOWN passes CHECK constraints.

---

# How to Prevent NULL Values

Use NOT NULL with CHECK:

```sql
CREATE TABLE students (
    age INT NOT NULL CHECK(age >= 18)
);
```

Now NULL values are also rejected.

---

# Naming CHECK Constraints

Best practice in industry projects.

```sql
CREATE TABLE employees (
    age INT,

    CONSTRAINT chk_age
    CHECK(age >= 18)
);
```

---

# Why Naming Constraints Is Important

Better debugging.

Instead of:

```text
CHECK constraint failed
```

You get:

```text
chk_age violated
```

Much easier to debug in production systems.

---

# CHECK Constraint in PostgreSQL

In PostgreSQL, CHECK constraints are validated during:

1. INSERT
2. UPDATE

Example:

```sql
UPDATE students
SET age = 10
WHERE id = 1;
```

❌ Rejected because the condition becomes FALSE.

---

# Difference Between CHECK and NOT NULL

| CHECK                | NOT NULL                  |
| -------------------- | ------------------------- |
| Applies custom rules | Prevents NULL values only |
| Can validate ranges  | Cannot validate ranges    |
| More flexible        | Less flexible             |

---

# Common Beginner Mistakes

## 1. Forgetting NOT NULL

```sql
age INT CHECK(age >= 18)
```

NULL may still enter.

Correct:

```sql
age INT NOT NULL CHECK(age >= 18)
```

---

## 2. Writing Impossible Conditions

```sql
CHECK(age > 18 AND age < 10)
```

Impossible condition.

---

## 3. Using Wrong Data Types

```sql
salary VARCHAR(20) CHECK(salary > 0)
```

Bad practice.

Use numeric data types for numeric validations.

---




# Real Backend Engineering Insight

In backend frameworks like:

* FastAPI
* Django
* Spring Boot

Data is often validated at:

1. Frontend
2. Backend
3. Database

CHECK constraint acts as the final protection layer.

Even if backend validation fails, the database still protects data integrity.

---

# Final Understanding

CHECK constraint is used to enforce business rules directly inside the database.

It ensures:

* valid values
* logical consistency
* safe backend operations
* clean production data

Without CHECK constraints, invalid business data can easily corrupt large systems.

