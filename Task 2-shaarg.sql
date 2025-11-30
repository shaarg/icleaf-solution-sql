CREATE DATABASE student_database;

CREATE TABLE student_table (
    student_id     INT PRIMARY KEY,
    stu_name       TEXT,
    department     TEXT,
    email_id       TEXT,
    phone_no       NUMERIC,
    address        TEXT,
    date_of_birth  DATE,
    gender         TEXT,
    major          TEXT,
    gpa            NUMERIC,
    grade          TEXT
);


INSERT INTO student_table VALUES
(1, 'Aman Kumar', 'CSE', 'aman@uni.com', 9871111, 'Delhi', '2003-01-12', 'Male', 'AI', 7.8, 'A'),
(2, 'Sara Malik', 'ECE', 'sara@uni.com', 9872222, 'Mumbai', '2002-11-03', 'Female', 'Electronics', 6.4, 'B'),
(3, 'Rahul Roy', 'CSE', 'rahul@uni.com', 9873333, 'Kolkata', '2003-07-22', 'Male', 'ML', 4.9, 'C'),
(4, 'Priya Das', 'ME', 'priya@uni.com', 9874444, 'Pune', '2002-05-19', 'Female', 'Mechanics', 8.2, 'A'),
(5, 'Nikhil Singh', 'EEE', 'nikhil@uni.com', 9875555, 'Chennai', '2003-03-10', 'Male', 'Power', 5.5, 'B'),
(6, 'Anita Rao', 'IT', 'anita@uni.com', 9876666, 'Bangalore', '2002-12-14', 'Female', 'Networking', 9.1, 'A'),
(7, 'Vikas Mehra', 'CSE', 'vikas@uni.com', 9877777, 'Delhi', '2003-09-17', 'Male', 'Data Science', 4.0, 'C'),
(8, 'Kajal Verma', 'ECE', 'kajal@uni.com', 9878888, 'Mumbai', '2003-10-25', 'Female', 'VLSI', 7.2, 'B'),
(9, 'Sahil Khan', 'ME', 'sahil@uni.com', 9879999, 'Kolkata', '2002-08-05', 'Male', 'Robotics', 6.9, 'B'),
(10, 'Neha Sharma', 'IT', 'neha@uni.com', 9870000, 'Chennai', '2003-04-29', 'Female', 'Cybersecurity', 8.8, 'A');



SELECT *
FROM student_table
ORDER BY grade DESC;

SELECT *
FROM student_table
WHERE gender = 'Male';


SELECT *
FROM student_table
WHERE gpa < 5.0;

UPDATE student_table
SET email_id = 'updated_email@uni.com',
    grade = 'B'
WHERE student_id = 3;

SELECT 
    stu_name,
    EXTRACT(YEAR FROM AGE(date_of_birth)) AS age
FROM student_table
WHERE grade = 'B';

SELECT 
    department,
    gender,
    AVG(gpa) AS average_gpa
FROM student_table
GROUP BY department, gender;


ALTER TABLE student_table
RENAME TO student_info;


SELECT stu_name
FROM student_info
ORDER BY gpa DESC
LIMIT 1;





