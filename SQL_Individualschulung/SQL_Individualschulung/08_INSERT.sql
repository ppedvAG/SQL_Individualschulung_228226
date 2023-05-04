--INSERT

--komplette Kopie der Customers in Tab Kunden
--es werden alle Spaltennamen und Datentypen übernommen
--auch Identity
--aber keine Indizes etc
select * into kunden from customers

select * from kunden

--manuell Werte einfügen

insert into kunden (customerid, companyname) values ('WOLFS', 'Wolf System')

insert into kunden (customerid, companyname) 
	values
		('WOLFS', 'Wolf System'),
		('PPEDV', 'Wolf System'),
		('XYCZG', 'Wolf System')

 --Daten aus anderen Tabellen einfügen
insert into kunden	
select * from customers where country = 'AUSTRIA' 

--geht auch ohne Tabelle
insert into kunden (Customerid, companyname)
select 'ABCDE', 'Firmaxy'



--UPDATE DELETE

select * from kunden

 --Transactions können helfen, bei falschen UP, DEL oder INS
 --den Originalzusatnd vor der Änderung wiederherzustellen
 --Vorsicht: Transactions setzen Sperren.. so dass andere User 
 --evtl mit lang dauernden Abfragen (Sperren) zu kämpfen haben

begin tran-- Transaction
update kunden set city = 'Sterzing'
where customerid = 'ALFKI'

select * from kunden
select @@trancount
rollback

commit



begin tran
update kunden set country = 'UK'
--select * from kunden
		where country = 'England'
 --7 DS
rollback
commit


--alle Kunden die weniger als 10 Frachtkoste haben , 
--sollen in Tab Kunden geändert werden 
-- das Land soll auf Italy gesetzt werden


--erst das SELECT 
update kunden set country = 'Italy'
--select distinct k.customerid
from	kunden k 
	inner join orders	o	on k.customerid = o.customerid	
where freight <1

--Kopie der Tabelle Bestellungen
select * into Bestellungen from orders

select * from bestellungen

--erhöhe die Frachtkosten um 10 % bei allen Kunden, die aus Deutschland sind
update bestellungen set freight = freight *1.1 
--select k.customerid , country, freight	,orderid
from 
	Bestellungen b inner join  Kunden k on k.customerid = b.customerid
where
	k.country = 'Germany'  

--86 zutiefst betroffen


--DELETE  ist kein DROP

delete from kunden where city = 'Graz'

begin tran
delete from kunden where country like 'U%'
select @@trancount
select * from kunden where country like 'U%'
rollback


--löscht alle Bestellung deren Frachtkosten über 500 sind
--Kontrolle
--und dann rückgängig machen
--dann wieder kontrollieren
begin tran
delete from bestellungen where freight > 500
--select * from bestellungen where freight > 500

rollback

select * from kunden 

--Lösche die Stadt beim Kunden ALKFI

update kunden set city = NULL
where customerid = 'ALFKI'

select * from kunden






   	 




--Update alle Kunden und ändere dsa Land UK auf England










