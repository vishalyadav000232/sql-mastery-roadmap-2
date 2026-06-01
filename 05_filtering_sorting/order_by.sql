








--- sorting data  by a specific column is a common operation in SQL. The ORDER BY clause is used to sort the result set by one or more columns. The syntax for using the ORDER BY clause is as follows:

-- Select col1, col2, ... from table_name
-- where condition
-- order by col_name[assc | desc], col2_name[asc | desc ]


-- In this syntax, col_name is the name of the column by which you want to sort the results. You can specify multiple columns to sort by, and you can also specify the sorting order (ascending oor descending) for each column. By default, the sorting order is ascending (ASC), but you can use the DESC keyword to sort in descending order.


-- Example : 




SELECT * FROM orders
ORDER BY order_date DESC;   



-- In this example, we are selecting all columns from the orders table and ordering the results by the order_date column in descending order. This means that the most recent orders will be displayed first in the result set. If we wanted to sort the results in ascending order (oldest order first), we would simply omit the DESC keyword or use ASC instead.

-- you can also sort by multiple columns. For example, if you want to sort the orders first by customer_id in ascending order and then by order_date in descending order, you would use the following query:



SELECT * FROM orders
ORDER BY customer_id ASC, odrder_date DESC;


-- In this example. we are sorting the order first by customer_id in asc and secondly by order_date in desc.



-- by defualt ORDER BY sorts the results in ascending order.

SELECT * FROM orders
WHERE order_date > '2023-01-01'
ORDER BY selected_date;


---

