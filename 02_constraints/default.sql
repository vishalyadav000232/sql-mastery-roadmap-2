

-- default constraint is used to set a default value for a column when no value is provided during the isertion of the data into the tahle users .


ALTER TABLE users 
ADD country VARCHAR(50) DEFAULT 'india';

-- 

-- this is the insert statement to insert the data into the table users without providing the value for the country column 


INSERT INTO users(name , email  , country)VALUES('rakesh mishra ', 'rakesh@gmial.com','japan')



-- this is the isert statement to insert the data into the table users with providing the value for the country column 



