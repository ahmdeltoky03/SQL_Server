-----------------------------
--Task day 3
--Lab 1
-----------------------------

use Company_SD

--1.	Display the Department id, name and id and the name of its manager.

select Dnum,Dname,ssn ,fname+' '+lname as FullName
from Departments D,Employee E
where E.SSN=D.MGRSSN

--2.	Display the name of the departments and the name of the projects under its control.

select Dname,Pname 
from Departments D,Project P
where D.Dnum=P.Dnum

--3.   	Display the full data about all the dependence associated with the name of the employee they depend on him/her.

select x.*
from employee x,employee y
where y.SSN=x.Superssn

--4.	Display the Id, name and location of the projects in Cairo or Alex city.

select Pnumber,Pname,Plocation 
from Project
where City='cairo' or city='alex'


--5.	Display the Projects full data of the projects with a name starts with "a" letter.

select pname+'  '+CONVERT(varchar(10),pnumber) +'  '+Plocation+'  '+city+'  '+CONVERT(varchar(10),Dnum) 
from Project
where pname like 'a%'

--6.	display all the employees in department 30 whose salary from 1000 to 2000 LE monthly

select E.* 
from  Employee E,Departments D
where D.Dnum=30 and D.Dnum=E.Dno and E.Salary between 1000 and 2000


--7.	Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.

select e.fname  
from  Employee E inner join Departments D
on D.Dnum=E.Dno and Dnum=10
inner join Project P
on p.Pname='AL Rabwah' and D.Dnum=P.Dnum
inner join Works_for WF
on WF.Hours>=10 and P.Pnumber=WF.Pno


--8.	Find the names of the employees who directly supervised with Kamel Mohamed.

select x.fname+' '+x.lname
as FullData
from employee x , employee y
where y.SSN=x.Superssn and y.SSN=223344

--select x.fname+' '+x.lname
--as FullData
--from employee x , employee y
--where y.SSN=x.Superssn

--9.	Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.

--again
select e.Fname+e.Lname,p.Pname
from Employee e inner join Works_for WF
on e.SSN=wf.ESSn
inner join Project p
on P.Pnumber=wf.Pno
order by p.Pname


--10.	For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.

select p.Pnumber,d.Dname,e.Lname,e.Address,e.Bdate 
from Project p inner join Departments D
on D.Dnum=p.Dnum
inner join Employee E
on e.SSN=d.MGRSSN
where city='cairo'

--11.	Display All Data of the mangers

select * from Employee E,Departments D
where E.SSN=D.MGRSSN


-------------------------------------------------------------------------

--1-Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233, salary=3000.

create table employe(
fname varchar(20),
mname varchar(20),
lname varchar(20),
number int,
ssn   int,
Bdate varchar(50),
superssn int,
salary int
)

--2-Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don�t enter any value for salary or manager number to him.
insert into Employee (Dno,ssn,Fname,Lname,Address,sex)
values(30,102660,'ahmed','eltokhy','tanta','M')
--3-Upgrade your salary by 20 % of its last value
update Employee
set Salary+=.2*Salary