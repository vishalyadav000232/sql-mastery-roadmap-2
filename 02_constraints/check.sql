ALTER TABLE users
ADD age INT DEFAULT 18,
CONSTRAINT chk_age
CHECK (age >= 18 AND age <= 100);

-- this is the insert statement to insert the data into the table users with the age value that satisfies the check constraint 

-- iserted the  valid record inti the users tabele 


INSERT INTO users (name , email , age) VALUES('vishal tivari ' , 'vishalyadavtivar@gnail.com', 22);

--inserted the invalid record into the users table with the age value that does not satisfy the check constraint


INSERT INTO users (name , email ,age ) VALUES(
  'golu'
, 'golu@gmail.com, ',  17
);


--  ❌ new row for relation "users" violates check constraint "chk_age"



-- CHECK CONSTRAINTS with IN and AND 

ALTER TABLE users
ADD CONSTRAINT chk_email CHECK (email LIKE '%@%' AND email LIKE '%.%'); 

-- this is the insert statement to insert the data into the table users with the email value that satisfies the check constraint 

INSERT INTO users (name , email , age) VALUES('vishal tivari ' , 'vishalyadavtivar@gmail.com', 22); 


-- this is the insert statement to insert the data into the table users with the email value that dees not satisfy the check constriant

INSERT INTO users (name , email , age) VALUES('golu_bhia', 'jkdfkjlka', 22)



-- ❌ new row for relation "users" violates check constraint "chk_email"



-- complete example of check constraints with multiple columes


CREATE TABLE orders (
    id SERIAL PRIMARY KEY,

    amount DECIMAL(10,2)
    CHECK(amount > 0),

    payment_method VARCHAR(20)
    CHECK(payment_method IN ('UPI', 'CARD', 'CASH')),

    status VARCHAR(20)
    DEFAULT 'PENDING'
    CHECK(status IN ('PENDING', 'SUCCESS', 'FAILED'))
);