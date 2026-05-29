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


## 3.  Foreign Key (FK) Notes

---

# What is a Foreign Key?

A Foreign Key is a constraint used to create a relationship between two tables.

It ensures that:

> Values in one table must exist in another table.

---

# Why Do We Use Foreign Keys?

* Maintain data consistency
* Prevent invalid data
* Connect related tables
* Maintain referential integrity
* Reduce backend bugs

---

# Real-World Example

## Students Table

| student_id | name   |
| ---------- | ------ |
| 1          | Vishal |
| 2          | Rahul  |

---

## Enrollments Table

| enrollment_id | student_id | course |
| ------------- | ---------- | ------ |
| 101           | 1          | DBMS   |
| 102           | 2          | AI     |

Here:

* `student_id` in `enrollments`
* references `student_id` in `students`

---

# Visual Understanding

```text
students
+------------+---------+
| student_id | name    |
+------------+---------+
| 1          | Vishal  |
| 2          | Rahul   |
+------------+---------+

        ↑
        │
   Foreign Key
        │

enrollments
+---------------+------------+--------+
| enrollment_id | student_id | course |
+---------------+------------+--------+
| 101           | 1          | DBMS   |
| 102           | 2          | AI     |
+---------------+------------+--------+
```

---

# Referential Integrity

Referential Integrity means:

> Relationships between tables remain valid and consistent.

---

# Foreign Key Syntax

## CREATE TABLE Example

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course VARCHAR(100),

    CONSTRAINT fk_student
    FOREIGN KEY(student_id)
    REFERENCES students(student_id)
);
```

---

# Syntax Breakdown

## FOREIGN KEY(student_id)

Specifies:

* `student_id` is a foreign key

---

## REFERENCES students(student_id)

Means:

* value must exist in `students` table

---

# How Foreign Key Works

When inserting data:

```sql
INSERT INTO enrollments
VALUES(101, 1, 'DBMS');
```

PostgreSQL checks:

* Does `student_id = 1` exist?

If yes:

* Insert successful

If no:

* Error occurs

---

# Invalid Insert Example

```sql
INSERT INTO enrollments
VALUES(102, 500, 'AI');
```

Error because:

* student `500` does not exist

---

# Parent Table vs Child Table

| Table Type   | Meaning              |
| ------------ | -------------------- |
| Parent Table | Referenced table     |
| Child Table  | Contains foreign key |

---

# Example

| Table       | Role   |
| ----------- | ------ |
| students    | Parent |
| enrollments | Child  |

---

# Important Rules

## Rule 1

Parent value must exist.

---

## Rule 2

Datatypes must match.

✅ Correct:

```text
INT → INT
UUID → UUID
```

❌ Wrong:

```text
INT → VARCHAR
```

---

## Rule 3

Referenced column must be:

* PRIMARY KEY
  OR
* UNIQUE

---

# Types of Relationships

---

# 1. One-to-Many

Example:

```text
One student → Many enrollments
```

---

# 2. One-to-One

Example:

```text
One user → One passport
```

---

# 3. Many-to-Many

Example:

```text
Many students ↔ Many courses
```

Solved using:

* junction table

Example:

```text
student_courses
```

---

# Adding Foreign Key Using ALTER TABLE

```sql
ALTER TABLE enrollments
ADD CONSTRAINT fk_student
FOREIGN KEY(student_id)
REFERENCES students(student_id);
```

---

# DELETE Problem

Suppose:

* child rows depend on parent row

If parent deleted:

```sql
DELETE FROM students
WHERE student_id = 1;
```

PostgreSQL blocks deletion.

---

# ON DELETE Actions

---

# 1. ON DELETE CASCADE

Deletes child rows automatically.

```sql
FOREIGN KEY(student_id)
REFERENCES students(student_id)
ON DELETE CASCADE
```

---

# 2. ON DELETE SET NULL

Sets child foreign key to NULL.

```sql
ON DELETE SET NULL
```

---

# 3. ON DELETE RESTRICT

Prevents deletion.

(Default behavior)

---

# 4. ON DELETE SET DEFAULT

Sets child foreign key to default value.

---

# Real-World Examples

## E-Commerce

```text
users → orders
```

---

## Banking

```text
customers → accounts
accounts → transactions
```

---

# Backend Importance

Foreign keys:

* maintain integrity
* reduce bugs
* protect relationships
* improve consistency
* enforce business rules

---

# Common Beginner Mistakes

## Mistake 1

Referencing non-unique column.

❌ Wrong:

```sql
REFERENCES students(name)
```

unless `name` is UNIQUE.

---

## Mistake 2

Datatype mismatch.

❌ Wrong:

```text
INT → VARCHAR
```

---

## Mistake 3

Ignoring delete behavior.

---

# PRIMARY KEY vs FOREIGN KEY

| PRIMARY KEY             | FOREIGN KEY              |
| ----------------------- | ------------------------ |
| Uniquely identifies row | References another table |
| Cannot repeat           | Can repeat               |
| Cannot be NULL          | Can be NULL              |
| One per table           | Multiple allowed         |

---

# Complete Example

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course VARCHAR(100),

    CONSTRAINT fk_student
    FOREIGN KEY(student_id)
    REFERENCES students(student_id)
    ON DELETE CASCADE
);
```

---

# Testing

## Insert Parent Data

```sql
INSERT INTO students
VALUES(1, 'Vishal');
```

---

## Valid Insert

```sql
INSERT INTO enrollments
VALUES(101, 1, 'DBMS');
```

✅ Success

---

## Invalid Insert

```sql
INSERT INTO enrollments
VALUES(102, 500, 'AI');
```

❌ Error

---

# Interview Questions

## Basic

### What is a Foreign Key?

A foreign key is a constraint used to create relationships between tables and maintain referential integrity.

---

## Intermediate

### What is Referential Integrity?

Ensuring relationships between tables remain valid.

---

### Difference Between PRIMARY KEY and FOREIGN KEY?

Already discussed above.

---

## Advanced

### Difference Between CASCADE and RESTRICT?

| CASCADE                          | RESTRICT          |
| -------------------------------- | ----------------- |
| Deletes child rows automatically | Prevents deletion |

---

### Why Are Foreign Keys Important?

Because they:

* protect relationships
* prevent invalid data
* improve consistency
* enforce rules

---

# Final Revision

| Concept               | Meaning                |
| --------------------- | ---------------------- |
| Foreign Key           | Creates relationship   |
| Parent Table          | Referenced table       |
| Child Table           | Contains FK            |
| Referential Integrity | Valid relationships    |
| CASCADE               | Auto delete child rows |
| RESTRICT              | Prevent delete         |

---

# Final Definition

A Foreign Key is a database constraint that establishes relationships between tables and ensures referential integrity by allowing only valid references.




# NOT NULL Constraint — Complete Notes

---

# What is NOT NULL Constraint?

The `NOT NULL` constraint ensures that a column cannot contain `NULL` values.

It means:

> Every row must have a value in that column.

---

# Simple Definition

NOT NULL prevents empty values in a column.

---

# Syntax

```sql
column_name datatype NOT NULL
```

---

# Basic Example

```sql
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);
```

Here:

* `name` cannot be NULL
* `email` cannot be NULL

---

# Visual Understanding

```text
users table

+----+--------+------------------+
| id | name   | email            |
+----+--------+------------------+
| 1  | Vishal | v@gmail.com      |
| 2  | Rahul  | r@gmail.com      |
+----+--------+------------------+
```

---

# Invalid Insert Example

```sql
INSERT INTO users(name)
VALUES(NULL);
```

❌ Error

Because:

* `name` has NOT NULL constraint

---

# PostgreSQL Error

```text
ERROR:
null value in column "name"
violates not-null constraint
```

---

# Why Do We Use NOT NULL?

NOT NULL is used to ensure important data is always present.

---

# Real-World Examples

| Column     | Why NOT NULL?           |
| ---------- | ----------------------- |
| username   | User must have name     |
| email      | Required for login      |
| password   | Authentication required |
| order_date | Order must have date    |
| amount     | Payment amount required |

---

# Difference Between NULL and Empty String

Very important interview concept.

---

# NULL

Means:

> No value / unknown value

---

# Empty String

```sql
''
```

Means:

> Value exists but empty

---

# Example

```sql
INSERT INTO users(name)
VALUES('');
```

✅ Allowed

Because:

* empty string is NOT NULL

---

# Visual Difference

| Value | Meaning    |
| ----- | ---------- |
| NULL  | No value   |
| ''    | Empty text |

---

# How NOT NULL Works Internally

When inserting data:

```sql
INSERT INTO users(name)
VALUES(NULL);
```

PostgreSQL internally:

1. Reads schema
2. Checks NOT NULL constraint
3. Finds NULL value
4. Rejects insert

---

# Internal Flow

```text
INSERT Request
      ↓
Check NOT NULL Constraint
      ↓
Value NULL?
   /      \
 YES       NO
 ↓          ↓
ERROR     INSERT
```

---

# NOT NULL During CREATE TABLE

```sql
CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    salary NUMERIC(10,2) NOT NULL
);
```

---

# Adding NOT NULL Using ALTER TABLE

If table already exists:

```sql
ALTER TABLE employees
ALTER COLUMN employee_name
SET NOT NULL;
```

---

# Removing NOT NULL Constraint

```sql
ALTER TABLE employees
ALTER COLUMN employee_name
DROP NOT NULL;
```

---

# Important Problem While Adding NOT NULL

Suppose existing rows already contain NULL values.

Example:

| employee_name |
| ------------- |
| Vishal        |
| NULL          |

Now:

```sql
ALTER TABLE employees
ALTER COLUMN employee_name
SET NOT NULL;
```

❌ Error

Because:

* old rows violate constraint

---

# Solution

First update NULL values:

```sql
UPDATE employees
SET employee_name = 'Unknown'
WHERE employee_name IS NULL;
```

Then apply:

```sql
ALTER TABLE employees
ALTER COLUMN employee_name
SET NOT NULL;
```

---

# NOT NULL with DEFAULT

Very common industry practice.

---

# Example

```sql
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    status VARCHAR(20) NOT NULL DEFAULT 'active'
);
```

---

# What Happens?

If user does not provide status:

```sql
INSERT INTO users DEFAULT VALUES;
```

PostgreSQL automatically inserts:

```text
status = active
```

---

# Why This Is Powerful

Combination of:

* NOT NULL
* DEFAULT

ensures:

* column always has valid value

---

# NOT NULL vs CHECK Constraint

| NOT NULL          | CHECK               |
| ----------------- | ------------------- |
| Prevents NULL     | Validates condition |
| Simple validation | Complex validation  |

---

# Example

## NOT NULL

```sql
name VARCHAR(100) NOT NULL
```

---

## CHECK

```sql
age INT CHECK(age >= 18)
```

---

# NOT NULL vs PRIMARY KEY

Important interview topic.

---

# PRIMARY KEY

Automatically includes:

* NOT NULL
* UNIQUE

---

# Example

```sql
id SERIAL PRIMARY KEY
```

Equivalent to:

```sql
id SERIAL NOT NULL UNIQUE
```

---

# Real-World Backend Examples

---

# E-Commerce

```sql
product_name NOT NULL
price NOT NULL
```

---

# Banking

```sql
account_number NOT NULL
balance NOT NULL
```

---

# Social Media

```sql
username NOT NULL
password NOT NULL
```

---

# Why Backend Developers Use NOT NULL

Because:

* APIs can fail
* frontend validation can be bypassed
* database is final protection layer

NOT NULL protects data integrity.

---

# Industry-Level Insight

Good backend systems push validation into:

* database constraints
* not only frontend/backend code

Because database is:

> source of truth

---

# Common Beginner Mistakes

---

# Mistake 1

Confusing NULL with empty string.

---

# Mistake 2

Adding NOT NULL to table containing NULL values.

---

# Mistake 3

Forgetting DEFAULT value.

---

# Mistake 4

Using NOT NULL on optional columns.

Example:

* middle_name
* profile_photo

These may be optional.

---

# Best Practices

✅ Use NOT NULL for required fields

✅ Combine with DEFAULT when needed

✅ Validate important business data

✅ Avoid NULL in critical columns

---

# Interview Questions

---

# Basic Questions

## What is NOT NULL Constraint?

NOT NULL prevents NULL values in a column.

---

## Why Do We Use NOT NULL?

To ensure required data is always present.

---

## Difference Between NULL and Empty String?

| NULL     | Empty String |
| -------- | ------------ |
| No value | Empty text   |

---

# Intermediate Questions

## Can PRIMARY KEY contain NULL?

❌ No

Because PRIMARY KEY automatically includes NOT NULL.

---

## Can NOT NULL work with DEFAULT?

✅ Yes

Very common in production systems.

---

## Can NOT NULL be removed later?

✅ Yes

Using:

```sql
ALTER COLUMN DROP NOT NULL
```

---

# Advanced Questions

## How PostgreSQL Internally Enforces NOT NULL?

During:

* INSERT
* UPDATE

PostgreSQL checks column values before saving row.

---

## Why Is NOT NULL Important in Backend Systems?

Because it:

* protects data
* prevents incomplete records
* improves reliability
* reduces backend bugs

---

# Complete Example

```sql
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'active'
);
```

---

# Testing

## Valid Insert

```sql
INSERT INTO users(username, email)
VALUES('Vishal', 'v@gmail.com');
```

✅ Success

---

## Invalid Insert

```sql
INSERT INTO users(username, email)
VALUES(NULL, 'v@gmail.com');
```

❌ Error

---

# Final Revision Table

| Concept      | Meaning               |
| ------------ | --------------------- |
| NOT NULL     | Prevents NULL values  |
| NULL         | Missing value         |
| Empty String | Empty text value      |
| DEFAULT      | Automatic value       |
| PRIMARY KEY  | Includes NOT NULL     |
| ALTER TABLE  | Add/remove constraint |

---

# Final Interview Definition

NOT NULL is a database constraint that prevents NULL values from being stored in a column, ensuring that required data is always present and improving database integrity and reliability.


# PRIMARY KEY Constraint — Complete Deep Notes

---

# What is PRIMARY KEY?

A PRIMARY KEY is a constraint used to uniquely identify each row in a table.

It ensures:

1. No duplicate values
2. No NULL values

---

# Simple Definition

PRIMARY KEY gives every row a unique identity.

---

# Real-World Analogy

Think about:

| System         | Unique Identifier |
| -------------- | ----------------- |
| Aadhaar System | Aadhaar Number    |
| Banking        | Account Number    |
| College        | Roll Number       |
| Passport       | Passport Number   |

Similarly in databases:

* PRIMARY KEY uniquely identifies records.

---

# Basic Syntax

```sql id="j4m2x7"
column_name datatype PRIMARY KEY
```

---

# Basic Example

```sql id="w3d8vq"
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255)
);
```

---

# Understanding the Example

| Column     | Constraint  |
| ---------- | ----------- |
| student_id | PRIMARY KEY |
| name       | NOT NULL    |

---

# What PRIMARY KEY Does Internally

PRIMARY KEY automatically applies:

```text id="c9k1hm"
NOT NULL + UNIQUE
```

---

# Meaning

| Rule     | Purpose         |
| -------- | --------------- |
| NOT NULL | Cannot be empty |
| UNIQUE   | Cannot repeat   |

---

# Valid Inserts

```sql id="f5t8ql"
INSERT INTO students(name, email)
VALUES
('Vishal', 'v@gmail.com'),
('Rahul', 'r@gmail.com');
```

✅ Success

---

# Result

| student_id | name   |
| ---------- | ------ |
| 1          | Vishal |
| 2          | Rahul  |

---

# Why IDs Automatically Increase?

Because:

```sql id="n2x4yv"
SERIAL
```

creates:

* auto-incrementing integer sequence

---

# Invalid Example — Duplicate PRIMARY KEY

```sql id="u8j1pk"
INSERT INTO students(student_id, name)
VALUES(1, 'Aman');
```

❌ Error

---

# PostgreSQL Error

```text id="m1p8xr"
ERROR:
duplicate key value violates unique constraint
```

---

# Invalid Example — NULL PRIMARY KEY

```sql id="c3v7zt"
INSERT INTO students(student_id, name)
VALUES(NULL, 'Aman');
```

❌ Error

---

# Why Error Happens?

Because PRIMARY KEY includes:

```text id="d8q5ls"
NOT NULL
```

---

# PostgreSQL Internal Working

When inserting row:

```sql id="g2w6bf"
INSERT INTO students(student_id, name)
VALUES(1, 'Vishal');
```

PostgreSQL internally checks:

---

# Step 1

Does value already exist?

---

# Step 2

Is value NULL?

---

# Step 3

If valid:

* row inserted

Otherwise:

* reject query

---

# Internal Flow

```text id="q7y2ha"
INSERT Request
      ↓
Check PRIMARY KEY
      ↓
Duplicate?
   /      \
 YES      NO
 ↓          ↓
ERROR    Continue
              ↓
         NULL Check
              ↓
           NULL?
          /     \
       YES      NO
        ↓        ↓
      ERROR    INSERT
```

---

# Why PRIMARY KEY Is Important

Without PRIMARY KEY:

* duplicate records occur
* relationships break
* updates become unsafe
* backend systems fail

---

# Real Backend Engineering Example

Suppose:

```text id="t5r3wn"
users table
```

contains:

| id | username |
| -- | -------- |
| 1  | Vishal   |
| 1  | Rahul    |

Problem:

* Which user is correct?
* APIs become unreliable

PRIMARY KEY prevents this.

---

# PRIMARY KEY vs UNIQUE

Very important interview topic.

---

# PRIMARY KEY

* only one per table
* automatically NOT NULL
* uniquely identifies row

---

# UNIQUE

* multiple allowed
* allows NULL (in PostgreSQL)

---

# Example

```sql id="h8u2nc"
email VARCHAR(255) UNIQUE
```

---

# Comparison Table

| PRIMARY KEY            | UNIQUE             |
| ---------------------- | ------------------ |
| One per table          | Multiple allowed   |
| NOT NULL automatically | NULL allowed       |
| Identifies row         | Prevent duplicates |

---

# PRIMARY KEY with SERIAL

Very common production pattern.

---

# Example

```sql id="b9k5mz"
id SERIAL PRIMARY KEY
```

---

# What SERIAL Does Internally

PostgreSQL creates:

* integer column
* sequence generator
* auto increment behavior

---

# Example Output

| id |
| -- |
| 1  |
| 2  |
| 3  |

---

# Composite PRIMARY KEY

Using multiple columns together as PRIMARY KEY.

---

# Example

```sql id="w5m2rf"
CREATE TABLE student_courses(
    student_id INT,
    course_id INT,

    PRIMARY KEY(student_id, course_id)
);
```

---

# Why Composite Key?

Because:

* one student can join many courses
* one course can contain many students

Combination must remain unique.

---

# Valid Data

| student_id | course_id |
| ---------- | --------- |
| 1          | 101       |
| 1          | 102       |

---

# Invalid Duplicate

| student_id | course_id |
| ---------- | --------- |
| 1          | 101       |
| 1          | 101       |

❌ Duplicate composite key

---

# PRIMARY KEY and Foreign Keys

PRIMARY KEY is usually referenced by:

* foreign keys

---

# Example

```sql id="m8n4qt"
CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    department_id INT,

    FOREIGN KEY(department_id)
    REFERENCES departments(department_id)
);
```

---

# Why FK References PK?

Because PRIMARY KEY guarantees:

* uniqueness
* stable identity

---

# Industry-Level Best Practices

---

# 1. Always Use PRIMARY KEY

Every production table should have:

* primary key

---

# 2. Prefer Surrogate Keys

Industry commonly uses:

```sql id="v2x8lb"
SERIAL
```

or

```sql id="z9p3jk"
UUID
```

instead of natural values.

---

# 3. Avoid Updating PRIMARY KEY

Primary keys should remain stable.

Changing PK can:

* break relationships
* affect foreign keys

---

# 4. Use Integer or UUID

Best for:

* indexing
* joins
* performance

---

# Production-Level Example

```sql id="k4v6qh"
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,

    username VARCHAR(100) NOT NULL,

    email VARCHAR(255) NOT NULL UNIQUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

# Why This Schema Is Good

| Constraint  | Purpose                 |
| ----------- | ----------------------- |
| PRIMARY KEY | Unique identity         |
| NOT NULL    | Required data           |
| UNIQUE      | Prevent duplicate email |
| DEFAULT     | Auto timestamp          |

---

# Practice Questions with Answers

---

# Question 1

Create products table with:

* product_id PRIMARY KEY
* product_name NOT NULL

## Answer

```sql id="q5y9ta"
CREATE TABLE products(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL
);
```

---

# Question 2

Insert valid product.

## Answer

```sql id="u7w2ks"
INSERT INTO products(product_name)
VALUES('Laptop');
```

---

# Question 3

Insert duplicate primary key.

## Answer

```sql id="e4r8py"
INSERT INTO products(product_id, product_name)
VALUES(1, 'Phone');
```

❌ Error

---

# Question 4

Create composite primary key.

## Answer

```sql id="t6n1mf"
CREATE TABLE enrollments(
    student_id INT,
    course_id INT,

    PRIMARY KEY(student_id, course_id)
);
```

---

# Question 5

Difference between PRIMARY KEY and UNIQUE?

## Answer

| PRIMARY KEY | UNIQUE           |
| ----------- | ---------------- |
| One/table   | Multiple allowed |
| NOT NULL    | NULL allowed     |

---

# Interview Questions

---

# Basic Questions

## What is PRIMARY KEY?

PRIMARY KEY uniquely identifies each row.

---

## Can PRIMARY KEY contain NULL?

❌ No

---

## Can PRIMARY KEY contain duplicate values?

❌ No

---

# Intermediate Questions

## Difference Between PRIMARY KEY and UNIQUE?

Already discussed above.

---

## Why PRIMARY KEY is Important?

Because it:

* prevents duplicates
* maintains identity
* supports relationships

---

# Advanced Questions

## How PostgreSQL Internally Enforces PRIMARY KEY?

Using:

* unique indexes
* NOT NULL validation

during INSERT and UPDATE operations.

---

## Why Are Integer Primary Keys Preferred?

Because they:

* improve indexing
* speed joins
* reduce storage

---

# Common Beginner Mistakes

---

# Mistake 1

Using duplicate IDs.

---

# Mistake 2

Using business data as PRIMARY KEY.

Example:

```text id="n8f3dp"
email as PRIMARY KEY
```

Bad idea because:

* emails can change

---

# Mistake 3

Creating tables without PRIMARY KEY.

---

# Mistake 4

Using very large text columns as PRIMARY KEY.

---

# Final Revision Table

| Concept      | Meaning               |
| ------------ | --------------------- |
| PRIMARY KEY  | Unique row identity   |
| UNIQUE       | Prevent duplicates    |
| NOT NULL     | Prevent NULL values   |
| SERIAL       | Auto increment        |
| Composite PK | Multiple-column PK    |
| FK Reference | Usually references PK |

---

# Final Interview Definition

A PRIMARY KEY is a database constraint that uniquely identifies each row in a table by enforcing both uniqueness and non-nullability, ensuring reliable data relationships and integrity.


# UNIQUE Constraint — Complete Deep Notes

---

# What is UNIQUE Constraint?

The `UNIQUE` constraint ensures that all values in a column are different.

It prevents:

* duplicate values

---

# Simple Definition

UNIQUE ensures:

> No repeated values in a column.

---

# Real-World Analogy

Some real-world data must be unique.

Examples:

| System     | Unique Data     |
| ---------- | --------------- |
| Gmail      | Email Address   |
| Banking    | Account Number  |
| Aadhaar    | Aadhaar Number  |
| Passport   | Passport Number |
| University | Roll Number     |

Databases use:

```sql id="x3n7vk"
UNIQUE
```

to enforce this rule.

---

# Basic Syntax

```sql id="k6m1pt"
column_name datatype UNIQUE
```

---

# Basic Example

```sql id="h7v2qd"
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,

    username VARCHAR(100) NOT NULL,

    email VARCHAR(255) UNIQUE
);
```

---

# Understanding the Example

| Column   | Constraint  |
| -------- | ----------- |
| user_id  | PRIMARY KEY |
| username | NOT NULL    |
| email    | UNIQUE      |

---

# What UNIQUE Does

It ensures:

* no two rows can have same email

---

# Valid Inserts

```sql id="v4p8ty"
INSERT INTO users(username, email)
VALUES
('Vishal', 'v@gmail.com'),
('Rahul', 'r@gmail.com');
```

✅ Success

---

# Invalid Duplicate Insert

```sql id="s2j9wc"
INSERT INTO users(username, email)
VALUES('Aman', 'v@gmail.com');
```

❌ Error

---

# PostgreSQL Error

```text id="q1n4xe"
ERROR:
duplicate key value violates unique constraint
```

---

# Why Error Happened?

Because:

```text id="l5b2rk"
v@gmail.com
```

already exists.

---

# PostgreSQL Internal Working

When inserting:

```sql id="n8t3qh"
INSERT INTO users(username, email)
VALUES('Aman', 'v@gmail.com');
```

PostgreSQL internally:

1. Reads table metadata
2. Finds UNIQUE constraint
3. Searches existing values
4. Detects duplicate
5. Rejects insert

---

# Internal Flow

```text id="z9m6pv"
INSERT Query
      ↓
Check UNIQUE Constraint
      ↓
Duplicate Exists?
   /         \
 YES         NO
 ↓            ↓
ERROR       INSERT
```

---

# UNIQUE Allows NULL Values

Very important PostgreSQL interview topic.

---

# Example

```sql id="u7f4jc"
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE
);
```

---

# Valid Inserts

```sql id="p2r9mk"
INSERT INTO users(email)
VALUES(NULL);

INSERT INTO users(email)
VALUES(NULL);
```

✅ Allowed in PostgreSQL

---

# Why?

Because:

```text id="e5w1tn"
NULL ≠ NULL
```

in SQL logic.

NULL means:

> unknown value

---

# UNIQUE vs PRIMARY KEY

Very important interview question.

---

# PRIMARY KEY

* only one per table
* automatically NOT NULL
* uniquely identifies rows

---

# UNIQUE

* multiple allowed
* NULL allowed
* prevents duplicates

---

# Comparison Table

| PRIMARY KEY            | UNIQUE               |
| ---------------------- | -------------------- |
| One per table          | Multiple allowed     |
| NOT NULL automatically | NULL allowed         |
| Main row identity      | Duplicate prevention |

---

# Example

```sql id="b4h8yr"
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,

    email VARCHAR(255) UNIQUE,

    phone VARCHAR(20) UNIQUE
);
```

Here:

* two UNIQUE constraints exist

---

# Real Backend Engineering Example

Suppose:

* two users register with same email

Without UNIQUE:

| id | email                             |
| -- | --------------------------------- |
| 1  | [v@gmail.com](mailto:v@gmail.com) |
| 2  | [v@gmail.com](mailto:v@gmail.com) |

Problems:

* login confusion
* authentication failure
* password reset issues

UNIQUE prevents this.

---

# UNIQUE with NOT NULL

Very common production pattern.

---

# Example

```sql id="t7k3xa"
email VARCHAR(255) NOT NULL UNIQUE
```

---

# Why Combine Them?

| Constraint | Purpose        |
| ---------- | -------------- |
| NOT NULL   | Email required |
| UNIQUE     | No duplicates  |

---

# Production-Level Example

```sql id="m6d9qp"
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,

    username VARCHAR(100) NOT NULL UNIQUE,

    email VARCHAR(255) NOT NULL UNIQUE,

    password_hash TEXT NOT NULL
);
```

---

# Why This Design Is Good

| Column        | Reason                |
| ------------- | --------------------- |
| username      | Unique login identity |
| email         | Unique authentication |
| password_hash | Required security     |

---

# Composite UNIQUE Constraint

UNIQUE can apply to multiple columns together.

---

# Example

```sql id="w3y6jf"
CREATE TABLE enrollments(
    student_id INT,
    course_id INT,

    UNIQUE(student_id, course_id)
);
```

---

# Meaning

Same student:

* cannot enroll same course twice

---

# Valid Data

| student_id | course_id |
| ---------- | --------- |
| 1          | 101       |
| 1          | 102       |

---

# Invalid Duplicate

| student_id | course_id |
| ---------- | --------- |
| 1          | 101       |
| 1          | 101       |

❌ Duplicate combination

---

# Adding UNIQUE Using ALTER TABLE

---

# Add UNIQUE

```sql id="f1r8ku"
ALTER TABLE users
ADD CONSTRAINT unique_email
UNIQUE(email);
```

---

# Remove UNIQUE

```sql id="y9v4sc"
ALTER TABLE users
DROP CONSTRAINT unique_email;
```

---

# Important Problem While Adding UNIQUE

Suppose duplicates already exist.

Example:

| email                             |
| --------------------------------- |
| [a@gmail.com](mailto:a@gmail.com) |
| [a@gmail.com](mailto:a@gmail.com) |

Now:

```sql id="n4k7tx"
ALTER TABLE users
ADD CONSTRAINT unique_email
UNIQUE(email);
```

❌ Error

Because:

* existing rows violate UNIQUE constraint

---

# Correct Solution

## Step 1 — Find Duplicates

```sql id="c2m9bz"
SELECT email, COUNT(*)
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
```

---

# Step 2 — Fix Duplicates

Update/delete duplicate rows.

---

# Step 3 — Add UNIQUE

```sql id="s6p1wd"
ALTER TABLE users
ADD CONSTRAINT unique_email
UNIQUE(email);
```

---

# How PostgreSQL Internally Implements UNIQUE

PostgreSQL creates:

* unique index internally

This allows:

* fast duplicate checking
* efficient searches

---

# UNIQUE and Performance

UNIQUE improves:

* search performance
* indexing

But:

* inserts become slightly slower
  because duplicate checks occur.

---

# Industry-Level Best Practices

---

# Use UNIQUE For

✅ emails
✅ usernames
✅ phone numbers
✅ account numbers
✅ transaction IDs

---

# Avoid UNIQUE For

❌ names
❌ cities
❌ departments

because duplicates are natural.

---

# Important Engineering Insight

Databases should enforce:

* critical business rules

not only frontend/backend.

Because:

* APIs may fail
* frontend validation may break

Database remains:

> final protection layer

---

# Practice Questions with Answers

---

# Question 1

Create users table where email must be unique.

## Answer

```sql id="r8m5xh"
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE
);
```

---

# Question 2

Insert duplicate email.

## Answer

```sql id="u2t7vn"
INSERT INTO users(email)
VALUES('v@gmail.com');

INSERT INTO users(email)
VALUES('v@gmail.com');
```

❌ Error

---

# Question 3

Can UNIQUE contain NULL values?

## Answer

✅ Yes in PostgreSQL

---

# Question 4

Create composite UNIQUE constraint.

## Answer

```sql id="g6p3wy"
CREATE TABLE enrollments(
    student_id INT,
    course_id INT,

    UNIQUE(student_id, course_id)
);
```

---

# Question 5

Add UNIQUE using ALTER TABLE.

## Answer

```sql id="n7x1ks"
ALTER TABLE users
ADD CONSTRAINT unique_username
UNIQUE(username);
```

---

# Interview Questions

---

# Basic Questions

## What is UNIQUE Constraint?

UNIQUE prevents duplicate values in a column.

---

## Can UNIQUE contain NULL values?

✅ Yes in PostgreSQL

---

# Intermediate Questions

## Difference Between PRIMARY KEY and UNIQUE?

| PRIMARY KEY | UNIQUE           |
| ----------- | ---------------- |
| One/table   | Multiple allowed |
| NOT NULL    | NULL allowed     |

---

## Why Is UNIQUE Important?

Because it:

* prevents duplicates
* protects business logic
* improves data integrity

---

# Advanced Questions

## How PostgreSQL Internally Enforces UNIQUE?

Using:

* unique indexes

during INSERT and UPDATE operations.

---

## Why Is UNIQUE Important in Backend Systems?

Because it prevents:

* duplicate accounts
* authentication problems
* inconsistent data

---

# Common Beginner Mistakes

---

# Mistake 1

Using UNIQUE on columns that naturally duplicate.

---

# Mistake 2

Forgetting NOT NULL with UNIQUE.

---

# Mistake 3

Adding UNIQUE when duplicates already exist.

---

# Mistake 4

Confusing UNIQUE with PRIMARY KEY.

---

# Final Revision Table

| Concept          | Meaning                  |
| ---------------- | ------------------------ |
| UNIQUE           | Prevent duplicate values |
| PRIMARY KEY      | Unique + NOT NULL        |
| NULL             | Allowed in UNIQUE        |
| Composite UNIQUE | Multi-column uniqueness  |
| Unique Index     | Internal implementation  |

---

# Final Interview Definition

UNIQUE is a database constraint that prevents duplicate values in a column or group of columns, ensuring data uniqueness and improving database integrity and backend reliability.
