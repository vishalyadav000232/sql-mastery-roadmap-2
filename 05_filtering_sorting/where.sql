








--- FILTERING ANS  SORTING DATA WITH WHEWRE 



SELECT * FROM customers
WHERE city = 'London';


-- The WHERE clause is used to filter records that meet a certain condition, In this case, it retrieves all customers whose city is 'London'. You can use  various operators in the WHERE clause, such as =, <, >, <=,>=, <>, AND, OR,etc.to check for different conditions. For Example, you can use the AND operator to combine multiple conditions:



SELECT * FROM customers
WHERE city = 'London' AND country = 'UK';




-- this query retrieves all customers whose city is 'London' and country is'uk'. you can also use the OR operator to retrieve records that meet at least one of the condotions :



SELECT * FROM customers
WHERE city = 'london' OR city= 'Paris';


-- this query retrieves all customers whose city is either 'london' or 'paris ' you can also use the NOT operator to exclude records  that meet a certain condition :


SELECT * FROM customers
WHERE NOT city = 'london';


-- this query retrieves all customers whose city is not 'k=london' you can also use the In oprator to soecify multiple values in a WHERE clause :


