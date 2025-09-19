-- create database
create database Student;

-- use created database
use Student;

-- create table stud
create table stud(
s_id int primary key,
s_name varchar(20),
s_subject varchar(20),
s_fees int,
s_age int,
s_class varchar(10)
);

-- inserting values in the table
insert into stud values(1,'Vrushali ','Database',4000,20,'TE'),
(2,'Sakshi ','oop',4500,19,'SE'),
(3,'gargi','OS',2000,20,'TE'),
(4,'Nikita','DSA',2000,19,'SE'),
(5,'Shweta','CNS',4000,21,'TE');

 -- Display all the records
 select * from stud;

-- Clauses of sql
--  WHERE clause
select s_name from stud where s_age>19;

-- GROUP BY clause
select s_name,
sum(s_fees) AS t_fee
from stud
group by s_name;

-- ORDER BY clause
select * from stud order by s_fees asc;

-- HAVING clause
select sum(s_fees)
 as t_fees
 from stud
 Having sum(s_fees)>4000;