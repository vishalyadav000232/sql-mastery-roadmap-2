

-- Primary key constraint is used to uniquely identify each record in a table. It ensures that the values in the primary key column(s) are unique and not null. A table can have only one primary key constraint, which can consist of one or more columns .


-- create a table called services with the following columns id , name and description . The id column shuld be the primary key of the table .


create table services(
  id SERIAL PRIMARY KEY ,
  name VARCHAR(255) NOT NULL,
  description TEXT
);  


-- this is the insert statement to insert the data into the table services with providing the value for the id column 

INSERT INTO services(id , name , description) VALUES(1 , 'web development' , 'this is a web development service');

-- this is the insert statement to insert the data into the table services without providing the value for the id column 

INSERT INTO services(name , description) VALUES('mobile development' , 'this is a mobile development service');

-- this will work fine because the id column is defined as serial which will  automatically generate a unique value for each new record inserted into the table services . The first record will have id 1 and the second record will have id 2. 






