--DDL
--Date Definition Language
/*create table*/
create table empp
(
SSN int primary key,
Id int,
Fname varchar(10),
Mname varchar(10),
Lname varchar(10),
Gender varchar(7),
BD varchar(20),
Dnum int,
HireDate date default getdate()
)

--alter

/*

alter + add -->> add new column
alter column -->> change column datatype
alter + drop -->> delete column

*/

/*add new coloumn to table*/

alter table empp add age int
alter table empp add Address varchar(20) 

/*change datatype of any coloumn*/

alter table empp alter column age bigint

/*Delete column from table*/

alter table empp drop column age

/*drop table(Delete table)*/
/*drop table empp*/

------------------------------------------------------
--DML
--Data Manipulation Language
--insert-delete-update-merge

/*insert*/
insert into empp(SSN,Id,Fname,Mname,Lname,Gender,BD,Dnum) 
values(1,1,'ahmed','ahmed','ahmed','Male','28/08/2003',1)
     ,(2,2,'mhmd','mhmd','mhmd','Male','28/08/2003',2)
     ,(3,3,'adel','adel','adel','Male','28/08/2003',3)
	 ,(6,6,'a'   ,'b'   ,'c'   ,'Male','28/08/2003',6)
	 
insert into empp (SSN,Id,Fname,Mname,Lname,Gender,BD,Dnum)
values(4,4,'zeze','ahmed','mhmd','Female','28/08/2001',4)
     ,(5,5,'mona','mhmd','ahmed','Female','28/08/2004',5)
     ,(7,7,'aml','adel','ahmed','Female','28/08/2006',7)
	 ,(8,8,'Khoulod'   ,'mhmd'   ,'ahmed'   ,'Female','28/08/2008',8)
/*
insert into empp
values(5,5,'adel','adel','adel','Male','28/08/2003',3,NULL,'Tanta')
*/

/*update*/

update empp
set Fname='Eltokhy',Id=2003
where SSN=1

/*update address*/
update empp 
set address='Tanta'
update empp 
set address='Alex' where SSN=1
update empp 
set address='Cairo' where SSN=2
update empp 
set address='Mansoura' where SSN=3
update empp 
set address='Mansoura' where SSN=5
update empp 
set address='Cairo' where SSN=4
update empp 
set address='Menifoya' where SSN=7
update empp 
set address='Tanta' where SSN=8
/*delete data in table but still exist */
/*delete from empp*/
delete from empp where SSN=6

------------------------------------------------------
--DQL
--Data Query Language

/*display all data*/

select * from empp

/*display row*/
select ID from empp where SSN=1


/*display Employee Table*/
select * from Employee

/*(select column)*/
select SSN,Id from empp

/*display data with primary key*/

select * from empp where SSN=1
select * from empp where SSN=2
select * from empp where SSN=3

/*concatenate*/
select Fname+' '+Mname+' '+Lname as Full_Name from empp

select Fname+' '+Mname+' '+Lname from empp where SSN=1

/*remove repeation*/
select distinct BD from empp 
select distinct Address from empp

select * from empp where Address='Cairo' or Address='Tanta'
select * from empp where (Address='Cairo' or Address='Tanta') and SSN>4

/* in == or */
select * from empp where Address in('Cairo','Tanta')

/*logical error query execute but without any result*/
select * from empp where Address='Cairo' and Address='Tanta'

/*select row according to SSN using (and/between)*/
select * from empp where SSN>=1 and SSN<=4
select * from empp where SSN between 1 and 4

------------------------------------------------------
