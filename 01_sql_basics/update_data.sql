
-- Update  data in the users table 

-- update a single record in the users table


UPDATE users SET name = 'vishal yadav' WHERE id  = 2;

-- update multiple records in the users table

UPDATE users SET name = 'vishal.yadav@example.com' WHERE id IN (2, 3, 5);

-- update all records in the users table 

UPDATE users SET name = 'updated name ';

--