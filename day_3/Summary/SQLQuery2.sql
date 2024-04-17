------------------------------------
--summary of Day 3
--Joins && Normalizations
------------------------------------
use ITI
--Types of Joins
--1-Cross Join / Chartesian product
--2-Inner Join / Equi Join
--3-Outer Join(left outer join/right outer join/full outer join)
--4-Self Join(unary relationship)
------------------------------------
/*display all tables*/
select * from Student
select * from Course
select * from Department
select * from Ins_Course
select * from Stud_Course
select * from Instructor
select * from Topic

------------------------------------
/*Cross Join*/
select st_fname,dept_name 
from Student,Department

select st_fname,dept_name
from Student Cross join Department

/*Inner Join / Equi Join*/
select st_fname,dept_name 
from Student,Department 
where Department.Dept_Id=Student.Dept_Id

--replace , with inner join && where with on 
select st_fname,dept_name 
from Student inner join Department 
on Department.Dept_Id=Student.Dept_Id

select st_fname,dept_name
from Student S,Department D 
where D.Dept_Id=S.Dept_Id

select st_fname,dept_name 
from Student,Department 
where Department.Dept_Id=Student.Dept_Id and St_Address='Alex'
order by Student.Dept_Id
 
/*outer join*/
select st_fname,dept_name 
from Student left outer join Department 
on Department.Dept_Id=Student.Dept_Id

select st_fname,dept_name 
from Student right outer join Department 
on Department.Dept_Id=Student.Dept_Id

select st_fname,dept_name 
from Student full outer join Department 
on Department.Dept_Id=Student.Dept_Id

/*self join*/


select x.St_Fname as Sname,y.*
from student x,student y
where y.st_id=x.st_super

select x.St_Fname+' '+x.St_Lname as FullName,y.*
from student x,student y
where y.st_id=x.st_super

--syntax is same to inner join
select x.St_Fname as Sname,y.*
from student x inner join student y
on y.st_id=x.st_super

------------------------------------------------------------------------