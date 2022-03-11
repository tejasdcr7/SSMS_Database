
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







-------------------------- QUERIES-----------------------

create table Employee
(
employee_Id int identity(1,1),
employee_Name varchar(80),
employee_Age int ,
employee_Address varchar(50),
employee_Salary money,
country varchar(50) DEFAULT 'India',
constraint UC_Employee UNIQUE(employee_Age,employee_Name)
);


insert into Employee (employee_Name,employee_Age,employee_Address,employee_Salary) values ('Tejas',25,'Amravati','50000');
insert into Employee (employee_Name,employee_Age,employee_Address,employee_Salary) values ('om',23,'Amravati','55000');
insert into Employee (employee_Name,employee_Age,employee_Address,employee_Salary) values ('Rushi',21,'Amravati','65000');
insert into Employee (employee_Name,employee_Age,employee_Address,employee_Salary) values ('Krishna',27,'Amravati','80000');



SELECT employee_Name,employee_Address FROM Employee WHERE employee_Age > 22;

SELECT employee_Name,employee_Address FROM Employee WHERE employee_Age > 24;

create table Department(
Department_Id int primary key,
Department_Name varchar(80),
Department_Address varchar(100),
);

select * from Department

insert into Department values (11,'Accounts','Pune')
insert into Department values (2,'cloud','Mumbai')
insert into Department values (3,'DEV','Banglore')
insert into Department values (4,'Hr','Amravati')
insert into Department values (12,'Account','Amravati')

create table Intern(
Intern_Id int,
Intern_Name varchar(70),
Inter_Salary Money,
Department_Id int foreign key references Department(Department_Id)
);

delete from Intern where Intern_Id = 11

insert into Intern values (11,'TEJAS',60000,'1')
insert into Intern values (12,'YASH',50000,'2')
insert into Intern values (13,'OM',55000,'3')
insert into Intern values (14,'OM',55000,'3')
SELECT * FROM Intern

SELECT Inter_Salary from Intern GROUP BY Inter_Salary

SELECT Department_Id, sum(Inter_Salary) from Intern Group by Department_Id having Department_Id=3

SELECT * FROM Department SELECT TOP 2* FROM Intern

SELECT * FROM Department SELECT TOP 2 percent * FROM Intern

/*SELECT Department.Department_Name,Intern.Intern_Name, Intern.Inter_Salary FROM Intern where Inter_Salary=(SELECT MAX(Inter_Salary) FROM Intern)
 JOIN Department ON Intern.Department_Id=Department.Department_Id*/

SELECT * FROM Intern

SELECT * FROM Intern where Inter_Salary=(SELECT MAX(Inter_Salary) FROM Intern)

SELECT * FROM Intern WHERE Intern_Id IN (SELECT Intern_Id FROM Intern WHERE Inter_Salary >55000)

SELECT * FROM Intern WHERE Intern_Name IN (SELECT Intern_Name FROM Intern WHERE Intern_Name = 'TEJAS' )

SELECT * FROM Intern WHERE Intern_Name >ANY (SELECT Intern_Name FROM Intern WHERE Intern_Name = 'TEJAS' )

SELECT * FROM Intern WHERE Intern_Name <ANY (SELECT Intern_Name FROM Intern WHERE Intern_Name = 'TEJAS' )




------------------------------------------------JOINS----------------------------------
CREATE TABLE candidates(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

CREATE TABLE employees(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

SELECT * FROM candidates

SELECT * FROM employees

drop table candidates 
drop table employees

INSERT INTO candidates(fullname) VALUES
	('John Doe'),
    ('Lily Bush'),
    ('Peter Drucker'),
	('Jack Sparrow');


INSERT INTO employees(fullname) VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
	 ('Jane Doe');

	/*Inner join produces a data set that includes rows from the left table, matching rows from the right table.*/

SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    candidates c
    INNER JOIN employees e 
        ON e.fullname = c.fullname;


		/*Left join selects data starting from the left table and matching rows in the right table. The left join 
		returns all rows from the left table and the matching rows from the right table.*/
SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	candidates c
	LEFT JOIN employees e 
		ON e.fullname = c.fullname;


		/*The right join or right outer join selects data starting from the right table. It is a reversed version of the left join*/
SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	candidates c
	RIGHT JOIN employees e 
		ON e.fullname = c.fullname;

/*The full outer join or full join returns a result set that contains all rows from both left and right tables, with the matching 
rows from both sides where available.*/

SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	candidates c
	FULL JOIN employees e 
		ON e.fullname = c.fullname;


