CREATE DATABASE student_management;

USE student_management;

CREATE TABLE Student(
 id INT,
 name VARCHAR(200),
 age INT,
 country VARCHAR(50)
);

CREATE TABLE Class(
 id INT,
 name VARCHAR(200)
);

CREATE TABLE Teacher(
 id INT,
 name VARCHAR(200),
 age INT,
 country VARCHAR(50)
);

SELECT * FROM `class`;
SELECT * FROM `student`;
SELECT * FROM `teacher`;