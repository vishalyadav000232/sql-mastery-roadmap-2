


-- Unique constraint ensures that all values in a column are different. It prevents duplicate values in a column .  A table can have multiple unique constraints, and each unieque constraint can consist of one or more columns.


CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE
);

-- this is the insert statement to insert the data into the table users with oroviding the value for the emiail column .

INSERT INTO users(name, email ) VALUES('vishal yradav' , 'vishalyafa@gmail.com');

-- this is the insert statement to insert the data into the table users without providing the value for the email column 

INSERT INTO users(name) VALUES('vishal yadav');

-- ❌ null value in column "email" violates not-null constraint


