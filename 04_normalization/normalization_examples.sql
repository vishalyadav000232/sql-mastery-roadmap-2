



/*====================================================
 NORMALIZATION PRACTICE FILE
 PostgreSQL
 UNF → 1NF → 2NF → 3NF → BCNF → DENORMALIZATION

 Author: Yadavji DBMS Mastery
=====================================================*/



-- UNF (Unnormalized Form)

CREATE TABLE library_unf(
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL ,
  books TEXT
);



-- inserting data into the unf .


INSERT INTO library_unf (name, books)
VALUES
('Alice', 'Book A, Book B'),
('Bob', 'Book C'),
('Charlie', 'Book D, Book E, Book F');

SELECT * FROM  library_unf;

/*
Problems:

1. Multiple values in one column
2. Difficult searching
3. Difficult filtering
4. Not Atomic

NOT IN 1NF
*/




-- 1NF (First Normal Form)

CREATE TABLE library_1nf(
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL ,
  book VARCHAR(100) NOT NULL
);  


-- inserting data into 1nf 


INSERT INTO library_1nf(name, book) VALUES
('Alice', 'Book A'),
('Alice', 'Book B'),
('Bob', 'Book C'),
('Charlie', 'Book D'),
('Charlie', 'Book E'),
('Charlie', 'Book F');


SELECT * FROM library_1nf;


/*
1NF Rule:

One Cell = One Value

Problem Remaining:

Student information repeats.
*/



-- 2NF (Second Normal Form)


CREATE TABLE library_2nf(
  stu_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,

)


CREATE TABLE library_books_2nf(
  book_id SERIAL PRIMARY KEY,
  stu_id INT,
  book VARCHAR(100) NOT NULL,
  

  FOREIGN KEY(stu_id)
  REFERENCES library_2nf(stu_id)
  ON DELETE CASCADE
)


--- inserting data into 2nf 


INSERT INTO library_2nf(name) VALUES
('Alice'),
('Bob'),
('Charlie');


INSERT INTO library_books_2nf(stu_id, book) VALUES
(1, 'Book A'),
(1, 'Book B'),
(2, 'Book C'),
(3, 'Book D'),
(3, 'Book E'),
(3, 'Book F');



SELECT * FROM library_2nf;

SELECT * FROM library_books_2nf;




/*
2NF Rule:

Remove Partial Dependency

Student information stored once.
Course information stored once.
*/

-- 3NF (Third Normal Form)


CREATE TABLE library_3nf(
  stu_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INT NOT NULL


)

CREATE TABLE library_books_3nf(
  book_id SERIAL PRIMARY KEY,
  stu_id INT,
  book VARCHAR(100) NOT NULL,
  

  FOREIGN KEY(stu_id)
  REFERENCES library_3nf(stu_id)
  ON DELETE CASCADE
)


--- inserting data into 3nf

INSERT INTO library_3nf(name ,age)VALUES
('alice' , 23),
('bob' , 30),
('charlie' , 25);


INSERT INTO library_books_3nf(stu_id , book)VALUES
(1,'book a'),
(1,'book b'),
(2,'book c'),
(3,'book d'),
(3,'book e'),
(3,'book f');



SELECT * FROM library_3nf;
select * FROM library_books_3nf;


/*
3NF Rule:

Remove Transitive Dependency

Department information
stored separately.
*/

--- BCNF (Boyce-codd Normal Form)



/*====================================================
 SECTION 5 : BCNF
=====================================================*/

CREATE TABLE instructors_bcnf(

    instructor_id SERIAL PRIMARY KEY,
    instructor_name VARCHAR(100)

);

CREATE TABLE courses_bcnf(

    course_id SERIAL PRIMARY KEY,

    course_name VARCHAR(100),

    instructor_id INT,

    FOREIGN KEY(instructor_id)
    REFERENCES instructors_bcnf(instructor_id)

);

CREATE TABLE student_courses_bcnf(

    student_id INT,
    course_id INT,

    PRIMARY KEY(student_id, course_id),

    FOREIGN KEY(course_id)
    REFERENCES courses_bcnf(course_id)

);

INSERT INTO instructors_bcnf
(instructor_name)
VALUES
('Amit'),
('Neha');

INSERT INTO courses_bcnf
(course_name,instructor_id)
VALUES
('DBMS',1),
('SQL',2);

INSERT INTO student_courses_bcnf
VALUES
(1,1),
(2,1),
(1,2);

SELECT * FROM instructors_bcnf;
SELECT * FROM courses_bcnf;
SELECT * FROM student_courses_bcnf;


/*
BCNF Rule:

Every Determinant
Must Be Candidate Key
*/


/*====================================================
 SECTION 6 : DENORMALIZATION
=====================================================*/

CREATE TABLE orders_denormalized(

    order_id SERIAL PRIMARY KEY,

    customer_id INT,

    customer_name VARCHAR(100),

    product_name VARCHAR(100)

);

INSERT INTO orders_denormalized
(customer_id,customer_name,product_name)

VALUES
(1,'Rahul','Laptop'),
(1,'Rahul','Keyboard'),
(2,'Aman','Mouse');

SELECT * FROM orders_denormalized;


/*
Denormalization

Pros:
Fast Reads
Less JOINs

Cons:
Data Duplication
More Storage
Update Complexity
*/


