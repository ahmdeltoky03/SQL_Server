use ITI

select salary
from Instructor

select sum(Salary)
from Instructor 

select avg(salary) as average_salary
from Instructor

select sum(Salary)/COUNT(*) as average_salary
from Instructor 
 
select sum(salary),Dept_Id
from Instructor
group by Dept_Id

select avg(salary),Dept_Id
from Instructor
group by Dept_Id
having avg(Salary)>5000

select sum(salary),Dept_Id
from Instructor
where Salary>1000
group by Dept_Id


------------------------------------------------------
--subqueries

select *
from student
where St_Age<(select avg(st_age) from Student)


select *,(select count(st_id) from Student)
from Student

select Dept_Name 
from Department
where Dept_id in (select dept_id
                  from Student 
				  where Dept_Id is not null)

select distinct(Dept_Name) 
from Department D inner join Student S
on d.Dept_Id=s.Dept_Id 


------------------------------------------------------
--subqueries + DML

delete from Stud_Course
where st_id in (select st_id 
                from Student
				where St_Address='cairo')

------------------------------------------------------
--union family
--union all union intersect except

select st_fname 
from Student
union all
select ins_name
from Instructor

select st_fname 
from Student
union
select ins_name
from Instructor

------------------------------------------------------

select St_Fname,St_Age,St_Id
from Student
order by 1 --first column

select St_Fname,St_Age,St_Id
from Student
order by 2 --seceond column

select St_Fname,St_Age,St_Id
from Student
order by St_Age,St_Id

select St_Fname,St_Age,St_Id
from Student
order by St_Id asc ,St_Age desc


------------------------------------------------------
--built in functions
--aggregate functions 
--count min max avg sum isnull coalesce concat convert
select year(getdate())
select month(getdate())
select day(getdate())
select getdate()

select SUBSTRING(st_fname,1,3)
from Student

select db_name()

select suser_name()