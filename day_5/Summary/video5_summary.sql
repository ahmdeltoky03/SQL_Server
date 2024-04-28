use ITI

select *
from student

select top (3)* 
from Student

select top (3)* 
from Student
order by St_Age desc

select top(3)  with ties *
from Student
order by St_Age

select top(7)  with ties *
from Student
order by St_Age

--return random id 
select NEWID()

select *,NEWID()
from Student

select *
from Student
order by NEWID()

select top(3)*
from Student
order by newid()

select St_Fname+' '+St_Lname as fullname
from Student
order by fullname

--wrong example
--select St_Fname+' '+St_Lname as fullname
--from Student
--where fullname='ahmed ali'

select St_Fname+' '+St_Lname as fullname
from Student
where St_Fname+' '+St_Lname='ahmed hassan'

select *
from (select St_Fname+' '+St_Lname as fullname
      from Student) as new_table
where new_table.fullname='ahmed hassan'


--execution order
--from
--join
--on
--where
--group
--having
--select
--order by
--top

--[ServerName].DatabaseName.SchemaName.ObjectName
select *
from Student

select *
from [DESKTOP-HG14PB9].iti.dbo.student

select *
from Company_SD.dbo.Departments

-------------------------------------------------------
--DDL

--copy table
select * into table2
from Student

select * into company_sd.dbo.student
from Student

select * into tab4
from Student
where St_Age>1000

--insert into tab4 data that exist in table student 
insert into tab4
select * from Student

select sum(Salary)
from Instructor
having count(Ins_Id)>10

select sum(Salary)
from Instructor
where count(Ins_Id)>10 --error

-------------------------------------------------------

select max(Salary),Dept_Id
from Instructor
group by Dept_Id

-------------------------------------------------------
--Ranking functions
--Row_Number()
--Denes_Rank()
--Ntiles(group)
--Rank()

select *,Row_number() over (order by st_age) as RN
from Student

select *,Dense_Rank() over (order by st_age) as DR
from Student

select *,Row_number() over (partition by dept_id order by st_age desc) as RN
from Student

select *,Dense_Rank() over (partition by dept_id order by st_age desc) as DR
from Student


select *
from (
select *,Dense_Rank() over ( order by st_age) as DR
from Student) as new_table
where DR = 1

select *
from (
select *,Dense_Rank() over (partition by dept_id order by st_age desc) as DR
from Student) as new_table
where DR = 1 and Dept_id is not null

select * from(
select *,ROW_NUMBER() over(order by st_age desc) as RN
        ,DENSE_RANK() over(order by st_age desc) as DR
		,NTILE(3) over(order by Dept_id) as NT
		from Student) as New_table
where DR <= 2

select *
from(
select *,NTILE(4) over (order by st_age) as NT
from Student) as new_table
where NT=4

------------------------------------------------------

--Data Types
--numeric -->>int tinyint smallint bigint bit
--decimal-->>money smallmoney real float decimal
--char-->>char() nchar() varchar() nvarchar()
--datetime-->>date time ......
--binary-->> binary(011110  00001010) image
--others-->>xml unique_identifier sql_variant

------------------------------------------------------

select Ins_Name, Salary,
                case 
				when salary>=3000 then 'high salary'
				when salary<3000 then 'low salary'
				else 'no salary'
				end as Salary_case
from Instructor

select ins_name,Salary,iif(salary>=3000,'high salary','low salary') as Salary_case
from Instructor

update Instructor
set salary = 
case when Salary>=30000 then 1.10*Salary
else 1.20*salary
end

select CONVERT(varchar(50),GETDATE())
select FORMAT(GETDATE(),'dd-MM-yyyy')
select FORMAT(GETDATE(),'dddd MMMM yyyy')

select format(getdate(),'dd')--string
select day(GETDATE()) --int
select format(eomonth(getdate()),'dd')