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
