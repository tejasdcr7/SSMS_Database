
create database company
use company

---------------------NOT NULL CONSTRAINT------------------------
create table Employee
(
employee_Id int identity(1,1),
employee_Name varchar(80)Not Null,
employee_Age int Not Null,
employee_Address varchar(50) Not Null ,
country varchar(50),
);

select * from Employee

insert into Employee values ('Tejas',25,'Amravati','India');
insert into Employee values ('Om',220,'Nagpur','India');
insert into Employee values ('Rushi',25,'Pune','India');
insert into Employee values ('Akshay',27,NUll,'India'); 
/*Cannot insert the value NULL into column 'employee_Address', table 'company.dbo.Employee'; column does not allow nulls.*/

drop table Employee

---------------------------------UNIQUE CONSTRAINT-----------------------------------------
create table Employee
(
employee_Id int identity(1,1),
employee_Name varchar(80),
employee_Age int ,
employee_Address varchar(50),
country varchar(50),
constraint UC_Employee UNIQUE(employee_Age,employee_Name)
);

select * from Employee

insert into Employee values ('Tejas',25,'Amravati','India');
insert into Employee values ('Om',220,'Nagpur','India');
insert into Employee values ('Rushi',25,'Pune','India');
insert into Employee values ('Akshay',28,'kolhapur','India');
insert into Employee values ('Ritesh',30,'Surat','India');
insert into Employee values ('Krishna',25,'Banglore','India');

insert into Employee values ('Tejas',25,'Amravati','India');
insert into Employee values ('Om',220,'Nagpur','India');
/*Violation of UNIQUE KEY constraint 'UC_Employee'. [---Cannot insert duplicate key in object--] 'dbo.Employee'. The duplicate key value is (220, Om)*/

insert into Employee values ('Tejas',23,'Amravati','India');
/*[---If we Change any one value then it will execute Sucessfully---]*/

ALTER TABLE Employee ADD UNIQUE(employee_Address);
/*[---Unique Constraint Using Alter---]*/

drop table Employee


--------------------------------------CHECK CONSTRAINT----------------------------------------
create table Employee
(
employee_Id int identity(1,1),
employee_Name varchar(80),
employee_Age int ,
employee_Address varchar(50),
country varchar(50) check (country = 'India'),
constraint UC_Employee UNIQUE(employee_Age,employee_Name)
);


insert into Employee values ('Tejas',25,'Amravati','India');
insert into Employee values ('Om',220,'Nagpur','India');
insert into Employee values ('Rushi',25,'Pune','India');
insert into Employee values ('Akshay',28,'kolhapur','India');
insert into Employee values ('Ritesh',30,'Surat','India');
insert into Employee values ('Krishna',25,'Banglore','India');

select * from Employee

insert into Employee values ('Tejas',22,'Amravati','Russia');
/*[---The INSERT statement conflicted with the CHECK constraint---]*/

ALTER TABLE employee ADD CONSTRAINT AGE CHECK  (employee_Age >18);

insert into Employee values ('Tejas',15,'Amravati','Russia');
/*[---The INSERT statement conflicted with the CHECK constraint---]*/


-----------------------DEFAULT CONSTRAINT------------

create table Employee
(
employee_Id int identity(1,1),
employee_Name varchar(80),
employee_Age int ,
employee_Address varchar(50),
country varchar(50) DEFAULT 'India',
constraint UC_Employee UNIQUE(employee_Age,employee_Name)
);


insert into Employee (employee_Name,employee_Age,employee_Address) values ('Tejas',25,'Amravati');
insert into Employee (employee_Name,employee_Age,employee_Address) values ('om',23,'Amravati');
insert into Employee (employee_Name,employee_Age,employee_Address) values ('Rushi',21,'Amravati');
insert into Employee (employee_Name,employee_Age,employee_Address) values ('Krishna',27,'Amravati');

select * from Employee

ALTER TABLE Employee ADD CONSTRAINT CITY DEFAULT 'Amravati' FOR employee_Address;

insert into Employee (employee_Name,employee_Age) values ('Ritesh',27);

---------------------------------------------------------------------------------------------------------