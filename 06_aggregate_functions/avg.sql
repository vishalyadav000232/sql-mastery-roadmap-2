


-- AVERAGE AGGREGATE FUNCTION 


-- The AVERAGE aggregate function calculates the average value of a numeric column. It takes a single argument, which is the column name or expression to be averaged. The AVERAGE function ignores NULL values in the calculation. 

-- Example usage of the AVERAGE function to calculate the average price of products in a table called 'products':

SELECT AVG(price) AS average_price
FROM products;


-- In this example, the AVERAGE function is applied to the 'price' column of the 'products' table. The result will be a single value representing the average price of all products in the table. The result is aliased as 'average_price' for better readability.


-- You can als o use the AVERAGE function with a WHERE clause to calculate the average for a specific subset of data. For example, to calculate the average price of products in a specific category:

SELECT AVG(price) AS average_price
FROM prodcuts
WHERE category = 'Electronics';


-- In this example, the average price is calculated category wise for electronics products only.


-- The AVERAGE function can also be used with GROUP BY  to calculate the average for each group of data. for example, to calculate the average price of products for each category :


SELECT category, AVG(price) AS avreage_price
FROM products
GROUP BY category;




-- in this example, the AVERAGE function is applied to the 'price' column for each category in the 'products' table. The result will be a list of categories along with their corresponding averafe price. The result is aliased as 'average_price' for better readability 



-- Note : The AVERAGE function can be used with various numeric data types, such as integers and decimals. The result of the AVERAGE function will be of the same data type as the input column or expression. if the input is an integer, the result will be an integer. if the input is a decimal, the result will be a decimal .


-- In summary, the AVERAGE aggregate function is  a powerful tool for calculating the average value of a numeric column in a SQL database. It can be used with various clauses such as WHERE and GROUP BY to calculate averages for specific subsets of data or for each group of data.


