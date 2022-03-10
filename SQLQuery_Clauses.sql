
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