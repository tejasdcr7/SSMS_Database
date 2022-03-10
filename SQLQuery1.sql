
create database students;
use students;
create table studentinfo
(
studentId int,
studentName varchar(80),
studentAge int,
city varchar(50),
country varchar(50),
);

select * from studentinfo
alter table studentinfo add bloodGroup varchar(10);

insert into studentinfo values('01','Tejas','24','Amravati','India','A');
insert into studentinfo values('02','Om','20','Amravati','India','B');
drop table studentinfo;
insert into studentinfo values('03','Samiksha','21','Pune','India','A');
insert into studentinfo values('04','Akshay','26','Mumbai','India','B');
insert into studentinfo values('03','Krishna','25','Pune','India','A');
insert into studentinfo values('04','Rushikesh','24','Pune','India','B');

update studentinfo set studentName ='sami', city = 'Nagpur' where studentId = 01;
update studentinfo set studentName ='Tejas', city = 'Amravati' where studentId = 01;
update studentinfo set studentName ='sami', city = 'Nagpur' where studentId = 03;