--SubSelect



select (select top 1 freight from orders) as Sp ,* from (select * from orders) o
where 
			shipcountry in (select country from customers)



--wie hoch ist die Abweichung der akt Frachtkosten vom Schnitt der frachtkosten
select *		 from orders

select avg(freight) from orders

select	orderid, freight ,
		(select avg(freight) from orders ) as Schnitt  ,
		 (select avg(freight) from orders )-freight
from orders
where freight <    (select avg(freight) from orders )		--142 SQL Dollar

 --schneller , weil das Subquery nur einmal ausgeführt wird.noch 70 SQL Dollar
declare @schnitt as money
select @schnitt=avg(freight) from orders

select orderid, freight , @schnitt-freight from orders
where freight < @schnitt


--wir brauchen alle Bestellungen, deren Rechnungsumme größer als 1000 ist
--mit Suquery


select * from orders 
			where orderid in (
				select orderid from 
					(
					select orderid , sum(unitprice * quantity)  as Summe from [order details]
					group by orderid  having   sum(unitprice * quantity)  < 1000
					) t2
				) 
				
			
	

select o.* from orders o inner join [order details] od	 o.orderid = od.orderid
	where ...?
























