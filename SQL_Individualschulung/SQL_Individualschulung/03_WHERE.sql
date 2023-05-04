/*
 Ergebnisse filtern mit WHERE
 > < >=  <= != like =  <>
 NOT IN BETWEEN	 LIKE
 Wildcards:


 NOT <> != dursucht immer alles
 im Plan steht ein SCAN

*/

select * from customers
where companyname != 'Maier'


select * from customers
where companyname = 'Maier'

select 
		Spalten bzw AUsgabe
from tabelle
where 	sp > wert
order by 


select * from orders 
where freight < 1
order by freight desc

--alle Kunden 
--deren Customerid  
--soll kleiner C sein

--alles was sortierbar ist , kann 
--mit < > gefiltert werden

select * from customers
where
	customerid < 'c'

select * from customers
where
	customerid <= 'c'


--LIKE kann wildcards
--Wildcards:  % .. steht für belieb viele Zeichen 

select 
--	country,
	* 
from  customers
where country like 'U%'

--Alle Kunden, die in einer Stadt wohnen
--, die ein U enthält

select *
from		customers
where		city like '%U%'
order by	city


'0634-7?56?4'


'0634-756?4'

--Wildcard für genau ein Zeichen : 	 _

select * from customers

---alle Kunden , die in einer Stadt wohnen
--, deren 3. letzter Buchstabe ein d ist

select * from customers
where
	city like '%d__'

 select * from customers

 --alle Firmen, die ein ' im Firmennamen haben

 select * from customers 
 where 
			companyname like '%''%'


--alle Kunden, die mit A bis C beginnen und mit G-L enden
--customerid

--where sp1 like 'A%' AND sp1 like '%E'
--where sp1 like 'A%' OR sp1 like '%E'

select * from customers
where 
	customerid < 'D'
	AND
	customerid 	like '%G'
	OR
	customerid 	like '%H'
	OR
	customerid 	like '%I'
	

select * from customers 
	where customerid
	

select * from [order details]


select * from customers
where customerid like '[A-C]%[G-L]'

--[] steht für genau ein Zeichen
--Wertebereich 

select * from customers
where customerid like '[A-C]%M_[G-L]'

 -- [A-C|M-O]  kann a bis c oder auch m bis o

--Suche alle Kunden 
--der Firmaname soll
--beginnen mit D, E oder F
--soll als 4 letzten Buchstaben ein o haben und 
--soll mit M bis Z enden

select * from customers
where 
	companyname like '[d-f]%o__[M-Z]'

   --[1-5]

 --suche alle Firmen, die im Namen ein % haben

 select * from customers
 where
 companyname like '%%%' --hmmm

 
 select * from customers
 where
 companyname like '%[%]%' 

  select * from customers
 where
 companyname like '%[]%' 


 --alle  Bestellungen aus orders
 --die Frachtkosten < 10 haben	
 --(freight)
 --oder von Kunden  mit ID A -C beginnend bestellt wurden
 -- (Customerid)
 --und aus einem Land mit U beginnend ausgeliefert wurden
 --shipcountry

--was kommt tats raus..
--immer Klammern setzen...
select *
from   orders 
where
		(freight < 10
		OR
		customerid like '[AC]%')
		AND 
		shipcountry like 'U%'












  


