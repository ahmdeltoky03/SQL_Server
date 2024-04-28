
--Task Day_05
--part -1:


use ITI


--1-
select count(st_age)
from Student
where St_Age is not null
--2-
select distinct(Ins_Name)
from Instructor
--3-
select isnull(St_Id,0) as StudentID,
       isnull(St_Fname,' ')+' '+
	     isnull(St_Lname,' ') as fullName,
	     isnull(Dept_Id,0) as DepartmentName
from Student
--4-
select Ins_Name,Dept_Name
from Instructor Ins ,Department D
where D.Dept_Id=ins.Dept_Id
--5-
select  isnull(st.St_Fname,' ')+' '+isnull(st.St_Lname,' ') as FullName,
        isnull(c.Crs_Name,' ') as CourseName 
from Student st inner join Stud_Course sc
on st.St_Id=sc.St_Id and sc.Grade is not null
inner join Course c
on c.Crs_Id=sc.Crs_Id
--6-
select count(crs_id),Top_Id
from course 
group by Top_Id
--7-
select max(salary) as max_salary,
       min(salary)as min_salary
from Instructor
--8-
select *
from Instructor
--where Salary < 14604.2666
where Salary< (select avg(Salary) from Instructor)
--9-
select Dept_Name 
from Department
where Dept_Id in (select top (1)Dept_Id as new from Instructor
                  order by Salary)

--10-
select top (2) Salary
from Instructor
order by Salary desc
--11-
select Ins_Name,coalesce(salary,'bonus') as Salary
from Instructor

--12-
select AVG(Salary) as Average_Salary
from Instructor
--13-
select x.St_Fname,y.* 
from Student x,Student y
where y.St_Id=x.St_super
--14-
select Salary,Dept_Id,RN 
from(
select *,Row_number() over (partition by dept_id order by salary desc) as RN
from Instructor) as New_table
where RN<=2

--15-
select * 
from(
select *,Row_number() over (partition by dept_id order by salary desc) as RN
from Instructor) as New_table
where RN=1
