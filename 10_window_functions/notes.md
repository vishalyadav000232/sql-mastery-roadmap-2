# notes.md
# 📦 Window Functions Complete Notes (Backend Developer Edition)

---

# What Are Window Functions?

Window Functions are special SQL functions that perform calculations across a set of rows related to the current row **without collapsing the result into a single row**.

Unlike `GROUP BY`, window functions keep all rows visible while still performing calculations on groups of rows.

---

## Why Do We Need Window Functions?

Without window functions:

* Ranking students becomes difficult
* Finding latest payment per user becomes complex
* Comparing current and previous records requires self joins
* Leaderboards become harder to build

Window functions solve these problems efficiently.

---

# General Syntax

```sql
FUNCTION_NAME() OVER (
    PARTITION BY column_name
    ORDER BY column_name
)
```

Example:

```sql
ROW_NUMBER() OVER (
    PARTITION BY shift
    ORDER BY joining_date
)
```

---

# Sample Table

## Students

```sql
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    shift VARCHAR(20),
    marks INT
);
```

Data:

| id | name  | shift   | marks |
| -- | ----- | ------- | ----- |
| 1  | Rahul | Morning | 95    |
| 2  | Aman  | Morning | 90    |
| 3  | Ravi  | Morning | 90    |
| 4  | Mohan | Evening | 85    |
| 5  | Kunal | Evening | 80    |

---

# 1. ROW_NUMBER()

## Definition

Assigns a unique sequential number to each row.

Even if values are identical, row numbers remain unique.

---

## Syntax

```sql
ROW_NUMBER() OVER (
    ORDER BY marks DESC
)
```

---

## Example

```sql
SELECT
    name,
    marks,
    ROW_NUMBER() OVER (
        ORDER BY marks DESC
    ) AS row_num
FROM students;
```

Output:

| name  | marks | row_num |
| ----- | ----- | ------- |
| Rahul | 95    | 1       |
| Aman  | 90    | 2       |
| Ravi  | 90    | 3       |
| Mohan | 85    | 4       |
| Kunal | 80    | 5       |

---

## Backend Use Case

### Latest Payment Per Student

```sql
SELECT *
FROM (
    SELECT
        student_id,
        amount,
        payment_date,
        ROW_NUMBER() OVER (
            PARTITION BY student_id
            ORDER BY payment_date DESC
        ) rn
    FROM payments
) p
WHERE rn = 1;
```

Used in:

* Banking systems
* Payment gateways
* Library management systems
* E-commerce

---

# 2. RANK()

## Definition

Assigns ranks.

If two rows have the same value, they get the same rank.

The next rank is skipped.

---

## Example

```sql
SELECT
    name,
    marks,
    RANK() OVER (
        ORDER BY marks DESC
    ) rank_no
FROM students;
```

Output:

| name  | marks | rank |
| ----- | ----- | ---- |
| Rahul | 95    | 1    |
| Aman  | 90    | 2    |
| Ravi  | 90    | 2    |
| Mohan | 85    | 4    |
| Kunal | 80    | 5    |

Notice:

```text
Rank 3 is skipped
```

---

## Backend Use Case

### Gaming Leaderboard

```sql
SELECT
    username,
    score,
    RANK() OVER (
        ORDER BY score DESC
    ) rank_no
FROM players;
```

Used in:

* PUBG
* Free Fire
* Coding platforms
* Sales dashboards

---

# 3. DENSE_RANK()

## Definition

Works like RANK().

Difference:

No rank numbers are skipped.

---

## Example

```sql
SELECT
    name,
    marks,
    DENSE_RANK() OVER (
        ORDER BY marks DESC
    ) rank_no
FROM students;
```

Output:

| name  | marks | dense_rank |
| ----- | ----- | ---------- |
| Rahul | 95    | 1          |
| Aman  | 90    | 2          |
| Ravi  | 90    | 2          |
| Mohan | 85    | 3          |
| Kunal | 80    | 4          |

---

## Difference Between RANK and DENSE_RANK

| Marks | RANK | DENSE_RANK |
| ----- | ---- | ---------- |
| 95    | 1    | 1          |
| 90    | 2    | 2          |
| 90    | 2    | 2          |
| 85    | 4    | 3          |
| 80    | 5    | 4          |

---

## Backend Use Case

### Top Students Per Shift

```sql
SELECT *
FROM (
    SELECT
        student_id,
        shift,
        marks,
        DENSE_RANK() OVER (
            PARTITION BY shift
            ORDER BY marks DESC
        ) rank_no
    FROM students
) x
WHERE rank_no <= 3;
```

---

# 4. PARTITION BY

## Definition

Creates separate groups inside the result.

Very similar to GROUP BY.

Difference:

GROUP BY merges rows.

PARTITION BY keeps rows.

---

## Example

```sql
SELECT
    name,
    shift,
    marks,
    RANK() OVER (
        PARTITION BY shift
        ORDER BY marks DESC
    ) rank_no
FROM students;
```

Output:

Morning students ranked separately.

Evening students ranked separately.

---

## Backend Use Cases

### Library Shift Ranking

```sql
PARTITION BY shift
```

Morning shift:

```text
1
2
3
```

Evening shift:

```text
1
2
3
```

---

# 5. LAG()

## Definition

Returns previous row value.

---

## Example

Payments:

| Month | Revenue |
| ----- | ------- |
| Jan   | 10000   |
| Feb   | 15000   |
| Mar   | 20000   |

Query:

```sql
SELECT
    month,
    revenue,
    LAG(revenue) OVER (
        ORDER BY month
    ) previous_revenue
FROM revenues;
```

Output:

| Month | Revenue | Previous |
| ----- | ------- | -------- |
| Jan   | 10000   | NULL     |
| Feb   | 15000   | 10000    |
| Mar   | 20000   | 15000    |

---

## Backend Use Cases

* Revenue comparison
* Payment comparison
* Attendance comparison
* Analytics dashboard

---

# 6. LEAD()

## Definition

Returns next row value.

---

## Example

```sql
SELECT
    month,
    revenue,
    LEAD(revenue) OVER (
        ORDER BY month
    ) next_revenue
FROM revenues;
```

Output:

| Month | Revenue | Next  |
| ----- | ------- | ----- |
| Jan   | 10000   | 15000 |
| Feb   | 15000   | 20000 |
| Mar   | 20000   | NULL  |

---

## Backend Use Cases

* Forecasting
* Trend analysis
* User activity prediction
* Financial systems

---

# ROW_NUMBER vs RANK vs DENSE_RANK

| Function   | Duplicate Values | Skip Rank |
| ---------- | ---------------- | --------- |
| ROW_NUMBER | No               | No        |
| RANK       | Yes              | Yes       |
| DENSE_RANK | Yes              | No        |

---

# Real Backend Examples

## 1. Pagination

```sql
SELECT *
FROM (
    SELECT
        id,
        title,
        ROW_NUMBER() OVER (
            ORDER BY created_at DESC
        ) rn
    FROM posts
) x
WHERE rn BETWEEN 11 AND 20;
```

API:

```http
GET /posts?page=2
```

---

## 2. Leaderboard

```sql
SELECT
    user_id,
    points,
    DENSE_RANK() OVER (
        ORDER BY points DESC
    ) rank_no
FROM users;
```

API:

```http
GET /leaderboard
```

---

## 3. Latest Order Per Customer

```sql
SELECT *
FROM (
    SELECT
        customer_id,
        order_id,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC
        ) rn
    FROM orders
) x
WHERE rn = 1;
```

---

## 4. Monthly Revenue Growth

```sql
SELECT
    month,
    revenue,
    revenue -
    LAG(revenue) OVER (
        ORDER BY month
    ) growth
FROM monthly_revenue;
```

---

## 5. Yadav Library Project

### Latest Payment

```sql
SELECT *
FROM (
    SELECT
        student_id,
        amount,
        payment_date,
        ROW_NUMBER() OVER (
            PARTITION BY student_id
            ORDER BY payment_date DESC
        ) rn
    FROM payments
) x
WHERE rn = 1;
```

### Top Paying Students

```sql
SELECT *
FROM (
    SELECT
        student_id,
        shift,
        total_paid,
        DENSE_RANK() OVER (
            PARTITION BY shift
            ORDER BY total_paid DESC
        ) rank_no
    FROM student_payments
) x
WHERE rank_no <= 5;
```

---

# Interview Questions

### Q1. What is a Window Function?

A function that performs calculations across rows while keeping all rows visible.

---

### Q2. Difference Between GROUP BY and Window Function?

GROUP BY reduces rows.

Window Functions keep rows.

---

### Q3. Difference Between RANK and DENSE_RANK?

RANK skips numbers.

DENSE_RANK does not skip numbers.

---

### Q4. How do you get the latest record per customer?

Using ROW_NUMBER() with PARTITION BY customer_id.

---

### Q5. How do you create a leaderboard?

Using RANK() or DENSE_RANK().

---

# Common Mistakes

### Mistake 1

Using GROUP BY instead of Window Functions.

### Mistake 2

Forgetting ORDER BY inside OVER().

### Mistake 3

Using RANK when DENSE_RANK is required.

### Mistake 4

Not using PARTITION BY when group-wise ranking is needed.

---

# Summary

```text
ROW_NUMBER()  -> Unique numbering

RANK()        -> Ranking with gaps

DENSE_RANK()  -> Ranking without gaps

PARTITION BY  -> Create groups

LAG()         -> Previous row value

LEAD()        -> Next row value
```

These are heavily used in:

✔ Banking Systems
✔ E-commerce Systems
✔ Analytics Dashboards
✔ Library Management Systems
✔ Payment Systems
✔ Social Media Platforms
✔ Leaderboards
✔ Reporting Systems
