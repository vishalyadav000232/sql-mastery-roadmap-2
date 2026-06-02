# 📘 DBMS Mastery - Beginner Filtering (Q1–Q10)

## 📋 Overview

In this section, you'll learn the fundamentals of SQL filtering using the `WHERE` clause.

### Topics Covered

* SELECT
* WHERE
* Comparison Operators (`=`, `>`, `<`, `>=`, `<=`)
* Filtering Numeric Data
* Filtering Text Data
* Filtering Date Data

---

# 🏗️ Assumed Table Structure

```sql
employee (
    employee_id,
    name,
    department,
    salary,
    age,
    city,
    joining_date
)
```

---

# 🟢 Q1. Display All Employees

## 🎯 Problem Statement

Display all records from the employee table.

## 💻 SQL Query

```sql
SELECT *
FROM employee;
```

## 📝 Explanation

* `SELECT` retrieves data.
* `*` means all columns.
* No filtering condition is applied.

## 🌍 Real-World Usage

Used by administrators to view all employee records.

---

# 🟢 Q2. Display Employees Working in the IT Department

## 🎯 Problem Statement

Display all employees whose department is IT.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE department = 'IT';
```

## 📝 Explanation

* `WHERE` filters records.
* Only employees from the IT department are returned.

## 🌍 Real-World Usage

Used by HR teams to view department-specific employees.

---

# 🟢 Q3. Display Employees Whose Salary is Greater Than 50,000

## 🎯 Problem Statement

Find employees earning more than ₹50,000.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE salary > 50000;
```

## 📝 Explanation

* `>` means greater than.
* Returns employees whose salary exceeds ₹50,000.

## 🌍 Real-World Usage

Used in payroll and compensation analysis.

---

# 🟢 Q4. Display Employees Whose Age is Less Than 30

## 🎯 Problem Statement

Find employees younger than 30 years.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE age < 30;
```

## 📝 Explanation

* `<` means less than.
* Returns employees below age 30.

## 🌍 Real-World Usage

Used for workforce demographics analysis.

---

# 🟢 Q5. Display Employees Living in Delhi

## 🎯 Problem Statement

Find employees whose city is Delhi.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE city = 'Delhi';
```

## 📝 Explanation

* Filters rows where city equals Delhi.

## 🌍 Real-World Usage

Useful for location-based employee reporting.

---

# 🟢 Q6. Display Employees Whose Salary is Exactly 60,000

## 🎯 Problem Statement

Find employees earning exactly ₹60,000.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE salary = 60000;
```

## 📝 Explanation

* `=` checks for an exact match.

## 🌍 Real-World Usage

Useful when auditing salary records.

---

# 🟢 Q7. Display Employees Who Joined After January 1, 2023

## 🎯 Problem Statement

Find employees hired after January 1, 2023.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE joining_date > '2023-01-01';
```

## 📝 Explanation

* Compares employee joining dates.
* Returns employees who joined after the specified date.

## 🌍 Real-World Usage

Used in hiring reports and recruitment analysis.

---

# 🟢 Q8. Display Employees Whose Department is HR

## 🎯 Problem Statement

Find all employees working in the HR department.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE department = 'HR';
```

## 📝 Explanation

* Filters rows where department is HR.

## 🌍 Real-World Usage

Used by HR managers for department-specific reports.

---

# 🟢 Q9. Display Employees Whose Age is Greater Than or Equal to 30

## 🎯 Problem Statement

Find employees aged 30 or above.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE age >= 30;
```

## 📝 Explanation

* `>=` means greater than or equal to.
* Returns employees whose age is at least 30.

## 🌍 Real-World Usage

Used in workforce planning and seniority analysis.

---

# 🟢 Q10. Display Employees with Salary Less Than 50,000

## 🎯 Problem Statement

Find employees earning less than ₹50,000.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE salary < 50000;
```

## 📝 Explanation

* `<` means less than.
* Returns employees earning below ₹50,000.

## 🌍 Real-World Usage

Useful for payroll budgeting and compensation reviews.

---

# 📚 Quick Revision

## Comparison Operators

```sql
=
>
<
>=
<=
<>
```

## Basic Filtering Syntax

```sql
SELECT column_name
FROM table_name
WHERE condition;
```

### Example

```sql
SELECT *
FROM employee
WHERE city = 'Lucknow';
```

---

# 🎤 Interview Questions

### 1. What is the purpose of the WHERE clause?

The WHERE clause filters records based on a specified condition.

### 2. What is the difference between `=` and `LIKE`?

* `=` performs exact matching.
* `LIKE` performs pattern matching.

### 3. Which operator is used for "greater than or equal to"?

```sql
>=
```

---

# ✅ Learning Outcomes

After completing these questions, you should be able to:

* Retrieve records using SELECT.
* Filter rows using WHERE.
* Work with numeric conditions.
* Work with text conditions.
* Work with date conditions.
* Understand comparison operators.

---

🚀 Next Module: **02_intermediate_filtering.md (Q11–Q20)**

# 📘 DBMS Mastery - Intermediate Filtering (Q11–Q20)

## 📋 Overview

In this section, you'll learn how to combine multiple conditions and perform advanced filtering using:

* AND
* OR
* IN
* NOT
* BETWEEN
* LIKE
* Wildcards (`%`, `_`)

These concepts are heavily used in real-world applications and SQL interviews.

---

# 🏗️ Assumed Table Structure

```sql
employee (
    employee_id,
    name,
    department,
    salary,
    age,
    city,
    joining_date
)
```

---

# 🟡 Q11. Find IT Employees Whose Salary is Greater Than 55,000

## 🎯 Problem Statement

Display employees who work in the IT department and earn more than ₹55,000.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE department = 'IT'
AND salary > 55000;
```

## 📝 Explanation

* `AND` requires both conditions to be true.
* Employee must belong to IT.
* Employee salary must be greater than ₹55,000.

## 🌍 Real-World Usage

Used for identifying high-performing employees within a department.

---

# 🟡 Q12. Find Employees from Delhi Whose Age is Greater Than 30

## 🎯 Problem Statement

Display employees who live in Delhi and are older than 30.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE city = 'Delhi'
AND age > 30;
```

## 📝 Explanation

Both conditions must be satisfied.

## 🌍 Real-World Usage

Used in location-based employee analysis.

---

# 🟡 Q13. Find Employees Working in IT or HR

## 🎯 Problem Statement

Display employees belonging to either IT or HR departments.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE department IN ('IT', 'HR');
```

## 📝 Explanation

`IN` is a shorter and cleaner alternative to multiple OR conditions.

Equivalent:

```sql
SELECT *
FROM employee
WHERE department = 'IT'
OR department = 'HR';
```

## 🌍 Real-World Usage

Used for department-wise reporting.

---

# 🟡 Q14. Find Employees Not Working in Finance

## 🎯 Problem Statement

Display employees who do not belong to the Finance department.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE department <> 'Finance';
```

## 📝 Explanation

* `<>` means NOT EQUAL TO.
* Excludes Finance employees.

## 🌍 Real-World Usage

Useful when generating reports excluding specific departments.

---

# 🟡 Q15. Find Employees Whose Salary is Between 45,000 and 60,000

## 🎯 Problem Statement

Display employees earning between ₹45,000 and ₹60,000.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE salary BETWEEN 45000 AND 60000;
```

## 📝 Explanation

`BETWEEN` includes both boundary values.

Equivalent:

```sql
salary >= 45000
AND salary <= 60000
```

## 🌍 Real-World Usage

Used in payroll and compensation reports.

---

# 🟡 Q16. Find Employees Whose City is Either Delhi or Mumbai

## 🎯 Problem Statement

Display employees from Delhi or Mumbai.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE city IN ('Delhi', 'Mumbai');
```

## 📝 Explanation

Returns employees belonging to either city.

## 🌍 Real-World Usage

Used in regional workforce analysis.

---

# 🟡 Q17. Find Employees Whose Age is Between 25 and 30

## 🎯 Problem Statement

Display employees aged between 25 and 30 years.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE age BETWEEN 25 AND 30;
```

## 📝 Explanation

Includes both 25 and 30.

## 🌍 Real-World Usage

Used in demographic and age-group reporting.

---

# 🟡 Q18. Find Employees Whose Name Starts with "P"

## 🎯 Problem Statement

Display employees whose names begin with the letter P.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE name LIKE 'P%';
```

## 📝 Explanation

* `%` represents zero or more characters.
* Names such as:

  * Priya
  * Pooja
  * Prakash

will be returned.

## 🌍 Real-World Usage

Used in search and autocomplete systems.

---

# 🟡 Q19. Find Employees Whose Name Ends with "a"

## 🎯 Problem Statement

Display employees whose names end with the letter "a".

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE name LIKE '%a';
```

## 📝 Explanation

Examples:

* Neha
* Pooja
* Ananya

## 🌍 Real-World Usage

Useful in pattern-based searching.

---

# 🟡 Q20. Find Employees Whose Name Contains "i"

## 🎯 Problem Statement

Display employees whose names contain the letter "i".

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE name LIKE '%i%';
```

## 📝 Explanation

Examples:

* Vishal
* Priya
* Nitin

## 🌍 Real-World Usage

Used in search functionality and text matching.

---

# 📚 Quick Revision

## AND

```sql
SELECT *
FROM employee
WHERE department = 'IT'
AND salary > 50000;
```

Both conditions must be true.

---

## OR

```sql
SELECT *
FROM employee
WHERE city = 'Delhi'
OR city = 'Mumbai';
```

At least one condition must be true.

---

## IN

```sql
SELECT *
FROM employee
WHERE city IN ('Delhi', 'Mumbai');
```

Cleaner alternative to multiple OR conditions.

---

## BETWEEN

```sql
SELECT *
FROM employee
WHERE salary BETWEEN 45000 AND 60000;
```

Checks whether a value lies within a range.

---

## LIKE

```sql
SELECT *
FROM employee
WHERE name LIKE 'A%';
```

Pattern matching.

---

# 🎤 Interview Questions

### What is the difference between AND and OR?

| AND                         | OR                            |
| --------------------------- | ----------------------------- |
| All conditions must be true | Any one condition can be true |

---

### Why use IN instead of multiple OR statements?

Because it improves readability and maintainability.

Example:

```sql
WHERE city IN ('Delhi', 'Mumbai', 'Lucknow')
```

instead of

```sql
WHERE city='Delhi'
OR city='Mumbai'
OR city='Lucknow'
```

---

### What are SQL Wildcards?

| Wildcard | Meaning                  |
| -------- | ------------------------ |
| `%`      | Any number of characters |
| `_`      | Exactly one character    |

Example:

```sql
SELECT *
FROM employee
WHERE name LIKE '_a%';
```

---

# ✅ Learning Outcomes

After completing this module, you should be able to:

* Combine multiple conditions using AND and OR.
* Use IN for cleaner filtering.
* Exclude records using NOT EQUAL.
* Filter ranges using BETWEEN.
* Search text using LIKE.
* Understand SQL wildcards.

---

🚀 Next Module: **03_sorting.md (Q21–Q30)**

# 📘 DBMS Mastery - Sorting Data (Q21–Q30)

## 📋 Overview

In this module, you'll learn how to sort data using the `ORDER BY` clause.

Sorting is one of the most frequently used SQL operations in:

* Dashboards
* Reports
* E-commerce websites
* HR Management Systems
* Banking Applications

---

# 🏗️ Assumed Table Structure

```sql
employee (
    employee_id,
    name,
    department,
    salary,
    age,
    city,
    joining_date
)
```

---

# 🟠 Q21. Display All Employees Sorted by Salary in Ascending Order

## 🎯 Problem Statement

Display employees from the lowest salary to the highest salary.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY salary ASC;
```

## 📝 Explanation

* `ORDER BY` sorts records.
* `ASC` means Ascending Order.
* Smallest salary appears first.

### Example

Before Sorting:

| Name   | Salary |
| ------ | ------ |
| Vishal | 60000  |
| Rahul  | 45000  |
| Amit   | 75000  |

After Sorting:

| Name   | Salary |
| ------ | ------ |
| Rahul  | 45000  |
| Vishal | 60000  |
| Amit   | 75000  |

---

# 🟠 Q22. Display All Employees Sorted by Salary in Descending Order

## 🎯 Problem Statement

Display employees from highest salary to lowest salary.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY salary DESC;
```

## 📝 Explanation

* `DESC` means Descending Order.
* Highest salary appears first.

### Real-World Usage

Finding highest-paid employees.

---

# 🟠 Q23. Sort Employees by Age from Youngest to Oldest

## 🎯 Problem Statement

Display employees sorted by age.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY age ASC;
```

## 📝 Explanation

Youngest employee appears first.

---

# 🟠 Q24. Sort Employees by Joining Date (Latest First)

## 🎯 Problem Statement

Display the most recently hired employees first.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY joining_date DESC;
```

## 📝 Explanation

Latest joining date appears first.

### Real-World Usage

Recent hiring reports.

---

# 🟠 Q25. Sort Employees Alphabetically by Name

## 🎯 Problem Statement

Display employees in alphabetical order.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY name ASC;
```

## 📝 Explanation

Names are sorted from A → Z.

### Example

```text
Amit
Neha
Priya
Rahul
Vishal
```

---

# 🟠 Q26. Sort Employees by Department and Then Salary

## 🎯 Problem Statement

Sort employees first by department and then by salary.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY department ASC,
         salary ASC;
```

## 📝 Explanation

Step 1:

Group employees by department.

Step 2:

Sort salaries within each department.

### Example

```text
Finance
   45000
   65000

HR
   40000
   50000

IT
   55000
   80000
```

---

# 🟠 Q27. Sort Employees by City and Then Age Descending

## 🎯 Problem Statement

Sort employees by city and within each city sort by age.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY city ASC,
         age DESC;
```

## 📝 Explanation

* Cities sorted alphabetically.
* Employees within a city sorted by age.

---

# 🟠 Q28. Display Top 3 Highest-Paid Employees

## 🎯 Problem Statement

Display the highest-paid 3 employees.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 3;
```

## 📝 Explanation

1. Sort salaries from highest to lowest.
2. Return first 3 records.

### Real-World Usage

Executive salary reports.

---

# 🟠 Q29. Display 2 Youngest Employees

## 🎯 Problem Statement

Display the youngest two employees.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY age ASC
LIMIT 2;
```

## 📝 Explanation

1. Sort age in ascending order.
2. Return first two rows.

### Example

| Name  | Age |
| ----- | --- |
| Priya | 22  |
| Rahul | 23  |

---

# 🟠 Q30. Display Employees Ordered by Salary Descending and Age Ascending

## 🎯 Problem Statement

Sort employees by salary and then by age.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY salary DESC,
         age ASC;
```

## 📝 Explanation

### First Sorting

Salary:

```text
90000
90000
80000
70000
```

### Second Sorting

If two employees have same salary:

```text
90000 → Age 24
90000 → Age 29
```

Youngest employee appears first.

---

# 📚 Quick Revision

## Ascending Order

```sql
SELECT *
FROM employee
ORDER BY salary ASC;
```

### Output

```text
10000
20000
30000
40000
```

---

## Descending Order

```sql
SELECT *
FROM employee
ORDER BY salary DESC;
```

### Output

```text
40000
30000
20000
10000
```

---

## Top N Records

```sql
SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 5;
```

---

## Multiple Sorting Columns

```sql
SELECT *
FROM employee
ORDER BY department,
         salary DESC;
```

---

# 🎤 Interview Questions

### Q1. What is the default sorting order?

Answer:

```sql
ASC
```

Ascending Order.

---

### Q2. Difference Between ASC and DESC?

| ASC              | DESC             |
| ---------------- | ---------------- |
| Lowest → Highest | Highest → Lowest |
| A → Z            | Z → A            |

---

### Q3. How to get the top 10 highest-paid employees?

```sql
SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 10;
```

---

### Q4. Can ORDER BY use multiple columns?

Yes.

```sql
SELECT *
FROM employee
ORDER BY department,
         salary DESC;
```

---

# 🌍 Real-World Usage

Sorting is used in:

* Employee Ranking Systems
* E-Commerce Product Listings
* Banking Transactions
* Social Media Feeds
* Job Portals
* Library Management Systems
* Payroll Applications

---

# ✅ Learning Outcomes

After completing this module, you should be able to:

* Sort records using ORDER BY.
* Use ASC and DESC.
* Sort by multiple columns.
* Retrieve Top N records.
* Combine sorting with LIMIT.
* Solve common interview questions.

---

🚀 Next Module: **04_advanced_filtering_sorting.md (Q31–Q40)**

# 📘 DBMS Mastery - Advanced Filtering & Sorting (Q31–Q40)

## 📋 Overview

In this module, you'll learn advanced SQL concepts frequently asked in interviews and used in real-world applications:

* Aggregate Functions
* Subqueries
* Nested Queries
* Top-N Queries
* String Functions
* Date Functions
* Advanced Filtering Techniques

---

# 🏗️ Assumed Table Structure

```sql
employee (
    employee_id,
    name,
    department,
    salary,
    age,
    city,
    joining_date
)
```

---

# 🔴 Q31. Find Employees Whose Salary is Above the Average Salary

## 🎯 Problem Statement

Display employees whose salary is greater than the average salary of all employees.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);
```

## 📝 Explanation

### Step 1

Calculate average salary:

```sql
SELECT AVG(salary)
FROM employee;
```

Example:

```text
Average Salary = 58,000
```

### Step 2

Return employees earning more than ₹58,000.

## 🌍 Real-World Usage

Used in performance evaluation and compensation analysis.

---

# 🔴 Q32. Find the Highest-Paid Employee

## 🎯 Problem Statement

Display the employee with the highest salary.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 1;
```

## Alternative Solution

```sql
SELECT *
FROM employee
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee
);
```

## 📝 Explanation

* `MAX()` returns the highest salary.
* `LIMIT 1` returns only one employee.

## 🌍 Real-World Usage

Used in executive compensation reports.

---

# 🔴 Q33. Find the Second-Highest Salary

## 🎯 Problem Statement

Find the second-highest salary in the employee table.

## 💻 SQL Query

```sql
SELECT DISTINCT salary
FROM employee
ORDER BY salary DESC
OFFSET 1
LIMIT 1;
```

## Example

```text
90000
85000
70000
60000
```

Result:

```text
85000
```

## 🌍 Interview Importance

One of the most frequently asked SQL interview questions.

---

# 🔴 Q34. Find Employees Who Joined in the Year 2023

## 🎯 Problem Statement

Display employees hired during 2023.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE EXTRACT(YEAR FROM joining_date) = 2023;
```

## 📝 Explanation

Extracts the year from the date and compares it.

## 🌍 Real-World Usage

Used in yearly hiring reports.

---

# 🔴 Q35. Find Employees Whose Name Has Exactly 5 Characters

## 🎯 Problem Statement

Display employees whose names contain exactly five characters.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE LENGTH(name) = 5;
```

## Example

```text
Amit
Neha
Priya
```

Only names with length 5 are returned.

## 🌍 Real-World Usage

Useful in string manipulation exercises and interview questions.

---

# 🔴 Q36. Display Employees Whose Salary is Among the Top 3 Salaries

## 🎯 Problem Statement

Display employees earning one of the top three salaries.

## 💻 SQL Query

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

## Example

```text
90000
85000
80000
```

Employees earning any of these salaries are returned.

## 🌍 Real-World Usage

Top performer analysis.

---

# 🔴 Q37. Find Employees Earning More Than Every HR Employee

## 🎯 Problem Statement

Display employees whose salary is greater than the highest salary in HR.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE salary >
(
    SELECT MAX(salary)
    FROM employee
    WHERE department = 'HR'
);
```

## 📝 Explanation

### Step 1

Find highest HR salary.

### Step 2

Return employees earning more than that amount.

## 🌍 Real-World Usage

Cross-department salary comparisons.

---

# 🔴 Q38. Find Employees from the Same City as Amit

## 🎯 Problem Statement

Display employees who live in the same city as Amit.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE city =
(
    SELECT city
    FROM employee
    WHERE name = 'Amit'
);
```

## 📝 Explanation

The inner query finds Amit's city.

The outer query finds all employees from that city.

## 🌍 Real-World Usage

Location-based employee analysis.

---

# 🔴 Q39. Find Employees Whose Salary is Not Equal to Any HR Employee's Salary

## 🎯 Problem Statement

Display employees whose salary does not match any HR employee salary.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE salary NOT IN
(
    SELECT salary
    FROM employee
    WHERE department = 'HR'
);
```

## 📝 Explanation

Removes employees whose salary appears in the HR department salary list.

## 🌍 Real-World Usage

Salary uniqueness analysis.

---

# 🔴 Q40. Display Employees Sorted by Department Alphabetically and Salary Descending Within Each Department

## 🎯 Problem Statement

Sort employees by department and then by salary.

## 💻 SQL Query

```sql
SELECT *
FROM employee
ORDER BY department ASC,
         salary DESC;
```

## Example

```text
Finance
   90000
   70000

HR
   65000
   50000

IT
   85000
   75000
```

## 🌍 Real-World Usage

Department-wise ranking reports.

---

# 📚 Quick Revision

## Aggregate Functions

```sql
AVG()
MAX()
MIN()
SUM()
COUNT()
```

### Example

```sql
SELECT AVG(salary)
FROM employee;
```

---

## Subquery

```sql
SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);
```

---

## String Function

```sql
SELECT LENGTH(name)
FROM employee;
```

---

## Date Function

```sql
SELECT EXTRACT(YEAR FROM joining_date);
```

---

# 🎤 Interview Questions

### Q1. Difference Between WHERE and HAVING?

| WHERE                | HAVING              |
| -------------------- | ------------------- |
| Filters rows         | Filters groups      |
| Used before GROUP BY | Used after GROUP BY |

---

### Q2. What is a Subquery?

A query inside another query.

Example:

```sql
SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);
```

---

### Q3. How to Find the Nth Highest Salary?

Using:

* LIMIT
* OFFSET
* ROW_NUMBER()
* DENSE_RANK()

---

### Q4. Most Common SQL Interview Questions

1. Highest Salary
2. Second Highest Salary
3. Top 3 Salaries
4. Employees Above Average Salary
5. Same City Employees
6. Salary Comparisons
7. Subqueries
8. Aggregate Functions

---

# 🌍 Real-World Applications

These queries are used in:

* HR Analytics
* Payroll Systems
* Employee Performance Tracking
* Banking Applications
* ERP Systems
* Recruitment Platforms

---

# ✅ Learning Outcomes

After completing this module, you should be able to:

* Use aggregate functions.
* Write subqueries.
* Solve top-N salary problems.
* Work with date functions.
* Work with string functions.
* Solve common SQL interview questions.

---

🚀 Next Module: **05_real_world_interview_questions.md (Q41–Q50)**
# 📘 DBMS Mastery - Real-World SQL Interview Questions (Q41–Q50)

## 📋 Overview

These questions simulate real production scenarios commonly found in:

* E-Commerce Applications
* Banking Systems
* HRMS Platforms
* CRM Systems
* SaaS Products
* Social Media Applications

Most SQL interviews contain similar questions.

---

# 🏗️ Assumed Table Structures

## Users Table

```sql
users (
    user_id,
    name,
    city,
    status,
    created_at,
    last_login
)
```

## Products Table

```sql
products (
    product_id,
    product_name,
    price,
    sold_quantity,
    created_at
)
```

## Orders Table

```sql
orders (
    order_id,
    user_id,
    amount,
    order_date
)
```

## Employee Table

```sql
employee (
    employee_id,
    name,
    department,
    salary,
    joining_date
)
```

---

# 🔥 Q41. Get the Latest 5 Registered Users

## 🎯 Problem Statement

Display the most recently registered users.

## 💻 SQL Query

```sql
SELECT *
FROM users
ORDER BY created_at DESC
LIMIT 5;
```

## 📝 Explanation

* Sort users by registration date.
* Latest users appear first.
* Return only 5 records.

## 🌍 Real-World Usage

Admin dashboard showing newly registered users.

---

# 🔥 Q42. Find All Active Users from Lucknow

## 🎯 Problem Statement

Display active users who belong to Lucknow.

## 💻 SQL Query

```sql
SELECT *
FROM users
WHERE city = 'Lucknow'
AND status = 'Active';
```

## 📝 Explanation

Both conditions must be satisfied:

* City = Lucknow
* Status = Active

## 🌍 Real-World Usage

Regional customer analysis.

---

# 🔥 Q43. Show Products Costing Between ₹500 and ₹2000

## 🎯 Problem Statement

Display products whose prices fall between ₹500 and ₹2000.

## 💻 SQL Query

```sql
SELECT *
FROM products
WHERE price BETWEEN 500 AND 2000;
```

## 📝 Explanation

Returns products within the specified price range.

## 🌍 Real-World Usage

Price-filter functionality on shopping websites.

---

# 🔥 Q44. Find Orders Placed in the Last 30 Days

## 🎯 Problem Statement

Display orders placed during the last 30 days.

## 💻 SQL Query

```sql
SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';
```

## 📝 Explanation

* Current date is calculated automatically.
* Orders from the last 30 days are returned.

## 🌍 Real-World Usage

Monthly sales reports.

---

# 🔥 Q45. Show the Top 10 Highest-Selling Products

## 🎯 Problem Statement

Display products with the highest sales.

## 💻 SQL Query

```sql
SELECT *
FROM products
ORDER BY sold_quantity DESC
LIMIT 10;
```

## 📝 Explanation

* Sort by sold quantity.
* Return top 10 products.

## 🌍 Real-World Usage

Best-seller product section.

---

# 🔥 Q46. Find Customers Whose Names Start with "A"

## 🎯 Problem Statement

Display customers whose names begin with A.

## 💻 SQL Query

```sql
SELECT *
FROM customers
WHERE name LIKE 'A%';
```

## 📝 Explanation

Examples:

```text
Amit
Ankit
Aman
Anjali
```

## 🌍 Real-World Usage

Search and filtering systems.

---

# 🔥 Q47. Display Employees Hired in the Current Year

## 🎯 Problem Statement

Find employees hired during the current year.

## 💻 SQL Query

```sql
SELECT *
FROM employee
WHERE EXTRACT(YEAR FROM joining_date)
=
EXTRACT(YEAR FROM CURRENT_DATE);
```

## 📝 Explanation

Compares joining year with the current year.

## 🌍 Real-World Usage

Annual recruitment reports.

---

# 🔥 Q48. Show the Most Recently Added Product

## 🎯 Problem Statement

Display the latest product added to the catalog.

## 💻 SQL Query

```sql
SELECT *
FROM products
ORDER BY created_at DESC
LIMIT 1;
```

## 📝 Explanation

Returns the newest product.

## 🌍 Real-World Usage

"New Arrivals" section in e-commerce websites.

---

# 🔥 Q49. Get Users Sorted by Last Login Date

## 🎯 Problem Statement

Display users based on recent login activity.

## 💻 SQL Query

```sql
SELECT *
FROM users
ORDER BY last_login DESC;
```

## 📝 Explanation

Most recently active users appear first.

## 🌍 Real-World Usage

User engagement analytics.

---

# 🔥 Q50. Find the Top 5 Highest-Paid Employees in Each Department

## 🎯 Problem Statement

Display the top five highest-paid employees from every department.

## 💻 SQL Query

```sql
SELECT *
FROM
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rn
    FROM employee
) t
WHERE rn <= 5;
```

## 📝 Explanation

### PARTITION BY

Creates separate groups for each department.

### ROW_NUMBER()

Ranks employees within each department.

### Example

```text
IT
1 → 90000
2 → 85000
3 → 80000

HR
1 → 70000
2 → 65000
3 → 60000
```

### Final Step

Return only top 5 employees from each department.

## 🌍 Real-World Usage

Department-wise salary ranking reports.

---

# 📚 Quick Revision

## Date Functions

```sql
CURRENT_DATE
CURRENT_TIMESTAMP
EXTRACT()
DATE_TRUNC()
```

### Example

```sql
SELECT CURRENT_DATE;
```

---

## Window Functions

```sql
ROW_NUMBER()
RANK()
DENSE_RANK()
```

### Example

```sql
SELECT
name,
salary,
ROW_NUMBER() OVER
(
    ORDER BY salary DESC
)
FROM employee;
```

---

## LIMIT

```sql
SELECT *
FROM products
LIMIT 10;
```

Returns only the first 10 rows.

---

# 🎤 Interview Questions

### Q1. Difference Between ROW_NUMBER() and RANK()

| ROW_NUMBER()   | RANK()             |
| -------------- | ------------------ |
| No ties        | Allows ties        |
| Unique ranking | Same rank possible |

---

### Q2. What is a Window Function?

A function that performs calculations across a set of rows while keeping individual rows intact.

Examples:

```sql
ROW_NUMBER()
RANK()
DENSE_RANK()
LEAD()
LAG()
```

---

### Q3. How Do E-Commerce Websites Show Top Products?

```sql
SELECT *
FROM products
ORDER BY sold_quantity DESC
LIMIT 10;
```

---

### Q4. How to Find Recent Records?

```sql
SELECT *
FROM table_name
ORDER BY created_at DESC;
```

---

# 🌍 Real-World Applications

These queries are commonly used in:

* Amazon-like E-Commerce Systems
* Banking Applications
* CRM Platforms
* SaaS Products
* HRMS Systems
* Social Media Platforms

---

# ✅ Learning Outcomes

After completing this module, you should be able to:

* Work with real-world SQL scenarios.
* Filter users and products.
* Analyze sales data.
* Use date-based filtering.
* Use window functions.
* Solve common SQL interview questions.

---

🚀 Next Module: **06_senior_database_designer_challenge.md (Q51–Q60)**
# 📘 DBMS Mastery - Senior Database Designer Challenge (Q51–Q60)

## 📋 Overview

This section focuses on advanced SQL problems that test:

* Joins
* Aggregation
* Grouping
* HAVING
* Subqueries
* Window Functions
* Business Analytics Queries

These are common in:

* Senior SQL Interviews
* Database Developer Interviews
* Backend Developer Interviews
* Data Analyst Roles
* Production Reporting Systems

---

# 🏗️ Assumed Table Structures

## Users Table

```sql
users (
    user_id,
    name,
    city
)
```

## Orders Table

```sql
orders (
    order_id,
    user_id,
    amount,
    order_date
)
```

---

# 🎯 Q51. Find Users Who Never Placed an Order

## Problem Statement

Display users who have never placed an order.

## 💻 SQL Query

```sql
SELECT u.*
FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id
WHERE o.order_id IS NULL;
```

## 📝 Explanation

* `LEFT JOIN` returns all users.
* Users without matching orders will have NULL values.
* Filter those NULL records.

## 🌍 Real-World Usage

Identify inactive customers for marketing campaigns.

---

# 🎯 Q52. Find the Top 5 Customers by Total Spending

## Problem Statement

Display the customers who spent the most money.

## 💻 SQL Query

```sql
SELECT
    u.user_id,
    u.name,
    SUM(o.amount) AS total_spending
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY total_spending DESC
LIMIT 5;
```

## 📝 Explanation

* Calculate total spending per customer.
* Sort descending.
* Return top 5.

## 🌍 Real-World Usage

VIP customer identification.

---

# 🎯 Q53. Find Customers Whose Total Spending Exceeds ₹50,000

## Problem Statement

Display customers spending more than ₹50,000.

## 💻 SQL Query

```sql
SELECT
    u.user_id,
    u.name,
    SUM(o.amount) AS total_spending
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
HAVING SUM(o.amount) > 50000;
```

## 📝 Explanation

* `HAVING` filters aggregated data.
* Used after `GROUP BY`.

## 🌍 Real-World Usage

Premium membership eligibility.

---

# 🎯 Q54. Find the Latest Order of Every Customer

## Problem Statement

Display the most recent order placed by each customer.

## 💻 SQL Query (PostgreSQL)

```sql
SELECT DISTINCT ON (user_id)
       user_id,
       order_id,
       amount,
       order_date
FROM orders
ORDER BY user_id, order_date DESC;
```

## 📝 Explanation

* `DISTINCT ON` is a PostgreSQL feature.
* Keeps the latest order per user.

## Alternative (Window Function)

```sql
SELECT *
FROM
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY user_id
               ORDER BY order_date DESC
           ) rn
    FROM orders
) t
WHERE rn = 1;
```

---

# 🎯 Q55. Find the Customer Who Placed the Most Orders

## Problem Statement

Display the customer with the highest number of orders.

## 💻 SQL Query

```sql
SELECT
    u.user_id,
    u.name,
    COUNT(*) AS total_orders
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY total_orders DESC
LIMIT 1;
```

## 📝 Explanation

* Count orders per user.
* Sort descending.
* Return top customer.

## 🌍 Real-World Usage

Most loyal customer analysis.

---

# 🎯 Q56. Find Orders Placed in the Current Month

## Problem Statement

Display all orders placed during the current month.

## 💻 SQL Query

```sql
SELECT *
FROM orders
WHERE DATE_TRUNC('month', order_date)
=
DATE_TRUNC('month', CURRENT_DATE);
```

## 📝 Explanation

Compares month and year together.

## 🌍 Real-World Usage

Monthly sales reports.

---

# 🎯 Q57. Find Customers Who Ordered More Than 10 Times

## Problem Statement

Display customers with more than 10 orders.

## 💻 SQL Query

```sql
SELECT
    u.user_id,
    u.name,
    COUNT(*) AS total_orders
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
HAVING COUNT(*) > 10;
```

## 📝 Explanation

Uses aggregation and HAVING.

## 🌍 Real-World Usage

Loyalty reward programs.

---

# 🎯 Q58. Find the Highest-Value Order

## Problem Statement

Display the order having the maximum amount.

## 💻 SQL Query

```sql
SELECT *
FROM orders
ORDER BY amount DESC
LIMIT 1;
```

## Alternative

```sql
SELECT *
FROM orders
WHERE amount =
(
    SELECT MAX(amount)
    FROM orders
);
```

## 🌍 Real-World Usage

Large transaction analysis.

---

# 🎯 Q59. Find the Second-Highest Order Amount

## Problem Statement

Find the second-highest order amount.

## 💻 SQL Query

```sql
SELECT DISTINCT amount
FROM orders
ORDER BY amount DESC
OFFSET 1
LIMIT 1;
```

## Example

```text
50000
45000
40000
35000
```

Result:

```text
45000
```

## 🌍 Interview Importance

Classic SQL interview question.

---

# 🎯 Q60. Display Customers Sorted by Total Spending Descending

## Problem Statement

Display customers ordered by total amount spent.

## 💻 SQL Query

```sql
SELECT
    u.user_id,
    u.name,
    SUM(o.amount) AS total_spending
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY total_spending DESC;
```

## 📝 Explanation

* Calculate spending per customer.
* Sort highest spender first.

## 🌍 Real-World Usage

Customer segmentation and analytics.

---

# 📚 Quick Revision

## JOIN Types

```sql
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL JOIN
```

### Example

```sql
SELECT *
FROM users u
JOIN orders o
ON u.user_id = o.user_id;
```

---

## GROUP BY

```sql
SELECT department,
       COUNT(*)
FROM employee
GROUP BY department;
```

---

## HAVING

```sql
SELECT department,
       AVG(salary)
FROM employee
GROUP BY department
HAVING AVG(salary) > 50000;
```

---

## Window Functions

```sql
ROW_NUMBER()
RANK()
DENSE_RANK()
LEAD()
LAG()
```

---

# 🎤 Senior-Level Interview Questions

### Q1. Difference Between WHERE and HAVING?

| WHERE           | HAVING         |
| --------------- | -------------- |
| Filters rows    | Filters groups |
| Before GROUP BY | After GROUP BY |

---

### Q2. Difference Between INNER JOIN and LEFT JOIN?

| INNER JOIN         | LEFT JOIN           |
| ------------------ | ------------------- |
| Matching rows only | All left table rows |

---

### Q3. What is a Window Function?

A function that performs calculations across a set of rows while preserving individual row details.

Example:

```sql
SELECT
name,
salary,
RANK() OVER
(
    ORDER BY salary DESC
)
FROM employee;
```

---

### Q4. Most Asked SQL Interview Problems

1. Highest Salary
2. Second Highest Salary
3. Top N Salaries
4. Latest Record Per Group
5. Customers Without Orders
6. Top Customers
7. Running Total
8. Duplicate Records
9. Ranking Problems
10. Department-wise Highest Salary

---

# 🏆 Final Learning Outcomes

After completing Q1–Q60, you can confidently work with:

✅ Filtering Data
✅ Sorting Data
✅ Pattern Matching
✅ Aggregate Functions
✅ Subqueries
✅ Date Functions
✅ String Functions
✅ Joins
✅ GROUP BY
✅ HAVING
✅ Window Functions
✅ Real-World Business Queries
✅ SQL Interview Questions
✅ PostgreSQL Query Writing

---

# 🚀 What's Next?

Recommended next DBMS Mastery modules:

```text
06_aggregate_functions/
07_group_by_having/
08_joins/
09_subqueries/
10_window_functions/
11_cte_and_views/
12_indexes/
13_transactions_acid/
14_database_design/
15_postgresql_interview_questions/
```

🎉 Congratulations! You have completed the **Filtering & Sorting Mastery (60 SQL Questions)** module.
