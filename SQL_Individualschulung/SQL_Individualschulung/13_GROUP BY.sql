--GROUP BY

--in Verbindung mit Aggregaten
--SUM MIN MAX AVG COUNT VAR ....

--und die Rolle eines ALIAS ;-)

--und wie filtert man die AGgregierten Werte

---MAX MIN AVG SUM COUNT... 


select count(*) from customers
select count(customerid) from customers
select count(region) from customers

select isnull(region, 'ka') from customers

select sum(freight), min(freight), max(freight), avg(freight) from orders

select	shipcountry
		, sum(freight) as [SUM]
		, min(freight) as [MIN]
		, max(freight) as [MAX]
		, avg(freight) as [AVG]
from	 orders
group by shipcountry



select	shipcountry
		, sum(freight) as [SUM]
		, min(freight) as [MIN]
		, max(freight) as [MAX]
		, avg(freight) as [AVG]
from	 orders
where
		shipcountry like 'U%'
group by shipcountry

--Summe soll größer als 300

select	shipcountry
		, sum(freight) as [SUM]
		, min(freight) as [MIN]
		, max(freight) as [MAX]
		, avg(freight) as [AVG]
from	 orders
where
		shipcountry like 'U%'
		AND
		[SUM] > 300 --- echt jetzt :-(--Ungültiger Spaltenname "SUM".
group by shipcountry


select	shipcountry
		, sum(freight) as [SUM]
		, min(freight) as [MIN]
		, max(freight) as [MAX]
		, avg(freight) as [AVG]
from	 orders
where
		shipcountry like 'U%'
group by shipcountry having sum(freight)  > 3000



select	shipcountry
		, sum(freight) as [SUM]
		, min(freight) as [MIN]
		, max(freight) as [MAX]
		, avg(freight) as [AVG]
from	 orders
where
		shipcountry = 'USA'
group by shipcountry having sum(freight)  > 3000

--zeimlich blöde Idee
select	shipcountry
		, sum(freight) as [SUM]
		, min(freight) as [MIN]
		, max(freight) as [MAX]
		, avg(freight) as [AVG]
from	 orders
---where
	--	shipcountry = 'USA'
group by shipcountry having sum(freight)  > 3000 and Shipcountry = 'USA'

--tu nie im having eteas filtern ,was ein where schafft
--im having nur AGG


--Lastname (employees), Umsatz 
--Umsatz: 

select lastname , sum(unitprice*quantity) as UMSATZ
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname

select object_name(object_id),* from sys.columns where name like 'country'


--wer ist der beste Ang nach Umsatz
select top 1  lastname , sum(unitprice*quantity) as UMSATZ
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname
order by UMSATZ desc


--und nun der schlechteste 

select top 1  lastname , sum(unitprice*quantity) as UMSATZ
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname
order by UMSATZ asc


--und nun den besten und schlechtesten zu einem Ergebnis
select top 1  lastname , sum(unitprice*quantity) as UMSATZ
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname
--order by UMSATZ desc--ist hier falsch , da UNION = eine Abfrage und order by immer am Ende
UNION ALL --echt jetzt
select top 1  lastname , sum(unitprice*quantity) as UMSATZXXX
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname
order by UMSATZ asc








--Idee 1: Subqueries

select * from
(
select top 1  lastname , sum(unitprice*quantity) as UMSATZ
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname
order by UMSATZ desc
) t1
UNION ALL
select * from 
(
select top 1  lastname , sum(unitprice*quantity) as Umsatz
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname order by UMSATZ asc
) t2


select * from 
(
select top 1  lastname , sum(unitprice*quantity) as UMSATZ
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname
order by UMSATZ desc
UNION ALL
select top 1  lastname , sum(unitprice*quantity) as Umsatz
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname order by UMSATZ asc
) t










select Spalten1 as AliasX, Spalte2, AGG(Spate)
from Tabelle
where ...
group by Spalten1 , Spalte2,



select shipcountry,sum(freight), min(freight), max(freight), avg(freight) 
from orders




--Wie weit weicht der Umsatz eines Ang von dem des besten ab
select lastname , sum(unitprice*quantity)-
(
	select umsatz from 
	(
	select top 1  lastname , sum(unitprice*quantity) as UMSATZ
	from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
	group by lastname order by UMSATZ desc
	) t
) 
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname



select umsatz from 
(
select top 1  lastname , sum(unitprice*quantity) as UMSATZ
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname order by UMSATZ desc
) tUmsatzbest





--jetzt mit Variable
declare @bestUmsatz as money = 0
--Variable Wert zuweisen
set @bestUmsatz = 100
--oder per Abfrage.. die aber nicht mischbar ist mit Ausgabewerten

select @bestUmsatz = sum(freight) from orders group by shipcountry

 select top 1  lastname , sum(unitprice*quantity) as UMSATZ
	from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
	group by lastname order by UMSATZ desc


select @bestumsatz = Umsatz from 
(select top 1  lastname , sum(unitprice*quantity) as UMSATZ
	from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
	group by lastname order by UMSATZ desc) t
select @bestumsatz

-- select sum(freight) -@var

--evtl doch anders

















select  country as Land, count(*) from customers
where city = 'berlin'
group by country having count(*) >2
order by country



select  country as Land, count(*) from customers
where city = 'berlin'
group by country having count(*) >2
order by Land


select  country as Land, count(*) from customers
where land = 'USA'
group by country having count(*) >2
order by Land



select  country as Land, count(*) as ANZ from customers	    c
where ANZ >2
group by country having count(*) >2
order by anz



---> FROM	(ALIAS)---> where --> group by --> AGG -->  HAVING  --> select (math/f()/Alias)
--> order by --> top distinct---> ausgabe

 
select  country as Land, count(*) from customers
where country = 'USA'
group by country having count(*) >2
order by Land


--bescheuert
 
select  country as Land, count(*) from customers
--where country = 'USA'
group by country having country = 'USA'
order by Land


--durchsch Frachtkoste (freight) in orders pro Kunde (customerid)
--nur die avg(freight) > 500


select customerid, avg(freight) from orders
group by customerid	 having avg(freight) > 100

select customerid, avg(freight) from orders
where (select avg(freight) from orders) > 100
group by customerid

--Wie hoch ist der Umsatz pro Kunde  (companyname)






















select lastname , sum(unitprice*quantity) as UMSATZ
into #t
from 
	[order details] od inner join orders o	  on od.orderid	  = o.orderid
					   inner join employees e on e.employeeid = o.employeeid
group by lastname


select * from #t
	where Umsatz =  (select  max(umsatz) from #t)
			or
		  Umsatz =  (select  min(umsatz) from #t)

declare @varmax as money
select @varmax= max(umsatz) from #t
select @varmax

select Lastname, Umsatz , Umsatz -@varmax
from #t


alter table #t add spx int

select * from #t

--CUBE und ROLLUP
select * from customers

select country, city, count(*) from customers
group by country, city with cube --160
order by 1,2


select country, city, count(*) as Anz 
into #result
from customers
group by country, city with rollup --91
order by 1,2

select * from #result


---












