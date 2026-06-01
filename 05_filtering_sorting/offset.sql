









--- Offset is used to skip a specific number of rows before starting to return rows from the query. It is often used in conjunction with LIMIT to paginate results. The syntax for using OFFSET is as follows:

/*
SELECT column1, column2 FROM table_name
WHERE condition
ORDER BY column_name
LIMIT number_of_rows OFFSET number_of_rows_to_skip; 


in this syntax, number_of_rows_to_skip is the number of rows that you want to skip before starting to return rows from the query. For example, if you want to skip the first 10 rows and return the next 5 rows, you would use OFFSET 10 and LIMIT 5.

*/


-- Example : 


-- select *  from orders
-- ORDER BY selected_date
-- LIMIT 5 OFFSETS  10;




--- In this examlpl, we are selecting all columns from the orders table , and ordering the results by the selected_date column. we are the using LUMIT 5 to return only 5 rows, and OFFSET 10 to skip the first 10 rows of the result set. This allows us to retrieve a specific subset of the data, which is useful for pagination or when we want to view a specific range of results.




