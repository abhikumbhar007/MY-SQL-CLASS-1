--command to create database-
CREATE DATABASE test1;

use test1;
--command to create new table-
create table InsertMultipleRowsDemo
(
  Id int,
Name varchar(200),
 Age int
 );

 show tables;

--Insert records in the table--
 insert into InsertMultipleRowsDemo(Id,Name,Age) values(1,'John',23),(2,'Carol',24),(3,'Johnson',21),(4,'Smith',20),(5,'David',26);
 select * from InsertMultipleRowsDemo;

--insert specific records in the table--

insert into InsertMultipleRowsDemo(id,age)values(6,12),(12,22),(22,33);


