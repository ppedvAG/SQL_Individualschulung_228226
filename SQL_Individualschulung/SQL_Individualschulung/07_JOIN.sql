/*
inner 
left 
right
cross

loop merge hash

A
SPX     SPY
100		A
200		B
300		C
100		D
234		E

B
SPX     SPY
100		A
200		B
300		C
100		D

select * from tabelleA A inner join tabelleB B
		ON A.spy=B.spy

100		A	 100		A
200		B	 200		B
300		C	 300		C
100		D	 100		D


select * from tabelleA left join tabelleB B
			ON A.spy = B.spy

100		A	 100		A
200		B	 200		B
300		C	 300		C
100		D	 100		D
234		E	 NULL      NULL

select * from tabelleB B right join tabelleA A
			ON A.spy = B.spy


select * from tabelleA cross join tablleB

*/


 --              91         830   2155
select * from customers, orders, [order details]

select * into t2 from nwindbig..customers

select * from t2 where city = 'Sterzing'


select * from t2 where country= 'Spain'

select * from t2 where companyname like 'E%' 
			and PostalCode ='41239'



select 
		*
from customers inner join orders on customers.customerid=orders.customerid

select 
		c.customerid, c.companyname,
		o.orderid, o.freight
from customers c inner join orders o on c.customerid = o.customerid


--Liste aller Bestellungen und deren Positionen
-- BestellNR, Frachtkosten, unitprice, quantity, productid

--orderid , freight , unitprice, quantity, productid


/* 
		from tabelle A inner join tabelle b on a.sp = b.sp
*/

select 
	o.orderid , freight    --orders
	, unitprice, quantity, productid	    --order details
from 
		orders o inner join [order details] od 
		on 
		o.orderid = od.orderid


--Welche Kunden haben nichts gekauft
--Left join .. von Links alle und von rechts die passenden

--customers left join orders	

	
select 
		o.orderid,
		* 		  
from 
		customers c left join orders o on c.customerid = o.customerid
order by 1 asc

  --hier mit right
 select 
		o.orderid,
		* 		  
from 
		orders o  right join customers c on c.customerid = o.customerid
order by 1 asc


 select 
		o.orderid,
		* 		  
from 
		customers c left join orders o on c.customerid = o.customerid
where 
		  orderid is NULL


--Join über mehrere Tabelle
select * 
from 
		Tabelle A inner join Tabelle B on A.spx = B.spx
				  inner join Tabelle C on C.spy = B.spy
				  inner join Tabelle D on D.spXY = E.spxy --Error kenn ich nicht
				  inner join Tabelle E on E.spx = A.spx


--Welche Firma hat welche Produkte gekauft?
--JOIN: Customers ---------> Orders ---------> OrderDetails ----------> Products
--                customerid		  orderid				  productId


select 	 distinct	   --nur wenn wir wirklich doppelte Ergebniszeilen haben könnten
		Companyname, productname 
from 
		customers c inner join orders o				on c.customerid = o.customerid
					inner join [order details] od	on o.orderid	= od.orderid
					inner join products p			on p.productid	= od.productid
order by 1,2







