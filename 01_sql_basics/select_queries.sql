
-- select all data from the users table 

SELECT * FROM users;

-- selct specific columns from the users table

SELECT name FROM users;

-- select spacific columns with alias

SELECT name AS user_name , email AS user_email from users; 

-- select data with a condition
SELECT * FROM users order by id ASC;

