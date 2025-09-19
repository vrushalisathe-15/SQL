-- create database
create database stud;

-- use database
use stud;

-- create table 1
create table student(
sid int primary key,
Did int,
dname varchar(20)
);

-- create table 2
create table department(
Did int,
sname varchar(20)
);

-- insert values in student table
insert into student values(1,101,'co'),
(2,102,'cm'),
(3,103,'civil'),
(4,104,'entc');

-- insert values in department table
insert into department values(101,'vrushali'),
(103,'shraddha'),
(104,'gargi'),
(105,'sakshi');

-- inner join
select * from student
inner join department on
student.Did=department.Did;

-- left join
select * from student
left join department on 
student.Did=department.Did;

-- right join
select student.sid,
department.sname
from student
 right join department on
 student.Did=department.Did;
 
 
 -- MYSQL don't support Full outer join 
 -- so we need to use a UNION of LEFT JOIN and RIGHT JOIN.
select student.dname as student_name,
department.sname as dept_name
from student
left join department on student.Did = department.Did
union
select student.dname as student_name,
department.sname as dept_name
from student
right join department on student.Did = department.Did;
