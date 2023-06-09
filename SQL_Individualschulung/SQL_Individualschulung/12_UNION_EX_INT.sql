--UNION EXCEPT INTERSECT

select 100
UNION 
select 200

select * from customers where country = 'USA'
UNION
select * from customers where country = 'UK'
order by customerid

select 'A', 100, 200
UNION 
select 'B',100, NULL

--bei UNION mm�ssen gleich viele Spalten sein,
--kompatibel Datentyp

select 100
UNION
select 200
UNION
select 300
UNION ALL
select 100











select * from kunden
select * from customers

--welche DS sind noch identisch zwischen beiden Tabellen

select * from kunden
intersect
select * from customers

select customerid from customers
intersect
select customerid from kunden

select * from customers
except
select * from kunden



select * from kunden
except
select * from customers











select 100
UNION	ALL
select 200
UNION 	ALL
select 300
UNION 	ALL
select 200


select customerid, companyname , city, 'AAA' from customers 
UNION ALL
select customerid, companyname , city, country from customers 




select top 3 * from orders  -- eigtl immer mit order by


--die "eine" Bestellung mit den h�chsten Frachtkosten

--Orders (freight)

select top 1 * from orders order by freight desc

--die "eine" Bestellung mit den geringsten Frachtkosten


select top 1 * from orders order by freight asc


--und jetzt beide zusammen
 --geht nicht weil 2 order by
select top 1 * from orders order by freight desc
UNION
select top 1 * from orders order by freight asc


select * from 
(select top 1 * from orders order by freight desc) t1
UNION
select * from 
(select top 1 * from orders order by freight asc ) t2

--top 13 Kunden den Frachtkosten nach asc
select top 13 with ties * from orders order by freight asc


select * into k1 from customers where country in ('germany', 'italy', 'Austria')
 select * from k1

update k1 set city = 'Mannheim' where city = 'Berlin'

delete k1 where customerid = 'FRANS'

 --welche DS sind in beiden Tabellen identisch

 select * from customers
 intersect
 select * from k1

select customerid, companyname from customers
 intersect
 select customerid, companyname from k1



 select * from customers
 except
 select * from k1


 select * from k1
 except
 select * from customers























