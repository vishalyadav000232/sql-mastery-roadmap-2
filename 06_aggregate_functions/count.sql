


-- COUNT AGGREGATE FUNCTION 


-- The COUNT aggregate function is used to count the number of rows in a table or the number of non-NULL values in a specific column. It takes a single argument, which can be either an asterisk (*) to count all rows or a column name to count non-NULL values in that column. 



-- Example usage of the COUNT function to count the total number of rows in a table called 'orders':


select count(*) as total_orders
from orders;


-- In this example, the COUNT function is applied to the entire table using the asterisk (*), which count all rows.



-- You can also use the COUNT function to count non-NULL values in a specific column. For exmple, to count the number of non-NULL values in the 'customer_id' column of the 'orders_table'


select count(customer_id) as total_customers
from orders;


-- In this example, the count function is applied to the 'customer_id' column, which counts the number of non-NULL values in that column. The result is aliased as 'total_customers' for better readability.



-- The count function can also be used with a WHERE clause to count rows that meet specific conditions.for example, to count the number of orders placed by   a specific customer :



SELECT COUNT(*) AS total_orders
FROM orders
WHERE customer_id = 234;



-- You can also use the COUNT function with GROUP BY to count the number of rows for each group of data.


SELECT category, COUNT(*) AS total_products
from products
GROUP BY category;


-- in this example, the count fucntions counts row category wise for each category in the 'products' tbale.


-- NOTE : the count function can be used with various data types, and the result will always be an integer repesenting the count of rows or non-NULL values. When using COUNT with a specific column, it will only count non-NULL values, while using COUNT with an asterisk (*) will count all rows regardless of NULL values.


--