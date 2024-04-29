use AdventureWorks2012

--1-Display the SalesOrderID, ShipDate of the SalesOrderHeader
--table (Sales schema) to designate SalesOrders that occurred within the period ‘7/28/2002’ and ‘7/29/2014’

select Salesorderid,shipdate
from sales.SalesOrderHeader
where OrderDate between '7/28/2002' and '7/29/2014'

--2-Display only Products(Production schema) with a StandardCost below $110.00 (show ProductID, Name only)
select ProductID,Name
from production.Product
where StandardCost<110

--3-Display ProductID, Name if its weight is unknown
select ProductID,Name
from production.Product
where Weight is null

--4-Display all Products with a Silver, Black, or Red Color

select *
from Production.Product
where Color in ('silver','black','red')

--5-Display any Product with a Name starting with the letter B
select *
from Production.Product
where Name like 'B%'

--6-6.	Run the following Query
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3
--Then write a query that displays any Product description with underscore value in its description.
select *
from Production.ProductDescription
where Description like '%[_]%'
--where Description like '%[_]%'

--7-Calculate sum of TotalDue for each OrderDate in Sales.
--SalesOrderHeader table for the period between  '7/1/2001' and '7/31/2014'

select sum(TotalDue),OrderDate
from Sales.SalesOrderHeader
where OrderDate between '7/1/2001' and '7/31/2014'
group by OrderDate

--8-Display the Employees HireDate (note no repeated values are allowed)

select distinct(HireDate)
from HumanResources.Employee

--9-Calculate the average of the unique ListPrices in the Product table

select avg(distinct(ListPrice))
from Production.Product

--10-Display the Product Name and its ListPrice within the values of 100 and 120
--the list should has the following format "The [product name] is only! [List price]"
--(the list will be sorted according to its ListPrice value)
select Name as [product name],ListPrice as [List price]
from Production.Product
where ListPrice between 100 and 120
order by ListPrice asc --desc

--or

select concat('The ',Name,' is only! ' ,ListPrice)
from Production.Product
where ListPrice between 100 and 120
order by ListPrice asc --desc

--11-a)	Transfer the rowguid ,Name, SalesPersonID, Demographics from Sales.Store table  in a newly created table named [store_Archive]
--Note: Check your database to see the new table and how many rows in it?

select rowguid,name,SalesPersonid,demographics into store_Archieve 
from Sales.Store

--b)Try the previous query but without transferring the data?
--to disallow transferring the data make the condition alawys false
select rowguid,name,SalesPersonid,demographics into _store_Archieve 
from Sales.Store
where 1 > 2

--12-Using union statement, retrieve the today’s date in different styles

select GETDATE()
select  format(Getdate(),'m')--month+day
select  format(Getdate(),'yyyy')--year
select  format(Getdate(),'MM')--month
select CONVERT(varchar(50),GETDATE())--date
select FORMAT(GETDATE(),'dd-MM-yyyy')
select FORMAT(GETDATE(),'dddd MMMM yyyy')

select GETDATE() as Today_Date
union all
select SYSDATETIME()
