--Mamy Queries
--Task day2

--1-Display all the employees Data.
select * from EMPLOYE


--2-Display the employee First name, last name, Salary and Department number.
select FNAME,LNAME,SALARY,DNO from EMPLOYE


--3-Display all the projects names, locations and the department which is responsible about it.
select PNAME,PLOCATION,DNUM from PROJECT 


--4-If you know that the company policy is to pay an annual commission for each employee with specific percent equals 10% of his/her annual salary......
--Display each employee full name and his annual commission in an ANNUAL COMM column (alias).
/*update salary then select*/
update EMPLOYE
set SALARY+= SALARY*.1

select (FNAME+' '+MINIT+' '+LNAME),(SALARY),SALARY as alias from EMPLOYE


--5-Display the employees Id, name who earns more than 1000 LE monthly.
select SSN,FNAME from EMPLOYE where SALARY > 1000


--6-Display the employees Id, name who earns more than 10000 LE annually.
select SSN,FNAME from EMPLOYE where SALARY*12 > 10000


--7-Display the names and salaries of the female employees.
select * from EMPLOYE where SEX='Female'


--8-Display each department id, name which managed by a manager with id equals 968574.
select DNUMBER,DNAME from DEPARTMENT where MGRSSN > 968574


--9-Dispaly the ids, names and locations of  the pojects which controled with department 10.
select PNUMBER,PNAME,PLOCATION from PROJECTT where DNUM=10
