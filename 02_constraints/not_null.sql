
--  not null constraint is used to ensure that a column cannot have a null  value. It is used to  enforce the data integrity and ensure that the required data is always present in the table . 

create table users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);


--  this is the insert statement to insert the data into the table users with providing the value for the name and email column


insert into users(name , email ) values('vishal yadav' , 'vishal@gmail.com');


-- this is the insert statement to insert the data into the table users without providing the value for the name column 

insert into users(email) values('vishal@gmail.com');




-- ❌ null value in column "name" violates not-null constraint


-- this is the insert statement to insert the data into the table users without providing the value for the email column 


insert into users(name) values('Rahul mishra');


-- ❌ null value in column "email" violates not-null constraint



-- practice questions 


-- create a table called products with the following columns id , name ,  price and description . The name and price columns should have not null constraint and the price column should have a check constraint to ensure that the price is greater than 0 .

CREATE TABLE products(
  id SERIAL PRIMARY KEY ,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10 , 2) NOT NULL CHECK (price > 0),
  description TEXT
)

INSERT INTO products(name , price , description) VALUES
('laptop' , 50000.00 , 'this is a laptop'),
('mobile' , 20000.00 , 'this is a mobile phone'),
('headphones' , 5000.00 , 'these are headphones');


-- this is the insert statement to insert the data into the table products without providing the value for the name columne 

INSERT INTO products(price , description)
VALUES(1000.00 , 'This is a')


-- ❌ null value in column "name" violates not-null constraint 












