--GROUP BY

--in Verbindung mit Aggregaten
--SUM MIN MAX AVG COUNT VAR ....

--und die Rolle eines ALIAS ;-)

--und wie filtert man die AGgregierten Werte







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


























