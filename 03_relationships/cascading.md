# Cascading in DBMS

---

# What is Cascading in DBMS?

Cascading means:

```text
Automatically actions happen in the child table
when changes occur in the parent table.
```

It is mainly used with:

* Foreign Key
* Relationships
* Referential Integrity

---

# Why Cascading is Important?

Cascading helps maintain:

* Data consistency
* Referential integrity
* Automatic relationship handling

Without cascading:

* Orphan records can occur
* Broken relationships happen
* Manual cleanup is required

With cascading:

* Database stays clean
* Relationships remain valid
* Backend logic becomes easier

---

# What is ON DELETE CASCADE?

```text
If parent row is deleted,
child rows are automatically deleted.
```

---

# Real-World Example

## CUSTOMERS

```text
1 Rahul
2 Aman
```

## ORDERS

```text
101 -> Rahul
102 -> Rahul
103 -> Aman
```

Rahul has 2 orders.

If Rahul is deleted:

What should happen to Rahul's orders?

With `ON DELETE CASCADE`:

✅ Orders are automatically deleted.

---

# SQL Example

```sql
CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,

    customer_id INT,

    total_amount DECIMAL(10,2),

    CONSTRAINT fk_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
    ON DELETE CASCADE
);
```

---

# What is ON UPDATE CASCADE?

```text
Automatically updates foreign key values
in child table when parent key changes.
```

---

# Example

Suppose:

## CUSTOMERS

```text
1 Rahul
```

## ORDERS

```text
101 -> 1
```

If parent ID changes:

```text
1 → 100
```

Then child table automatically updates:

```text
101 -> 100
```

No manual update needed.

---

# SQL Example

```sql
CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,

    customer_id INT,

    CONSTRAINT fk_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
    ON UPDATE CASCADE
);
```

---

# What is ON DELETE SET NULL?

```text
When parent row is deleted,
foreign key in child table becomes NULL.
```

Instead of deleting child records,
DBMS removes the relationship only.

---

# Example

## CUSTOMERS

```text
1 Rahul
2 Aman
```

## ORDERS

```text
101 -> Rahul
102 -> Rahul
103 -> Aman
```

If Rahul is deleted:

With `ON DELETE SET NULL`

Result:

```text
101 -> NULL
102 -> NULL
103 -> Aman
```

Orders remain in database.

Only relationship is removed.

---

# SQL Example

```sql
CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,

    customer_id INT,

    total_amount DECIMAL(10,2),

    CONSTRAINT fk_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
    ON DELETE SET NULL
);
```

---

# Important Rule

Foreign key column must allow NULL.

✅ Correct

```sql
customer_id INT
```

❌ Wrong

```sql
customer_id INT NOT NULL
```

Because DBMS cannot set NULL
if column does not allow NULL values.

---

# What is ON DELETE RESTRICT?

```text
Prevents deletion of parent row
if child records exist.
```

---

# Example

Suppose:

## CUSTOMERS

```text
1 Rahul
```

## ORDERS

```text
101 -> Rahul
```

If you try to delete Rahul:

❌ Database will throw an error.

Because child records still exist.

---

# SQL Example

```sql
CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,

    customer_id INT,

    CONSTRAINT fk_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
    ON DELETE RESTRICT
);
```

---

# What is NO ACTION?

`NO ACTION` is very similar to `RESTRICT`.

```text
Does not allow parent deletion
when child rows exist.
```

Difference is mostly internal database behavior.

In PostgreSQL:

`RESTRICT` and `NO ACTION`
behave almost the same.

---

# What is SET DEFAULT?

```text
When parent row is deleted,
foreign key gets default value.
```

---

# Example

```sql
customer_id INT DEFAULT 0
```

If parent deleted:

```text
customer_id becomes 0
```

---

# Difference Between Cascading Options

| Option             | What Happens             |
| ------------------ | ------------------------ |
| ON DELETE CASCADE  | Child rows deleted       |
| ON UPDATE CASCADE  | Foreign keys updated     |
| ON DELETE SET NULL | Foreign key becomes NULL |
| ON DELETE RESTRICT | Prevent parent deletion  |
| NO ACTION          | Similar to RESTRICT      |
| SET DEFAULT        | Sets default value       |

---

# Real Engineering Usage

| Relationship           | Common Action |
| ---------------------- | ------------- |
| User → Sessions        | CASCADE       |
| Blog → Comments        | CASCADE       |
| Customer → Orders      | SET NULL      |
| Department → Employees | SET NULL      |
| Product → Orders       | RESTRICT      |

---

# Beginner Mistakes

## 1. Forgetting NULL support

```sql
customer_id INT NOT NULL
```

This will fail with:

```sql
ON DELETE SET NULL
```

---

## 2. Wrong Cascade Usage

Using `CASCADE` everywhere can accidentally delete huge amounts of data.

Always think carefully before using it.

---

# Interview Questions

## Q1: Difference between CASCADE and SET NULL?

### Answer

* `CASCADE` deletes child rows.
* `SET NULL` keeps child rows but removes relationship.

---

## Q2: Why use cascading?

### Answer

To maintain:

* Referential integrity
* Data consistency
* Automatic relationship management

---

# Final Summary

Cascading helps databases automatically manage relationships.

Main options:

* CASCADE → delete child rows
* SET NULL → remove relationship
* UPDATE CASCADE → update foreign keys
* RESTRICT → stop deletion

These concepts are heavily used in:

* Backend development
* PostgreSQL
* MySQL
* Real-world production databases
* Industry-level system design
