--Display (Using Union Function)
 --a-The name and the gender of the dependence that's gender is Female and depending on Female Employee.
 --b-And the male dependence that depends on Male Employee.



use Company_SD
--1
--a
select dependent_name,sex
from dependent
where sex = 'f'

SELECT Dependent_name, Sex
FROM Dependent
WHERE sex='f' and ESSN IN (SELECT SSN 
                           FROM Employee
				           WHERE sex = 'F')
UNION 
SELECT Dependent_name,sex
FROM Dependent
WHERE sex = 'f'

--1
--b
select Dependent_name,sex
from Dependent
where sex = 'm'
union 
select  Dependent_name,sex
from Dependent
where sex='m' and ESSN in (select SSN 
                           from Employee 
			               where sex ='m')

--2-For each project, list the project name and the total hours per week (for all employees) spent on that project.

select Pname,sum(hours) 
from Works_for wf inner join project p
on p.pnumber=wf.pno
group by Pname

--3-Display the data of the department which has the smallest employee ID over all employees' ID.
--??
select top 1 *
from Departments
where dnum in (select top 1 * 
               from employee
			   order by SSN )


--4-For each department, retrieve the department name and the maximum, minimum and average salary of its employees.

select Dname,max(isnull(salary,0)),min(salary)
from Employee E inner join Departments D
on D.Dnum=E.Dno
group by Dname

--5-List the last name of all managers who have no dependents.
--??
select lname 
from Employee

--6-For each department-- if its average salary is less than the average salary of all employees
-- display its number, name and number of its employees.

select d.Dnum,d.Dname,count(e.SSN)
from Departments D inner join Employee E
on D.Dnum=E.Dno
group by d.Dnum,d.Dname
having avg(salary)<(select avg(isnull(salary,0)) from employee)

--select d.Dnum,d.Dname,avg(salary),count(e.SSN)
--from Departments D inner join Employee E
--on D.Dnum=E.Dno
--group by d.Dnum,d.Dname
--having avg(salary)<(select avg(isnull(salary,0)) from employee)


--7-Retrieve a list of employees and the projects they are working on ordered by department and within each department
--, ordered alphabetically by last name, first name.

select e.Fname,p.Pname
from Departments D inner join Employee e
on d.Dnum=e.Dno
inner join Project p
on d.Dnum=p.Dnum
order by d.Dname

--8-Try to get the max 2 salaries using subquery
select top 2 Salary
from Employee
where Salary is not null -- where salary in (select top * from employee where salary is not null order by salary desc)
order by Salary desc

--9-Get the full name of employees that is similar to any dependent name
--??
select distinct(fname+' '+lname) as full_name
from Employee e,Dependent d
where e.SSN=d.ESSN 

--10-Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30% 


select salary
from Employee E inner join Works_for wk
on E.SSN=wk.ESSn
inner join Project p
on p.Pnumber=wk.Pno and Pname='Al Rabwah'

UPDATE employee
SET salary += salary * .30
WHERE employee.SSN in (select Essn 
                       from Works_for wk inner join Project p
					   on p.Pnumber=wk.Pno and Pname='Al Rabwah')


---------------------------------------------------------------------------
--DML
--1-In the department table insert new department called "DEPT IT" , 
--with id 100, employee with SSN = 112233 as a manager for this department.
-- The start date for this manager is '1-11-2006'

insert into Departments(Dname,Dnum,Mgrssn,MgrstartDate)
values ('DEPT IT',100,112233,'1-11-2006')

--2-
insert into Employee(SSN)
values (102672)

update Departments
set MGRSSN=968574
where Departments.Dnum=100

update Employee
set Dno =20
where Employee.SSN=102672

update Employee
set Superssn=102672
where ssn=102660

--3-
--??
delete from Employee
where ssn=223344
