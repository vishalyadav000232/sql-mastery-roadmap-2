# DBMS Mastery - Filtering & Sorting Practice Questions with Answers

## Assumption

```sql
employee(
    employee_id,
    name,
    department,
    salary,
    age,
    city,
    joining_date
)
```


🟢 Beginner Level (Filtering)
Q1

Display all employees.
Q2
Display employees working in the IT department.
Q3
Display employees whose salary is greater than 50,000.
Q4
Display employees whose age is less than 30.
Q5
Display employees living in Delhi.
Q6
Display employees whose salary is exactly 60,000.
Q7
Display employees who joined after January 1, 2023.
Q8
Display employees whose department is HR.
Q9
Display employees whose age is greater than or equal to 30.
Q10
Display employees with salary less than 50,000.
🟡 Intermediate Level (Multiple Conditions)
Q11
Find IT employees whose salary is greater than 55,000.
Q12
Find employees from Delhi whose age is greater than 30.
Q13
Find employees working in IT or HR.
Q1
Find employees not working in Finance.
Q15
Find employees whose salary is between 45,000 and 60,000
Q16
Find employees whose city is either Delhi or Mumbai.
Q17
Find employees whose age is between 25 and 30.
Q18
Find employees whose name starts with "P".
Q19
Find employees whose name ends with "a".
Q20
Find employees whose name contains "i".
🟠 Sorting Practice
Q21
Display all employees sorted by salary in ascending order.
Q22
Display all employees sorted by salary in descending order
Q23
Sort employees by age from youngest to oldest.
Q24
Sort employees by joining date (latest first).
Q25
Sort employees alphabetically by name.
Q26
Sort employees by department and then salary.
Q27
Sort employees by city and then age descending.
Q28
Display top 3 highest-paid employees.
Q29
Display 2 youngest employees.
Q30
Display employees ordered by salary descending and age ascending.
🔴 Advanced Filtering & Sorting
Q31
Find employees whose salary is above the average salary
Q3
Find the highest-paid employee.
Q33
Find the second-highest salary.
Q34
Find employees who joined in the year 2023.
Q35
Find employees whose name has exactly 5 characters.
Q36
Display employees whose salary is among the top 3 salaries.
Q37
Find employees earning more than every HR employee.
Q38
Find employees from the same city as Amit.
Q39
Find employees whose salary is not equal to any HR employee's salary.
Q40
Display employees sorted by department alphabetically and salary descending within each department.
🔥 Real-World Interview Questions
Q41
Get the latest 5 registered users.
Q42
Find all active users from Lucknow.
Q43
Show products costing between ₹500 and ₹2000.
Q44
Find orders placed in the last 30 days.
Q45
Show the top 10 highest-selling products.
Q46
Find customers whose names start with "A".
Q47
Display employees hired in the current year.
Q48
Show the most recently added product.
Q49
Get users sorted by last login date.
Q50
Find the top 5 highest-paid employees in each department.
🎯 Senior Database Designer Challeng
Consider these tables:

users
(
    user_id,
    name,
    city
)

orders
(
    order_id,
    user_id,
    amount,
    order_date
)
Q51
Find users who never placed an order.
Q52
Find the top 5 customers by total spending.
Q53
Find customers whose total spending exceeds ₹50,000.
Q54
Find the latest order of every customer.
Q55
Find the customer who placed the most orders.
Q56
Find orders placed in the current month
Q57
Find customers who ordered more than 10 times.
Q58
Find the highest-value order
Q59
Find the second-highest order amount.
Q60
Display customers sorted by total spending descending.

---

# 🟢 Beginner Level (Filtering)

## Q1. Display all employees.

```sql
SELECT * FROM employee;
```

## Q2. Display employees working in the IT department.

```sql
SELECT * FROM employee
WHERE department = 'IT';
```

## Q3. Display employees whose salary is greater than 50,000.

```sql
SELECT * FROM employee
WHERE salary > 50000;
```

## Q4. Display employees whose age is less than 30.

```sql
SELECT * FROM employee
WHERE age < 30;
```

## Q5. Display employees living in Delhi.

```sql
SELECT * FROM employee
WHERE city = 'Delhi';
```

## Q6. Display employees whose salary is exactly 60,000.

```sql
SELECT * FROM employee
WHERE salary = 60000;
```

## Q7. Display employees who joined after January 1, 2023.

```sql
SELECT * FROM employee
WHERE joining_date > '2023-01-01';
```

## Q8. Display employees whose department is HR.

```sql
SELECT * FROM employee
WHERE department = 'HR';
```

## Q9. Display employees whose age is greater than or equal to 30.

```sql
SELECT * FROM employee
WHERE age >= 30;
```

## Q10. Display employees with salary less than 50,000.

```sql
SELECT * FROM employee
WHERE salary < 50000;
```

---

# 🟡 Intermediate Level (Multiple Conditions)

## Q11

```sql
SELECT * FROM employee
WHERE department = 'IT'
AND salary > 55000;
```

## Q12

```sql
SELECT * FROM employee
WHERE city = 'Delhi'
AND age > 30;
```

## Q13

```sql
SELECT * FROM employee
WHERE department IN ('IT','HR');
```

## Q14

```sql
SELECT * FROM employee
WHERE department <> 'Finance';
```

## Q15

```sql
SELECT * FROM employee
WHERE salary BETWEEN 45000 AND 60000;
```

## Q16

```sql
SELECT * FROM employee
WHERE city IN ('Delhi','Mumbai');
```

## Q17

```sql
SELECT * FROM employee
WHERE age BETWEEN 25 AND 30;
```

## Q18

```sql
SELECT * FROM employee
WHERE name LIKE 'P%';
```

## Q19

```sql
SELECT * FROM employee
WHERE name LIKE '%a';
```

## Q20

```sql
SELECT * FROM employee
WHERE name LIKE '%i%';
```

---

# 🟠 Sorting Practice

## Q21

```sql
SELECT * FROM employee
ORDER BY salary ASC;
```

## Q22

```sql
SELECT * FROM employee
ORDER BY salary DESC;
```

## Q23

```sql
SELECT * FROM employee
ORDER BY age ASC;
```

## Q24

```sql
SELECT * FROM employee
ORDER BY joining_date DESC;
```

## Q25

```sql
SELECT * FROM employee
ORDER BY name ASC;
```

## Q26

```sql
SELECT * FROM employee
ORDER BY department, salary;
```

## Q27

```sql
SELECT * FROM employee
ORDER BY city ASC, age DESC;
```

## Q28

```sql
SELECT * FROM employee
ORDER BY salary DESC
LIMIT 3;
```

## Q29

```sql
SELECT * FROM employee
ORDER BY age ASC
LIMIT 2;
```

## Q30

```sql
SELECT * FROM employee
ORDER BY salary DESC, age ASC;
```

---

# 🔴 Advanced Filtering & Sorting

## Q31

```sql
SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);
```

## Q32

```sql
SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 1;
```

## Q33

```sql
SELECT DISTINCT salary
FROM employee
ORDER BY salary DESC
OFFSET 1 LIMIT 1;
```

## Q34

```sql
SELECT *
FROM employee
WHERE EXTRACT(YEAR FROM joining_date)=2023;
```

## Q35

```sql
SELECT *
FROM employee
WHERE LENGTH(name)=5;
```

## Q36

```sql
SELECT *
FROM employee
WHERE salary IN
(
    SELECT DISTINCT salary
    FROM employee
    ORDER BY salary DESC
    LIMIT 3
);
```

## Q37

```sql
SELECT *
FROM employee
WHERE salary >
(
    SELECT MAX(salary)
    FROM employee
    WHERE department='HR'
);
```

## Q38

```sql
SELECT *
FROM employee
WHERE city =
(
    SELECT city
    FROM employee
    WHERE name='Amit'
);
```

## Q39

```sql
SELECT *
FROM employee
WHERE salary NOT IN
(
    SELECT salary
    FROM employee
    WHERE department='HR'
);
```

## Q40

```sql
SELECT *
FROM employee
ORDER BY department ASC,
salary DESC;
```

---

# 🔥 Real-World Interview Questions

## Q41

```sql
SELECT *
FROM users
ORDER BY created_at DESC
LIMIT 5;
```

## Q42

```sql
SELECT *
FROM users
WHERE city='Lucknow'
AND status='Active';
```

## Q43

```sql
SELECT *
FROM products
WHERE price BETWEEN 500 AND 2000;
```

## Q44

```sql
SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';
```

## Q45

```sql
SELECT *
FROM products
ORDER BY sold_quantity DESC
LIMIT 10;
```

## Q46

```sql
SELECT *
FROM customers
WHERE name LIKE 'A%';
```

## Q47

```sql
SELECT *
FROM employee
WHERE EXTRACT(YEAR FROM joining_date)=EXTRACT(YEAR FROM CURRENT_DATE);
```

## Q48

```sql
SELECT *
FROM products
ORDER BY created_at DESC
LIMIT 1;
```

## Q49

```sql
SELECT *
FROM users
ORDER BY last_login DESC;
```

## Q50

```sql
SELECT *
FROM
(
    SELECT *,
           ROW_NUMBER() OVER
           (
             PARTITION BY department
             ORDER BY salary DESC
           ) rn
    FROM employee
) t
WHERE rn <= 5;
```

---

# 🎯 Senior Database Designer Challenge

## Tables

```sql
users(
    user_id,
    name,
    city
)

orders(
    order_id,
    user_id,
    amount,
    order_date
)
```

## Q51

```sql
SELECT *
FROM users u
LEFT JOIN orders o
ON u.user_id=o.user_id
WHERE o.order_id IS NULL;
```

## Q52

```sql
SELECT
u.user_id,
u.name,
SUM(o.amount) total_spending
FROM users u
JOIN orders o
ON u.user_id=o.user_id
GROUP BY u.user_id,u.name
ORDER BY total_spending DESC
LIMIT 5;
```

## Q53

```sql
SELECT
u.user_id,
u.name,
SUM(o.amount) total_spending
FROM users u
JOIN orders o
ON u.user_id=o.user_id
GROUP BY u.user_id,u.name
HAVING SUM(o.amount) > 50000;
```

## Q54

```sql
SELECT DISTINCT ON (user_id)
user_id,
order_id,
amount,
order_date
FROM orders
ORDER BY user_id,
order_date DESC;
```

## Q55

```sql
SELECT
u.user_id,
u.name,
COUNT(*) total_orders
FROM users u
JOIN orders o
ON u.user_id=o.user_id
GROUP BY u.user_id,u.name
ORDER BY total_orders DESC
LIMIT 1;
```

## Q56

```sql
SELECT *
FROM orders
WHERE DATE_TRUNC('month',order_date)
=
DATE_TRUNC('month',CURRENT_DATE);
```

## Q57

```sql
SELECT
u.user_id,
u.name,
COUNT(*) total_orders
FROM users u
JOIN orders o
ON u.user_id=o.user_id
GROUP BY u.user_id,u.name
HAVING COUNT(*) > 10;
```

## Q58

```sql
SELECT *
FROM orders
ORDER BY amount DESC
LIMIT 1;
```

## Q59

```sql
SELECT DISTINCT amount
FROM orders
ORDER BY amount DESC
OFFSET 1 LIMIT 1;
```

## Q60

```sql
SELECT
u.user_id,
u.name,
SUM(o.amount) total_spending
FROM users u
JOIN orders o
ON u.user_id=o.user_id
GROUP BY u.user_id,u.name
ORDER BY total_spending DESC;
```

---

# Topics Covered

✅ WHERE
✅ AND
✅ OR
✅ NOT
✅ IN
✅ BETWEEN
✅ LIKE
✅ ORDER BY
✅ LIMIT
✅ OFFSET
✅ Aggregate Functions
✅ Subqueries
✅ GROUP BY
✅ HAVING
✅ Window Functions
✅ Joins
✅ PostgreSQL Interview Questions
✅ Real-World Database Scenarios
