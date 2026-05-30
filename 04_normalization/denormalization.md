# denormalization.md

# Denormalization

## What is Denormalization?

### Definition

Denormalization is the process of intentionally adding redundant data into a database to improve read performance and reduce expensive JOIN operations.

---

## Simple Definition

```text
Normalization
=
Less Redundancy
More JOINs

Denormalization
=
More Redundancy
Less JOINs
Faster Reads
```

---

# Why Was Denormalization Introduced?

Normalization creates:

- Clean database design
- Less redundancy
- Better consistency

But there is a problem.

As the database grows:

```text
More Tables
→ More JOINs
→ Slower Queries
```

Large systems like:

- Amazon
- Netflix
- YouTube
- Facebook
- Instagram

often denormalize some data to improve performance.

---

# Real World Analogy

Imagine a library.

## Fully Normalized Design

### Students

| student_id | name |
|------------|------|
| 1 | Rahul |

### Books

| book_id | book_name |
|----------|-----------|
| 101 | DBMS |

### Borrowed_Books

| student_id | book_id |
|------------|---------|
| 1 | 101 |

---

To get:

```text
Rahul borrowed DBMS
```

Database must:

```text
JOIN Students
JOIN Borrowed_Books
JOIN Books
```

---

# Problem

For:

```text
1 Million Students
10 Million Borrow Records
```

JOINs become expensive.

---

# Denormalized Design

## Borrowed_Books

| student_id | student_name | book_id | book_name |
|------------|-------------|----------|-----------|
| 1 | Rahul | 101 | DBMS |

Now:

```sql
SELECT student_name, book_name
FROM borrowed_books;
```

No JOIN required.

Much faster.

---

# Why Companies Use Denormalization

Main goal:

```text
Faster Reads
```

Modern applications usually have:

```text
90% Reads
10% Writes
```

Example:

Instagram Feed

Millions of users:

```text
Read Posts
Read Comments
Read Likes
```

every second.

Read performance becomes critical.

---

# Normalization vs Denormalization

| Feature | Normalization | Denormalization |
|----------|-------------|----------------|
| Redundancy | Low | High |
| Storage | Less | More |
| Data Consistency | Better | Harder |
| Read Performance | Slower | Faster |
| Write Performance | Faster Updates | More Updates |
| JOINs | More | Less |

---

# Real Example

## Normalized E-Commerce Database

### Customers

| customer_id | name |
|-------------|------|
| 1 | Rahul |

---

### Orders

| order_id | customer_id |
|----------|------------|
| 1001 | 1 |

---

### Query

```sql
SELECT
    o.order_id,
    c.name
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;
```

---

# Denormalized Version

### Orders

| order_id | customer_id | customer_name |
|----------|------------|---------------|
| 1001 | 1 | Rahul |

Query:

```sql
SELECT
    order_id,
    customer_name
FROM orders;
```

No JOIN.

---

# PostgreSQL Example

## Normalized Tables

### Customers

```sql
CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100)
);
```

---

### Orders

```sql
CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,

    customer_id INT,

    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
);
```

---

# Denormalized Orders Table

```sql
CREATE TABLE orders(

    order_id SERIAL PRIMARY KEY,

    customer_id INT,

    customer_name VARCHAR(100)
);
```

Notice:

```text
customer_name
```

is duplicated.

This is denormalization.

---

# Data Redundancy Example

## Before

### Customers

| customer_id | customer_name |
|------------|--------------|
| 1 | Rahul |

---

### Orders

| order_id | customer_id |
|----------|------------|
| 1001 | 1 |
| 1002 | 1 |

---

# After Denormalization

### Orders

| order_id | customer_id | customer_name |
|----------|------------|--------------|
| 1001 | 1 | Rahul |
| 1002 | 1 | Rahul |

Name is repeated.

---

# New Problem Created

Suppose:

```text
Rahul
↓
Rahul Kumar
```

Need update:

| order_id | customer_name |
|----------|--------------|
| 1001 | Rahul |
| 1002 | Rahul |

Multiple rows.

This is why denormalization increases maintenance cost.

---

# Read vs Write Trade-Off

## Normalized

### Reads

Slower

Need JOINs.

### Writes

Fast

Update once.

---

## Denormalized

### Reads

Fast

No JOINs.

### Writes

Slower

Must update multiple locations.

---

# Materialized Views

One common denormalization technique.

## Definition

A materialized view stores query results physically.

---

Example:

```sql
CREATE MATERIALIZED VIEW order_summary AS

SELECT
    o.order_id,
    c.customer_name
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;
```

---

Now PostgreSQL stores the result.

No JOIN required every time.

---

# Real Engineering Usage

## Amazon

Product page needs:

```text
Product
Price
Reviews
Seller
Ratings
```

Fetching from many tables repeatedly is expensive.

Some data is denormalized.

---

## Netflix

Home page shows:

```text
Movie
Category
Thumbnail
Popularity
```

Data often precomputed and denormalized.

---

## YouTube

Video pages show:

```text
Views
Likes
Comments Count
Subscriber Count
```

Many counters are denormalized.

---

## Facebook

News feed generation uses:

```text
Precomputed Feed Data
```

instead of expensive joins.

---

## Instagram

Feed systems often store:

```text
User Name
Profile Image
Post Metadata
```

together for fast retrieval.

---

# Data Warehouses

Denormalization is extremely common.

Examples:

- Snowflake Schema
- Star Schema
- Analytics Databases

Goal:

```text
Fast Reporting
```

not transactional consistency.

---

# OLTP vs OLAP

## OLTP (Transactional Systems)

Examples:

- Banking
- E-commerce Checkout
- Library Management

Uses:

```text
Normalization
```

because consistency is critical.

---

## OLAP (Analytics Systems)

Examples:

- Reports
- Dashboards
- Business Intelligence

Uses:

```text
Denormalization
```

for speed.

---

# When Should You Denormalize?

Use when:

✅ Read operations are much higher than writes

✅ Complex joins are slowing down the application

✅ Analytics queries are expensive

✅ Dashboard performance matters

---

# When Should You Avoid Denormalization?

Avoid when:

❌ Data changes frequently

❌ Consistency is critical

❌ Banking applications

❌ Financial transactions

❌ Inventory management systems

---

# Interview Questions

## Beginner

### What is Denormalization?

Adding redundant data intentionally to improve read performance.

---

### Why do we denormalize?

To reduce JOIN operations and improve query speed.

---

## Intermediate

### What is the trade-off?

```text
Fast Reads
Slow Writes
```

---

### Does denormalization increase storage?

Yes.

Because duplicate data is stored.

---

## Advanced

### Why does Amazon use denormalization?

To serve millions of read requests efficiently.

---

### What is a Materialized View?

A stored query result used to improve performance.

---

# Common Mistakes

## Mistake 1

Thinking denormalization is bad.

It is a performance optimization technique.

---

## Mistake 2

Denormalizing too early.

Always:

```text
Normalize First
Measure Performance
Then Denormalize If Needed
```

---

## Mistake 3

Using denormalization in banking transactions.

Consistency is more important than speed.

---

# Memory Trick

```text
Normalization
=
Less Redundancy
More JOINs

Denormalization
=
More Redundancy
Less JOINs
```

---

# Real Backend Engineering Rule

Most production systems follow:

```text
OLTP Database
→ 3NF

Analytics Database
→ Denormalized
```

This is exactly how large-scale systems like Amazon, Netflix, YouTube, Facebook, and Instagram balance performance and consistency.

---

# Summary

Denormalization is the process of intentionally storing duplicate data to improve read performance.

Benefits:

- Faster queries
- Fewer JOINs
- Better dashboard performance

Drawbacks:

- More storage
- More redundancy
- More update complexity

Use denormalization only after normalization and only when performance measurements justify it.