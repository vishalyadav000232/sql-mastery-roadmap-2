


-- Relationships between tables are created using foreign keys. A foreign key is a column (or set of columns) in one table that references the primary key of another table. this allows us to establish a link beteen the two tables and enforce referential integrity.

-- type of relationship :


-- 1. One-to-One Relationship: In this type of relationship, each record in one table is related to only one record in another table. For example, a person can have only one passport , and a passport can be assigned to only one person.



CREATE TABLE person(
  person_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INT NOT NULL,

);


CREATE TABLE passport(
  passport_id SERIAL PRIMARY KEY,
  person_id INT UNIQUE,
  passport_number VARCHAR(20) NOT NULL,

  FOREIGN KEY (person_id)
  REFERENCES person(person_id)
  ON DELETE CASCADE

)

-- 2. One-to-Many Relationship: In this type of relationship, each record in one table can be related to multiple records in another table. For example, a customer can place multiple orders, but each order is placed by only one customer.



CREATE TABLE customer(
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL
);  


CREATE TABLE orders(
  order_id SERIAL PRIMARY KEY,
  customer_id INT,
  order_date DATE NOT NULL,

  FOREIGN KEY (customer_id)
  REFERENCES customer(customer_id)
  ON DELETE CASCADE
);



-- 3. Many-to-Many Relationship: In this type of relationship, each record in one table can be related to multiple records in anther table, and vice versa. For example, a student can enroll in multiple courses, and a course can have multiple students enrolled. To implement a many-to-many relationship, we typically use a junction table (also known as an associative table) that contains foreign keys referencing the primary keys of the related tables .


CREATE TABLE student(
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INT NOT NULL
);

CREATE TABLE course(
  course_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  credits INT NOT NULL
);

CREATE TABLE student_course(
  student_id INT,
  course_id INT,
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE
);


-- In this example, the student_course table serves as a junction table that establishes a many-to-many relationship between the student and course tables. Each record in the student_course table represents an enrollment of a student in a course, with foreign keys referencing the primary keys of the student and course tables.




