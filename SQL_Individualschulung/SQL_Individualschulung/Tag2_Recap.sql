with cte
as
(SELECT 
	DISTINCT 
	TOP x , PERCENT with ties
	Sp,n..
	F()--aufpassen ,wenn ein Lookup in anderen Tabellen
	Mathe as ALIAS
	'txt' 
	CASE when begin end
	Subqueries---ein Wert
	sum(freight) over (partition by country order by city)
INTO #t
FROM Tab1 A inner|left|right Tab2 B on A.spx = b.spx
			cross join
	        join (select .. from ...) t
			join F(Wert)
			join View
where  between in like 
		and or 
group by sp (aus dem Select ) having agg   UNION ALL EXCEPT INTERSECT
order by sp desc|asc
    with cube|rollup
) 
select * fro cte



order by







DECLARE @var1 as int = 0
set @var1 = 10

select * from orders where freight < @var1


















--max Frachtkosten pro ang
select employeeid , max(freight) from orders
group by employeeid 


--was ist der Durchschnitt der max Kosten
--Idee 1  #t

set statistics io, time on
drop table #t

select employeeid , max(freight) as MaxFr
into #t
from orders
group by employeeid 

select avg(maxfr) from #t


--cte
;with cte
as
(
select employeeid , max(freight) as MaxFr
from orders group by employeeid 
)
select avg(maxfr) from cte

--SubQuery

select avg(maxfr) from 
(
select employeeid , max(freight) as MaxFr
from orders group by employeeid 
) t









--Suche mit Variablen alle Kunden mit @Land=?



declare @land as varchar(50)
set @land = 
select * from customers where country = @land
order by country



select companyname, country, city , orderid, freight
from customers c
	inner join orders o on c.customerid = o.customerid

	--Hash join

select *
from customers c
	inner join orders o on c.customerid = o.customerid

--merge join


select *
from customers c
	inner join orders o on c.customerid = o.customerid
	where c.customerid like 'A%'

--loop


select *
from customers c
	inner merge join orders o on c.customerid = o.customerid



select *
from customers c
	inner loop join orders o on c.customerid = o.customerid




select *
from customers c
	inner hash join orders o on c.customerid = o.customerid

--Window Function

--rank(), dense_rank(), row_number(), ntile()

select orderid, freight,
	   row_number() over (order by freight)
from orders

select orderid, freight,shipcountry,
	   row_number() over (partition by shipcountry order by freight),
	   sum(freight) over (partition by shipcountry order by freight desc)
from orders


select orderid, freight,
	   row_number() over (order by freight) as rnumber,
	   rank() over (order by freight) as rang,--wie beim sport,
	   dense_rank() over (order by freight)---überspringt keine Rang aber doppelte ränge
from orders


--ABC

--freight : A  < 100 Freight
 --         B  zwischen 100 bis 500
 --         C  > 500

 --Ausgabe der Orderstabellem mit Quali A B oder C nach Freight

 select quali, freight , * from orders

 select 'A',freight, *  from orders  where freight < 100
 union all
 select 'C',freight, *   from orders where freight > 500
 union all
 select 'B',freight, *  from orders  where freight between 100 and 500


 select 
			case
					when freight < 100 then 'A'
					when freight > 500 then 'C'
					else 'B'
			end as Quali,
			freight, *
from orders



--WHILE

WHILE (Bedingung) 
	begin 
		--code
		BREAK --Schleife endet sofort
		IF Beding then break
		IF CONTINUE
		--code
	end


create table t10 (id int identity, spx char(4100))
create table t11 (id int identity, spx char(4100))
create table t12 (id int identity, spx char(4100))

set statistics io, time off
--keine Messungen und keine Pläne !!


insert into t10
select 'XY'
GO 30000 --15 Sek


declare @i as int =1

while @i <= 30000
	begin 
		insert into t11(spx) values ('XY')
		set @i+=1 -- @i = @i+1
	end  --7 Sek



declare @i as int =1
begin tran
while @i <= 30000
	begin 
		
		insert into t12(spx) values ('XY')
		set @i+=1 -- @i = @i+1
	
	end  --7 Sek
commit

--UserX ---> INS UP DEL---> LDF (Block 17 betroffen)
                       ---> RAM-----delta t (checkpoint) ----> mdf

























