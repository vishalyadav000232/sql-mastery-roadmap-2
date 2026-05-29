
-- CREATE TABLE students(
--   student_id SERIAL PRIMARY KEY,
--   name VARCHAR(255) NOT NULL
-- );


-- CREATE TABLE courses(
--   id SERIAL PRIMARY KEY,
--   student_id INT,
--   name VARCHAR(255) NOT NULL,

--   CONSTRAINT fk_students
--   FOREIGN KEY (student_id)
--   REFERENCES students(student_id)
--   ON DELETE CASCADE
-- );


-- SELECT * FROM courses;


-- -- SELECT * FROM students;
-- SELECT * FROM courses;
-- INSERT INTO students (name) VALUES('vishal yadav');

-- -- 
-- INSERT INTO courses(student_id , name) VALUES(1 , 'sql')

-- -- this will work fine because there is a student with id 1 in students table 


-- INSERT INTO courses(student_id , name) VALUES(1 , 'dbms')


-- -- this will give the error beacuse there is no student with id 2 in students table 


-- INSERT INTO courses(student_id , name) VALUES(2 , 'dbms')




-- -- Forign key constraint practice questions 

-- -- create two tables one is employee and another is department
-- -- employee table will have employee_id as primary key and department_id as foreign key referncing department_id in department table 



-- CREATE TABLE  department(
--   department_id SERIAL PRIMARY KEY ,
--   department_name VARCHAR(255) NOT NULL 
-- );

-- CREATE TABLE employee(
--   employee_id SERIAL PRIMARY KEY ,
--   name VARCHAR(255) NOT NULL,
--   department_id  INT,

--   CONSTRAINT fk_department
--   FOREIGN KEY (department_id)
--   REFERENCES department(department_id)
--   ON DELETE CASCADE




INSERT INTO department(department_name) VALUES('computer science ');
-- );

INSERT INTO employee(name, department_id)
VALUES('Vishal', 1);
