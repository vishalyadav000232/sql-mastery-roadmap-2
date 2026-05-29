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


# 2 . DEFAULT Constraint in DBMS (Complete Notes)

# What is DEFAULT Constraint?

The DEFAULT constraint is used to assign a default value to a column automatically when no value is provided during insertion.

It helps prevent NULL values and makes database records more consistent.

---

# Simple Definition

If the user does not provide a value,
the database automatically inserts the default value.

---

# Why DEFAULT Constraint Is Important

Without DEFAULT:

| id | status |
| -- | ------ |
| 1  | NULL   |

Sometimes NULL values create problems in backend systems.

DEFAULT constraint solves this problem.

---

# Real-Life Analogy

Imagine creating a new social media account.

When a new user signs up:

| Field              | Automatic Value |
| ------------------ | --------------- |
| Account Status     | active          |
| Country            | India           |
| Role               | user            |
| Profile Visibility | public          |

These automatic values work like DEFAULT constraints.

---

# Basic Syntax

```sql id="q9kwlt"
CREATE TABLE table_name (
    column_name datatype DEFAULT value
);
```

---

# Beginner Example

```sql id="t3v4zj"
CREATE TABLE users (
    id SERIAL PRIMARY KEY,

    name VARCHAR(100),

    country VARCHAR(50)
    DEFAULT 'India'
);
```

---

# What This Means

If no country is provided:

```text id="v7p6xq"
India
```

will automatically be inserted.

---

# Insert Without Country

```sql id="h4m4xv"
INSERT INTO users(name)
VALUES ('Vishal');
```

---

# Result

| id | name   | country |
| -- | ------ | ------- |
| 1  | Vishal | India   |

---

# Insert With Country

```sql id="fgj4ap"
INSERT INTO users(name, country)
VALUES ('Rahul', 'USA');
```

---

# Result

| id | name  | country |
| -- | ----- | ------- |
| 2  | Rahul | USA     |

---

# Important Concept

DEFAULT value is used ONLY when:

```text id="d8n5gq"
No value is provided
```

---

# Visual Understanding

| Insert Query      | Result          |
| ----------------- | --------------- |
| No value provided | DEFAULT used    |
| Value provided    | User value used |

---

# DEFAULT with Numbers

```sql id="h5w4oi"
CREATE TABLE products (
    id SERIAL PRIMARY KEY,

    stock INT DEFAULT 0
);
```

---

# Why?

When a new product is created:

```text id="5s93zr"
stock = 0
```

automatically.

---

# DEFAULT with Boolean

```sql id="4yik9l"
CREATE TABLE users (
    id SERIAL PRIMARY KEY,

    is_active BOOLEAN DEFAULT TRUE
);
```

---

# Meaning

New users automatically become active.

---

# DEFAULT with Dates

In PostgreSQL:

```sql id="d9gj8f"
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,

    created_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP
);
```

---

# What Happens?

The current date and time are automatically stored.

---

# Real Backend Example

```sql id="4rln6n"
CREATE TABLE accounts (

    id SERIAL PRIMARY KEY,

    username VARCHAR(50),

    role VARCHAR(20)
    DEFAULT 'user',

    status VARCHAR(20)
    DEFAULT 'active'
);
```

---

# Why This Is Useful

When a new account is created:

```text id="o0qj0n"
role = user
status = active
```

automatically.

Backend developers use this everywhere.

---

# DEFAULT + NOT NULL

Very common combination.

```sql id="r6k9wn"
status VARCHAR(20)
NOT NULL
DEFAULT 'pending'
```

---

# Why?

This ensures:

1. NULL cannot enter
2. A default value always exists

---

# Real Industry Usage

DEFAULT constraints are used in:

| Column         | Default Value     |
| -------------- | ----------------- |
| account_status | active            |
| stock          | 0                 |
| created_at     | current timestamp |
| role           | user              |
| payment_status | pending           |
| login_attempts | 0                 |

---

# DEFAULT with ALTER TABLE

You can add DEFAULT later.

```sql id="r3o1jp"
ALTER TABLE users
ALTER COLUMN country
SET DEFAULT 'India';
```

---

# Remove DEFAULT Constraint

```sql id="a7m3si"
ALTER TABLE users
ALTER COLUMN country
DROP DEFAULT;
```

---

# Important PostgreSQL Behavior

DEFAULT works during:

```text id="l7v2bw"
INSERT
```

only.

It does NOT automatically update old rows.

---

# Example

Suppose:

| id | country |
| -- | ------- |
| 1  | NULL    |

Now you add:

```sql id="m0z4fe"
DEFAULT 'India'
```

Old NULL rows remain NULL.

Only new inserts get the default value.

---

# DEFAULT vs NULL

| DEFAULT              | NULL                    |
| -------------------- | ----------------------- |
| Automatic value      | No value                |
| Improves consistency | Can create missing data |
| Used during INSERT   | Represents unknown data |

---

# DEFAULT vs CHECK

| DEFAULT             | CHECK           |
| ------------------- | --------------- |
| Provides value      | Validates value |
| Automatic insertion | Validation rule |

---

# DEFAULT + CHECK Example

```sql id="22s1wj"
CREATE TABLE employees (

    id SERIAL PRIMARY KEY,

    age INT
    DEFAULT 18

    CHECK(age >= 18)
);
```

---

# What Happens?

If age is not provided:

```text id="ewy8mq"
18
```

is inserted automatically.

CHECK constraint then validates it.

---

# Common Beginner Mistakes

## 1. Thinking DEFAULT Updates Existing Rows

Wrong.

DEFAULT only affects new INSERT operations.

---

## 2. Forgetting NOT NULL

```sql id="fptw9n"
status VARCHAR(20) DEFAULT 'active'
```

NULL can still be inserted manually.

---

# Correct Version

```sql id="56b14g"
status VARCHAR(20)
NOT NULL
DEFAULT 'active'
```

---

## 3. Using Wrong Data Types

```sql id="g7mdwt"
age INT DEFAULT 'hello'
```

Invalid default value.

---

# Complete Example

```sql id="iw8t1x"
CREATE TABLE orders (

    id SERIAL PRIMARY KEY,

    customer_name VARCHAR(100) NOT NULL,

    amount DECIMAL(10,2)
    DEFAULT 0.00,

    status VARCHAR(20)
    NOT NULL
    DEFAULT 'PENDING',

    created_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP
);
```

---

# Valid Insert

```sql id="v0sm3x"
INSERT INTO orders(customer_name)
VALUES ('Vishal');
```

---

# Result

| amount | status  | created_at   |
| ------ | ------- | ------------ |
| 0.00   | PENDING | Current Time |

Automatically inserted.

---

# Backend Engineering Insight

In backend systems using:

* PostgreSQL
* MySQL
* FastAPI
* Django
* Spring Boot

DEFAULT constraints reduce backend complexity.

Instead of manually assigning values in backend code,
the database handles it automatically.

---

# Interview Questions

## Basic

1. What is DEFAULT constraint?
2. Why do we use DEFAULT?
3. When is DEFAULT applied?

---

## Intermediate

1. Difference between DEFAULT and NULL?
2. Can DEFAULT work with NOT NULL?
3. Does DEFAULT update existing rows?

---

## Advanced

1. How does PostgreSQL internally apply DEFAULT values?
2. Difference between DEFAULT CURRENT_TIMESTAMP and NOW()?
3. Why are DEFAULT constraints useful in backend systems?

---

# Final Understanding

DEFAULT constraint automatically inserts predefined values when no value is provided.

It helps:

* reduce NULL values
* improve consistency
* simplify backend logic
* maintain cleaner databases

DEFAULT constraints are heavily used in real-world backend systems and production databases.
