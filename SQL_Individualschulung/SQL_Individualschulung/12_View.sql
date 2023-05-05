--View -- Sicht

--Was ist eine View?
--gemerkte Abfrage , die wie eine Tabelle funktioniert
--SELECT , INS UP, DEL.. geht aber nicht immer: wenn keine Pflichtspalten enthalten oder JOINS
--alle Spalten müssen benannt sein

create view ViewName
as
select .....

select * from ViewName

--Sinn der Sicht
--Komplexe Statements zu vereinfachen 
--

select * from employees

create or alter view hr.vAngSecureUSA
as
select lastname, firstname, city, country from employees where country = 'USA'


select * from vAngSecureUSA


--Probleme der View..

create view vKundeUmsatz
as
select 
	Companyname, c.customerid, c.country, c.city, contacttitle,--customers
	o.employeeid, freight, orderdate, shipcity, shipcountry, --orders
	od.Orderid, od.ProductId, od.unitprice, quantity,	--orderdetails
	Lastname, firstname	 ,								--Employees
	Productname  , UnitsinStock,							--Products
	(od.unitprice*od.quantity) AS PosSumme
from 
	customers c inner join orders o		on c.customerid = o.customerid 
				inner join odetails od	on od.orderid	= o.orderid
				inner join employees e	on e.employeeid = o.employeeid
				inner join products p	on p.productid = od.productid

select * from kundeUmsatz

--Probleme der Sicht...
create table slf(id int, stadt int, land int)

insert into slf
select 1,10,100
UNION ALL
select 2,20,200
UNION all
select 3,30,300

--alle Spalten und Zeilen
create view vslf
as
select * from slf

select * from vslf


--Was ist schneller ..? Sicht , adhoc Abfrage--sicht  ist gleich schnell wie Adhoc Abfrage

alter table slf add fluss int

update slf set fluss = id *1000

select * from vslf--

alter table slf drop column Land


create view vslf2 with schemabinding
as
select id, stadt, fluss from dbo.slf


select * from kundeumsatz-- Frachtkosten in Summe pro Shipcity


select shipcity, sum(freight) from kundeumsatz group by shipcity


select shipcity, sum(freight) from orders group by shipcity











