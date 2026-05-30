# One-to-One Relationship in DBMS

---

# What is One-to-One Relationship?

A one-to-one relationship means:

```text id="jlwm9t"
One row from Table A
can connect to only one row in Table B

AND

One row from Table B
can connect to only one row in Table A
```

This is called:

# One-to-One (1:1)

---

# Real-World Example

## Users and Passports

* One user can have only one passport
* One passport belongs to only one user

Relationship:

```text id="ic0d9n"
User  ↔  Passport
```

This is a one-to-one relationship.

---

# Visual Understanding

```text id="x7z3tx"
Rahul  ↔  Passport-101
Aman   ↔  Passport-102
Priya  ↔  Passport-103
```

Here:

* One user → one passport
* One passport → one user

---

# Why One-to-One Relationship is Used?

Used when:

* Extra information should be separated
* Sensitive data should be isolated
* Optional data should be stored separately

---

# Real Engineering Examples

| Table A  | Table B  |
| -------- | -------- |
| User     | Passport |
| Employee | Locker   |
| Student  | ID Card  |
| Person   | Aadhaar  |
| User     | Profile  |

---

# How DBMS Implements One-to-One?

Using:

* Foreign Key
* UNIQUE Constraint

---

# Database Structure

## Parent Table

```text id="7d51kp"
users
----------------
user_id
user_name
```

---

## Child Table

```text id="0n45oq"
passports
----------------
passport_id
passport_number
user_id
```

`user_id` becomes:

* Foreign Key
* UNIQUE

This ensures:

```text id="mf9vv0"
One user gets only one passport.
```

---

# SQL Example

## Step 1 → Create Users Table

```sql id="zdd7x8"
CREATE TABLE users(

    user_id SERIAL PRIMARY KEY,

    user_name VARCHAR(100) NOT NULL
);
```

---

## Step 2 → Create Passports Table

```sql id="i0v4po"
CREATE TABLE passports(

    passport_id SERIAL PRIMARY KEY,

    passport_number VARCHAR(100) UNIQUE NOT NULL,

    user_id INT UNIQUE,

    CONSTRAINT fk_user
    FOREIGN KEY(user_id)
    REFERENCES users(user_id)
);
```

---

# Why UNIQUE is Important?

```sql id="f3m30c"
user_id INT UNIQUE
```

This prevents:

```text id="tqepj5"
One user having multiple passports.
```

Without UNIQUE:

❌ Relationship becomes one-to-many.

---

# Insert Data Example

## Insert Users

```sql id="glbr0g"
INSERT INTO users(user_name)
VALUES
('Rahul'),
('Aman');
```

---

## Insert Passports

```sql id="4k2xqm"
INSERT INTO passports(passport_number, user_id)
VALUES
('IND12345',1),
('IND67890',2);
```

---

# Table Data

## users

```text id="rt4zw7"
1 → Rahul
2 → Aman
```

---

## passports

```text id="bz93hb"
IND12345 → Rahul
IND67890 → Aman
```

---

# Invalid Example

❌ Wrong

```sql id="8z5cds"
INSERT INTO passports(passport_number, user_id)
VALUES
('IND99999',1);
```

Why?

Because:

```text id="k0l8di"
user_id = 1 already exists.
```

UNIQUE constraint blocks duplicate relationship.

---

# Fetch Related Data

Using:

# JOIN

---

# Query Example

```sql id="vfe0cx"
SELECT
    u.user_name,
    p.passport_number

FROM users u

JOIN passports p
ON u.user_id = p.user_id;
```

---

# Output

```text id="2yxyg8"
Rahul → IND12345
Aman → IND67890
```

---

# One-to-One with CASCADE

Sometimes child data should automatically delete.

---

# Example

```sql id="djlwm2"
CREATE TABLE passports(

    passport_id SERIAL PRIMARY KEY,

    passport_number VARCHAR(100),

    user_id INT UNIQUE,

    CONSTRAINT fk_user
    FOREIGN KEY(user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);
```

---

# What Happens?

If user deleted:

```text id="xyk9p1"
Passport record also deletes automatically.
```

---

# Important Concepts

| Concept               | Meaning                   |
| --------------------- | ------------------------- |
| Foreign Key           | Creates relationship      |
| UNIQUE Constraint     | Prevents duplicates       |
| Parent Table          | Main table                |
| Child Table           | Dependent table           |
| Referential Integrity | Keeps relationships valid |

---

# Common Beginner Mistakes

## 1. Forgetting UNIQUE Constraint

❌ Wrong

```sql id="90u76m"
user_id INT
```

Without UNIQUE:

```text id="6wnhwl"
One user can have many passports.
```

Relationship becomes one-to-many.

---

## 2. Invalid Foreign Key

❌ Wrong

```sql id="lxt5d0"
INSERT INTO passports(passport_number, user_id)
VALUES('IND0001',100);
```

If user 100 does not exist:

❌ Database throws error.

---

# Why?

Because of:

# Referential Integrity

Database ensures valid relationships.

---

# Difference Between Relationships

| Relationship | Meaning               |
| ------------ | --------------------- |
| One-to-One   | One row ↔ One row     |
| One-to-Many  | One row ↔ Many rows   |
| Many-to-Many | Many rows ↔ Many rows |

---

# Real Industry Usage

One-to-one relationships are commonly used for:

* Authentication systems
* User profiles
* Sensitive information storage
* Banking systems
* Government ID systems

---

# Industry-Level Understanding

In real-world backend systems:

Main table stores common data.

Separate table stores:

* Secure data
* Optional data
* Large extra information

This improves:

* Performance
* Security
* Scalability
* Database normalization

---

# Interview Questions

## Q1: What is One-to-One Relationship?

### Answer

A relationship where:

* One row from first table connects to one row from second table
* And vice versa

---

## Q2: How is One-to-One implemented?

### Answer

Using:

* Foreign Key
* UNIQUE Constraint

---

## Q3: Why UNIQUE is necessary?

### Answer

To ensure one row cannot connect to multiple rows.

---

# Final Summary

One-to-one relationship means:

```text id="emg5h0"
One row
connects to only one row.
```

Implemented using:

* Foreign Key
* UNIQUE Constraint
* Referential Integrity

Used heavily in:

* PostgreSQL
* Backend Development
* Authentication Systems
* Banking Applications
* Real-world Database Design
