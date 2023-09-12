create database student_management;

use student_management;

create table Student(
 id int,
 name varchar(200),
 age int,
 country varchar(50)
);

create table Class(
 id int,
 name varchar(200)
);

create table Teacher(
 id int,
 name varchar(200),
 age int,
 country varchar(50)
);

select * from `class`;
select * from `student`;
select * from `teacher`;