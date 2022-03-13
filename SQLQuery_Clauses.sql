
create database Teams

use Teams

create table players(

player_Id int identity(1,1),
player_Name varchar (90),
player_Age int,
player_City varchar(50),
player_Country varchar(50),

);

select * from players

drop table players

insert into players values ('Tejas',25,'Amravati','India');
insert into players values ('Yash',21,'pune','India');
insert into players values ('Akhilesh',23,'banglore','India');
insert into players values ('Shreyash',25,'mumbai','India');
insert into players values ('Jayant',20,'ahemdabad','India');
insert into players values ('Ankit',28,'Hydrabad','India');
insert into players values ('Ashish',21,'Amravati','India');

SELECT MAX(player_Age) from players group by player_City

select * from players ORDER BY player_Age DESC;

select * from players ORDER BY player_City;

select TOP 3 * from players;

select count(player_Id),player_City FROM players GROUP BY player_City;

select count(player_Age),player_City FROM players GROUP BY player_City;

SELECT * INTO PUNE FROM  players WHERE player_City = 'pune';

SELECT * FROM PUNE

SELECT * FROM players WHERE player_Id =3

SELECT player_Name FROM players GROUP BY player_Name

SELECT TOP 2  player_Name FROM players ORDER BY player_Name ASC


------------------------------------------------MULTIPLE JOINS----------------------------------------------


create table Department
(
	Department_ID int primary key,
	Department_Name varchar(55)
)
select * from Department
insert into Department(Department_ID,Department_Name)values(1,'Account')
insert into Department(Department_ID,Department_Name)values(2,'CLOUD')
insert into Department(Department_ID,Department_Name)values(3,'HR')
insert into Department(Department_ID,Department_Name)values(4,'Dev')

create table Genders
(
	Gender_ID int primary key,
	Gender_Name varchar(55)
)
select * from Genders
insert into Genders(Gender_ID,Gender_Name)values(1,'MALE')
insert into Genders(Gender_ID,Gender_Name)values(2,'FEMALE')

create table Employees
(
	Employee_ID int primary key,
	Employee_Name varchar(55),
	Department_ID int foreign key references Department(Department_ID),
	Gender_ID int foreign key references Genders(Gender_ID)
)

insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(1,'SAMIKSHA',1,1)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(2,'SUMIT',1,2)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(3,'SHREYASH',2,1)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(4,'PRAGATI',3,2)


select Employee_Name,Department_Name,Gender_Name from Employees
join Department on Employees.Department_ID = Department.Department_ID
join  Genders on Employees.Gender_ID = Genders.Gender_ID


select Employee_Name,Department_Name,Gender_Name
from Employees
join Department on Employees.Department_ID = Department.Department_ID
join  Genders on Employees.Gender_ID = Genders.Gender_ID
order by Employee_Name asc