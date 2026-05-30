# One-to-Many Relationship in DBMS

---

# What is One-to-Many Relationship?

A one-to-many relationship means:

```text id="vynuhd"
One row from Parent Table
can be connected to many rows
in Child Table.
```

But:

```text id="j4vwfh"
One row from Child Table
belongs to only one Parent row.
```

---

# Real-World Example

## Department and Employees

* One department can have many employees
* One employee belongs to one department

So relationship becomes:

```text id="g5cx5d"
Department  →  Employees
```

This is called:

# One-to-Many (1:N)

---

# Visual Understanding

```text id="shjlwm"
IT Department
    → Rahul
    → Aman
    → Vishal

HR Department
    → Priya
```

Here:

* IT department has many employees
* Each employee belongs to only one department

---

# Parent Table vs Child Table

| Table       | Role         |
| ----------- | ------------ |
| departments | Parent Table |
| employees   | Child Table  |

---

# How DBMS Implements One-to-Many?

Using:

# Foreign Key

The foreign key is stored in the child table.

---

# Database Structure

## Parent Table

```text id="hx5p1y"
departments
----------------
department_id
department_name
```

---

## Child Table

```text id="7j5zde"
employees
----------------
employee_id
employee_name
department_id
```

`department_id` inside employees table becomes:

# Foreign Key

---

# SQL Example

## Step 1 → Create Parent Table

```sql id="vkgpx0"
CREATE TABLE departments(

    department_id SERIAL PRIMARY KEY,

    department_name VARCHAR(100) NOT NULL
);
```

---

## Step 2 → Create Child Table

```sql id="s7b7qe"
CREATE TABLE employees(

    employee_id SERIAL PRIMARY KEY,

    employee_name VARCHAR(100) NOT NULL,

    department_id INT,

    CONSTRAINT fk_department
    FOREIGN KEY(department_id)
    REFERENCES departments(department_id)
);
```

---

# Relationship Understanding

```text id="d9r7um"
One Department
        ↓
Many Employees
```

Example:

```text id="rsl2kz"
IT → Rahul
IT → Aman
IT → Vishal
```

---

# Insert Data Example

## Insert Departments

```sql id="mk23gz"
INSERT INTO departments(department_name)
VALUES
('IT'),
('HR');
```

---

## Insert Employees

```sql id="4eqf5u"
INSERT INTO employees(employee_name, department_id)
VALUES
('Rahul',1),
('Aman',1),
('Vishal',1),
('Priya',2);
```

---

# Table Data

## departments

```text id="y7j8r0"
1 → IT
2 → HR
```

---

## employees

```text id="ehv4ut"
Rahul → 1
Aman → 1
Vishal → 1
Priya → 2
```

---

# How to Fetch Related Data?

Using:

# JOIN

---

# Query Example

```sql id="p4mnw4"
SELECT
    e.employee_name,
    d.department_name

FROM employees e

JOIN departments d
ON e.department_id = d.department_id;
```

---

# Output

```text id="xghyb8"
Rahul → IT
Aman → IT
Vishal → IT
Priya → HR
```

---

# Why One-to-Many is Important?

Used everywhere in real-world systems.

---

# Real Engineering Examples

| Parent Table | Child Table |
| ------------ | ----------- |
| Customers    | Orders      |
| Department   | Employees   |
| Teacher      | Students    |
| Category     | Products    |
| User         | Posts       |
| Blog         | Comments    |

---

# One-to-Many with CASCADE

Sometimes when parent row deletes:

Child rows should also delete automatically.

---

# Example

```sql id="d9qxg5"
CREATE TABLE employees(

    employee_id SERIAL PRIMARY KEY,

    employee_name VARCHAR(100),

    department_id INT,

    CONSTRAINT fk_department
    FOREIGN KEY(department_id)
    REFERENCES departments(department_id)
    ON DELETE CASCADE
);
```

---

# What Happens?

If:

```text id="yxtw2m"
IT department deleted
```

Then:

```text id="x8dql4"
All employees of IT department
also get deleted automatically.
```

---

# Other Cascading Options

| Option             | Meaning                           |
| ------------------ | --------------------------------- |
| ON DELETE CASCADE  | Delete child rows                 |
| ON DELETE SET NULL | Foreign key becomes NULL          |
| ON UPDATE CASCADE  | Update foreign keys automatically |
| RESTRICT           | Prevent deletion                  |

---

# Important Concepts

| Concept               | Meaning                         |
| --------------------- | ------------------------------- |
| Parent Table          | Main table                      |
| Child Table           | Dependent table                 |
| Foreign Key           | Creates relationship            |
| Referential Integrity | Keeps data valid                |
| Cascading             | Automatic relationship handling |

---

# Common Beginner Mistakes

## 1. Inserting Invalid Foreign Key

❌ Wrong

```sql id="v7xfxr"
INSERT INTO employees(employee_name, department_id)
VALUES('Rahul',100);
```

If department 100 does not exist:

❌ Database throws error.

---

# Why?

Because of:

# Referential Integrity

Database ensures relationships stay valid.

---

## 2. Forgetting Foreign Key

Without foreign key:

* Invalid data enters
* Relationships break
* Orphan records occur

---

## 3. Wrong Cascade Usage

Using `ON DELETE CASCADE` carelessly can delete huge amounts of important data.

Always use carefully.

---

# Difference Between One-to-One vs One-to-Many

| Feature     | One-to-One      | One-to-Many            |
| ----------- | --------------- | ---------------------- |
| Parent rows | One             | One                    |
| Child rows  | One             | Many                   |
| Example     | User ↔ Passport | Department ↔ Employees |

---

# Interview Questions

## Q1: What is One-to-Many Relationship?

### Answer

A relationship where:

* One parent row relates to many child rows
* One child row belongs to only one parent row

---

## Q2: How is One-to-Many implemented?

### Answer

Using:

# Foreign Key

inside child table.

---

## Q3: Where is One-to-Many used?

### Answer

Used in:

* Banking systems
* E-commerce
* Social media
* ERP systems
* Backend applications

---

# Industry-Level Understanding

One-to-many relationship is the most commonly used relationship in backend engineering.

It helps databases model real-world systems efficiently.

This concept is heavily used in:

* PostgreSQL
* MySQL
* Oracle
* SQL Server
* Backend APIs
* System Design

---

# Final Summary

One-to-many relationship means:

```text id="k29k6g"
One parent row
can connect to many child rows.
```

Implemented using:

* Foreign Key
* Parent Table
* Child Table
* Referential Integrity

This is one of the most important DBMS concepts for:

* Interviews
* Backend Development
* Database Design
* Industry Projects
