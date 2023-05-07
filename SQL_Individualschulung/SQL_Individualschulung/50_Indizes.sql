/*  Indizes



Abfragen werden schneller
Locks können auf Zeilen gesetzt werden
Abfragen können auch langsamer werden
, wenn der Plan falsch ist... 



Index Arten


Gruppierter Indes 
nur 1 mal pro Tabelle vor allem gut bei Bereichsabfragen

Nicht gruppierter Index
gut bei rel geriger Ergebnismenge

--!!! Vermeide Lookup... --> der IX sollte alles beantworten können
--ohne in Heap oder CL IX nachsehen zu müssen


select * 
into KU
from kundeumsatz

insert into KU
select * from KU
--9 mal wiederholen
--bis ca 1 MIO DS

/*
IO		RAM        CPU
X		x           X
X		X			X
Xo		Xo			Xo
Xo		Xo			Xo



*/
*/

set statistics io, time on


select * from ku where orderid = 100

alter table ku add id int identity

select * from ku where id = 100

dbcc showcontig('ku')
--- Gescannte Seiten.............................: 37972
--- Mittlere Seitendichte (voll).....................: 98.28%

select * from 
sys.dm_db_index_physical_stats(
			db_id(),
			object_id('ku'),
			NULL,
			NULL,
			'detailed'			)

--forwar_record_Count = 0 !!!

select id from ku where id = 100 --

--resviert: Orderdate = CL IX

--NIX_ID

select id from ku where id = 100  --3 Seiten 0 ms


select id, freight from ku where id = 100--0ms 4 Seiten mit Lookup

select id, freight from ku where id =100  --ab 10000 Table Scan

select id, freight from ku where id <920000


select id, freight,customerid from ku where id <12000--wieder scan

--Idee IX mit allen Spalten als zusammengesetzt
--max Anzahl = 16 Spalten
--max 900byte Schlüssellänge

select id, freight,customerid from ku where id <12000

--Tabe Scan
select country,city, sum(unitprice*quantity)
from ku
where productid = 10 or employeeid = 2
group by country,city


--Agg where 
--
--Land,Firmenname,Productname, sum(Menge* preis )
--where 
--shipcountry = Brazil

select country, companyname, productname, sum(unitprice*quantity)
from 
	ku
where shipcountry = 'Brazil'
group by country, companyname, productname
--ohne IX... 57000 Seiten 466ms   126ms Kosten 31,1-- 8 kerne im Einsatz

---NIX_ShCy_incl_cycnpnupqu-

select country, companyname, productname, sum(unitprice*quantity)
from 
	ku2
where productid = 1
group by country, companyname, productname


select * into ku2 from ku
--keine IX auf Ku2








Germany

SEG10 
Senegal= SeL
Schweiz=ScZ
Schweden= SCN
SCL



























	






