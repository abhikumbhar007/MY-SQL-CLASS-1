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



--CONSTRAINTs--
NOT NULL
DEFAULT
CHECK
UNIQUE
PRIMARY KEY

--CREATING TABLES USING CONSTRAINT--:

CREATE TABLE IF NOT EXISTS EMP1_WITH_CONSTRAINTS
(id int NOT NULL,
name VARCHAR(50) NOT NULL,
salary DOUBLE,
hiring_date DATE DEFAULT '2021-01-01',
UNIQUE (id),
CHECK (salary > 1000)
);


SELECT * FROM EMP1_WITH_CONSTRAINTS;

INSERT INTO EMP1_WITH_CONSTRAINTS VALUES(01,'abhi',10000,'2021-01-01');
INSERT INTO EMP1_WITH_CONSTRAINTS VALUES(02,'sahil',2000,DEFAULT);
commit;
rollback;

SELECT * FROM EMP1_WITH_CONSTRAINTS;
INSERT INTO EMP1_WITH_CONSTRAINTS(id,name,salary) VALUES(06,'sahil',2000);


CREATE TABLE IF NOT EXISTS CONSTRAINTS_TMP
(id int NOT NULL,
name VARCHAR(50) NOT NULL,
salary DOUBLE,
hiring_date DATE DEFAULT '2021-01-01',
CONSTRAINT unique_id UNIQUE (id),
CONSTRAINT CHECK (salary > 1000)
);

INSERT INTO CONSTRAINTS_TMP VALUES(01,'abhi',10000,'2021-01-01');
INSERT INTO CONSTRAINTS_TMP VALUES(02,'sahil',2000,DEFAULT);

SELECT * FROM CONSTRAINTS_TMP;

INSERT INTO CONSTRAINTS_TMP VALUES(04,'sahil',2000,DEFAULT);

//---ALTER COMMNAD

SELECT * FROM CONSTRAINTS_TMP;

--ADD A NEW COLUMN(DOB)

ALTER TABLE CONSTRAINTS_TMP ADD DOB DATE;
SELECT * FROM CONSTRAINTS_TMP;

SHOW CREATE TABLE CONSTRAINTS_TMP;1

--CHENGE THE LENGHT OF COLUMN

ALTER TABLE CONSTRAINTS_TMP MODIFY COLUMN name VARCHAR(100);
ALTER TABLE CONSTRAINTS_TMP MODIFY COLUMN id FLOAT;
ALTER TABLE CONSTRAINTS_TMP MODIFY COLUMN id int;

-----DELETE COLUMN FROM TABLE--

ALTER TABLE CONSTRAINTS_TMP DROP COLUMN DOB;
ROLLBACK;
SELECT * FROM CONSTRAINTS_TMP;


-----RENAMING

--REMANE TO SPECIFIC COLUMN-
SELECT * FROM CONSTRAINTS_TMP;

syntax--  ALTER TABLE table_name RENAME COLUMN old name to new name

ALTER TABLE CONSTRAINTS_TMP RENAME COLUMN name to emp_name;

TRUNCATE-- IT DELETES DATA BUT NOT A TABLE SCHEMA
DROP ----IT DELETE WHOLE TABLE INCLUDE ITS SCHEMA

TRUNCATE TABLE CONSTRAINTS_TMP;

DROP TABLE CONSTRAINTS_TMP;

CREATE TABLE IF NOT EXISTS CONSTRAINTS_TMP
(id int,
name VARCHAR(50),
salary DOUBLE,
hiring_date DATE
);

INSERT INTO CONSTRAINTS_TMP VALUES(03,'abhi',10000,'2021-01-01'),(02,'sahil',2000,DEFAULT),(01,'abc',2000,'2021-01-01');

SELECT * FROM CONSTRAINTS_TMP;

----ADD CONSTRAINS IN A TABLE--

ALTER TABLE CONSTRAINTS_TMP ADD CONSTRAINT UNIQUE(id);

drop Table CONSTRAINTS_TMP;

delete from CONSTRAINTS_TMP where hiring_date is null;

show create table CONSTRAINTS_TMP;

CREATE TABLE EMP1
(
emp_id int,
emp_name VARCHAR(50),
age int,
primary key(emp_id)
);

INSERT INTO EMP1 VALUES(01,'abhi',20);
INSERT INTO EMP1 VALUES(2,'a',22);

select * from EMP1;

INSERT INTO EMP1 VALUES(4,'ss',23);
drop table EMP1;

---FOREIGN KEY---


CREATE TABLE CUSTOMER
(
  cust_id int,
  name varchar(50),
  age INT,
  constraint pk primary key (cust_id)
);

CREATE TABLE orders
(
  order_id int,
  amount int,
  customer_id int,
  constraint pk primary key (order_id),
  constraint fk foreign key(customer_id) REFERENCES CUSTOMER(cust_id)

);

select * from CUSTOMER;
select * from orders;
drop table orders;
drop table CUSTOMER;


----SELECT COMMAND---

SELECT * FROM CONSTRAINTS_TMP;

SELECT salary,id from CONSTRAINTS_TMP;
select salary from CONSTRAINTS_TMP where id='1';

select id,name as full_name from CONSTRAINTS_TMP where salary<4000;

select * from CONSTRAINTS_TMP where id is null;

select count(1) from CONSTRAINTS_TMP;
select count(1),salary from CONSTRAINTS_TMP group by salary order by salary;

select id,name,salary as old_salary,(salary + salary * 20/100) as new_salary from employee;





CREATE TABLE Persons (
    PersonID int,

    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
drop table Persons;

CREATE TABLE customer (
    ID int,
    LastName varchar(255),
    salary int,
    City varchar(255)
);

insert into customer VALUES(1,'abhi',3000,'satara'),(2,'raj',4000,'pune'),(3,'sahil',5000,'mumbai'),(4,'ashsih',2000,'pune');
select * from customer;

select * from customer limit 2;

--order by--

select * from customer order by salary desc;

--write a query to display of the employee who is getting maximun salary in the compony.

select * from customer order by salary desc limit 1;

select * from customer order by salary limit 1;

select * from customer where salary>=4000;
select * from customer where salary<5000 and city='pune';
select * from customer where salary between '3000' and '5000';

--LIKE OPERATOR--

---% means zero on more than 0 characters
--- _ means one characters
select * from customer where lastname like'S%';

-- write a query to filter records where name has only exactly 5 characters.
select * from customer where lastname like'_____';
select * from customer where length(lastname)=5;

insert into customer values(null,'sai',null,'nashik'),(5,null,7000,'nashik');

select * from customer where salary is null;
select * from customer where salary is not null;


---GROUP BY CLAUSE---

create table orders_data
(
  cust_id int,
  order_id int,
  country varchar(50),
  state varchar(50)
);

insert into orders_data values(1,100,'USA','seatle');
insert into orders_data values(2,103,'India','UP');
insert into orders_data values(2,101,'India','bihar');
insert into orders_data values(3,102,'USA','seatle');
insert into orders_data values(4,103,'UK','london');
insert into orders_data values(3,120,'India','maharashtra');
insert into orders_data values(5,130,'India','delhi');
insert into orders_data values(6,120,'USA','seatle');
insert into orders_data values(7,101,'India','goa');
insert into orders_data values(15,100,'USA','seatle');

select * from orders_data;

---find the total orders placed within each country.
select country,count(1) as Total_orders from orders_data group by country;

create table if not exists employee(
    id int,
    name VARCHAR(50),
    age int,
    hiring_date date,
    salary int,
    city varchar(50)
);

insert into employee values(1,'Shashank', 24, '2021-08-10', 10000, 'Lucknow');

insert into employee values(2,'Rahul', 25, '2021-08-10', 20000, 'Khajuraho');

insert into employee values(3,'Sunny', 22, '2021-08-11', 11000, 'Bangalore');

insert into employee values(5,'Amit', 25, '2021-08-11', 12000, 'Noida');

insert into employee values(1,'Puneet', 26, '2021-08-12', 50000, 'Gurgaon');
select * from employee;


select age,sum(salary) as age_groyup_salary from employee group by age;

-----calculate min,max,avg

select age,
           sum(salary) as age_groyup_salary,
           max(salary) as age_groyup_salary,
           min(salary) as age_groyup_salary,
           avg(salary) as age_groyup_salary,
           count(*) as age_groyup_salary 
           from employee group by age;


select * from orders_data;

select country,state,count(1) as total_orders from orders_data group by country,state order by country asc;
