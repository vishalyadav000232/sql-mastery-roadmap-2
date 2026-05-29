
-- select all data from the users table 

SELECT * FROM users;

-- selct specific columns from the users table

SELECT name FROM users;

-- select spacific columns with alias

SELECT name AS user_name , email AS user_email from users; 

-- select data with a condition
SELECT * FROM users order by id ASC;


-- select data with a LIKE  condition

-- Retrieve all users whose names start with 'vishal'

SELECT * FROM users WHERE name LIKE 'vishal%';

-- retrieve all users whose names end with 'yadav'  

SELECT * FROM users WHERE name LIKE '%yadav';

-- select data with a IN condition  

SELECT * FROM users WHERE id IN (2, 3, 5);  

