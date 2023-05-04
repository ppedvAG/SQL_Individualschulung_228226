/*

Schönschreibung ;-)

GO und ;


SELECT 	   Daten aus Tabellen lesen
DISTINCT   doppelte Ergebnisse herausfiltern
ALIAS      Spaltentitel im Ergebnis umbenennen

auszuführeneden Quelltext immer markieren


SELECT 
	* alle Spalten
	Spaltenname
	Sp as ALIAS
	'TEXT' , ZAHL, MATHE
	F()
from tabelle
order by sp|Alias asc | desc
         1 desc ,3 



ERROR EBENE: 
1bis10 reine Info
11 bis 16 sind DAU Fehler	   .. evtl Ausnameh  Ebene 14= Security
>=17 
*/



select --was will ich sehen--

use northwind;
GO


select 100
go 3	  --Anweidung für Edito.. mach mal

Select 
	spalte1, spalte2, spoalte3 , spalte4 , spalte5 , xy
from tabelle 
where kjkdsakasjdka = kajsdkas 
						and 
	  klasjdkj= kasjda

  
select companyname 
from customers 
 city = 'LONDON'

 select * from customers

 select 
		companyname
		, customerid
		, 	country
		, city
 from customers


  select 
		companyname, customerid 
--		,country
--		,city
 from customers

 --Kommentare

   select 
		companyname, customerid 
--		,country
		,city	 --hab ich rein wg keine Ahnung
 from customers


 -- ab zwei -- ist der Rest der Zeile ein KOmmentar

 
 --ein Kommentar über mehr Zeilen
 /*

   alles
   ist 
   kommentar
   select * from customers

 */


 select Companyname as Firma from customers

 select 100*10		as Brutto

select * from orders

--alle Bestellungen: KundenID, BestellID, 
--BestellDatum, Frachtkosten

SELECT 
		  customerid	as KundenID
		, orderid		as BestellID
		, OrderDate		as BestellDatum
		, Freight		as Frachtkosten
FROM	ORDERS

SELECT 
		  customerid	as KundenID
		, orderid	as BestellID, OrderDate		as BestellDatum
		, Freight		as Frachtkosten
FROM	Orders


set statistics io, time on


--IM SELECT kann auch 
--TEXT

select 'OTTO' from orders

select orderid, freight, 1.22 as MwSTit FROM ORDERS

SELECT orderid
		, freight as NETTO, freight * 1.22 as BRUTTO 
		, getdate() 
from orders



select * from orders where orderid < 100

select getdate()


--DATUMSFUNKTIONEN

--datediff 
--year, month, day, isoweek, weekday
--datepart
--dateadd

--dd = Tag
--yy= Jahr
--qq = Quartal
--ww = Woche

select dateadd(dd, 2,getdate())

--Datum in 100 Tagen
 select dateadd(dd, 100,getdate())

 --Datum vor 100 Tagen
  select dateadd(dd, -100,getdate())

  select datediff(ww, getdate(), '1.1.2023')

   select datediff(ww,  '1.1.2023', getdate())

   select * from orders

   --wir wollen sehen: 
   --orderid, requireddate, shippdate, Diff in Tagen
   --Diff soll bei Überfällig positiv sein

 select orderid 
		, requireddate, shippeddate
		, datediff(dd, requireddate, shippeddate)  as Ueberfaellig
		--, datediff(dd, shippeddate,requireddate)   
from orders 
order by   Ueberfaellig desc


 
 --Textfunktionen

 select 'A' + 'B'

 select 100 + 'A'

 select '100' + 'A'

 select * from employees

 --FamName, Vorname

 select  
		lastname, firstname,
		lastname + ', ' + Firstname,
		lastname + ', '+ space(10) + Firstname
 from employees










