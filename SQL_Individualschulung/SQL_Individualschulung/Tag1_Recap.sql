/*

SELECT 
		DISTINCT --filtert doppelte Zeilen aus dem Ergebnis
		TOP n-Zeilen, n-Percent  [WITH TIES] ..order by !!!
		Spalten, n...., ...
		CASE | IF	AS ALIAS
		F()
		Mathe
		'Text'
		(SELECT ..)..muss ein einziger Wert )= Zelle
		@Variable
FROM   TAbelle1 A  INNER|LEFT|RIGHT  Tabelle2 B ON A.spx=B.spx
				   CROSS   Tabelle3 C
				   INNER|LEFT|RIGHT  Tabelle4 D ON D.spx=A.spx
				....
WHERE  Sp <  >  >= != = like 
		IN | BETWEEN
		Wildcards: 
					% 0 bis belieb viele Zeichen
					_ genau ein Zeichen
					[] genau ein Zeichen  [A-C] [B-D|^M-T] [2-5]
		OR
		AND (wird immer zuerst gebunden)

		NOT LIKE
		NOT IN 
		NOT BETWEEN
ORDER BY SP asc|desc, Sp2







 */

 select * from orders
 where freight >= 1 and freight <= 10 
  --identisch
 select * from orders
 where freight between 1 and 10 

 select * from customers
 where country = 'USA' OR Country= 'UK' OR country ='Italy'
 --identisch  mit IN

 select * from customers
 where country in ('UK', 'Italy', 'USA')



 select * from customers
 where country = 'USA' OR Not (Country= 'UK' OR country ='Italy')



				   

select country, city , companyname from customers
where country = 'USA'
order by country

select country as Land, city , companyname, c.customerid from customers  c
where LAND = 'USA'
order by LAND

--Logischer Fluss
--FROM	----> JOINS---> WHERE  -->  GROUP BY --> HAVING ---> SELECT  (ALIAS)
---> ORDER BY --> TOP DISTNCT --- AUSGABE

--SCAN komplettes Durchsuchen
--SEEK Herauspicken

--alle Sissis
select * from customers
where
		contactTitle like '%Eli[zs]abeth%'


select soundex('Maier'), soundex('Mair') , soundex('Meyer')

select soundex(contacttitle),* from customers 
where soundex(contactname) in	...




--alle Bestellungen aus dem Jahr 1997
between, >= <=, like , year(datum), datepart(yy, Datum)
 --408   0 408  
select * from orders between '1.1.1997' and '31.12.1997'-- schnell aber falsch
select * from orders year(orderdate) = 1997 --korrekt aber langsam
select * from orders orderdate >='1.1.1997' and orderdate <'1.1.1998' --schnell , aber.
select * from orders where orderdate >='1.1.1997' and orderdate <= '31.12.1997 23:59:59.997'

select * from customers where customerid like 'M%'


select * from customers where left(customerid,1) ='M'

---Employees  --alle die 65 sind oder älter
select * from employees
--dateadd (yy , Datum) --> datetime
--datediff (yy, Datum1, Datum2) --> datetime

select * from orders
where
		birthdate <= dateadd(yy, -65, getdate())	--gute



---Aus Customers
-- Companyname, customerid, country, city, contacttitle

--Aus Orders
--employeeid, freight, orderdate, shipcity, shipcountry

--aus [order details]
--Orderid, ProductId, unitprice, quantity

--aus Employees
--Lastname, firstname

--aus Products
--Productname  , UnitsinStock

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





































--Was kann alles im SELECT stehen?

--Suche alle Kunden raus, deren Ansprechpartner 
--eine Elisabeth enthält

--1997

--Welcher Kunden (Firma, KundenID, Land, Stadt)
--hat welches Produkt(name), zu welcher Stückzahl und Preis
--von welchem Angstellen (Nachname, Vorname) gekauft
--und wie hoch waren die Lieferkosten
--und wieviel Stück des Produkts sind aktuell auf Lager


 ----Abfrage von oben
 -- aber nur noch die Datensätze der Bestellungen aus dem Jahr 1997
--Welcher Kunden (Firma, KundenID, Land, Stadt)
--hat welches Produkt(name), zu welcher Stückzahl und Preis
--von welchem Angstellen (Nachname, Vorname) gekauft
--und wie hoch waren die Lieferkosten
--und wieviel Stück des Produkts sind aktuell auf Lager



