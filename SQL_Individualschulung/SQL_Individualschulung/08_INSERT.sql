--INSERT

--komplette Kopie der Customers in Tab Kunden
--es werden alle Spaltennamen und Datentypen �bernommen
--auch Identity
--aber keine Indizes etc
select * into kunden from customers

select * from kunden

--manuell Werte einf�gen

insert into kunden (customerid, companyname) values ('WOLFS', 'Wolf System')

insert into kunden (customerid, companyname) 
	values
		('WOLFS', 'Wolf System'),
		('PPEDV', 'Wolf System'),
		('XYCZG', 'Wolf System')

 --Daten aus anderen Tabellen einf�gen
insert into kunden	
select * from customers where country = 'AUSTRIA' 

--geht auch ohne Tabelle
insert into kunden (Customerid, companyname)
select 'ABCDE', 'Firmaxy'



--UPDATE DELETE

select * from kunden

 --Transactions k�nnen helfen, bei falschen UP, DEL oder INS
 --den Originalzusatnd vor der �nderung wiederherzustellen
 --Vorsicht: Transactions setzen Sperren.. so dass andere User 
 --evtl mit lang dauernden Abfragen (Sperren) zu k�mpfen haben

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
--sollen in Tab Kunden ge�ndert werden 
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

--erh�he die Frachtkosten um 10 % bei allen Kunden, die aus Deutschland sind
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


--l�scht alle Bestellung deren Frachtkosten �ber 500 sind
--Kontrolle
--und dann r�ckg�ngig machen
--dann wieder kontrollieren
begin tran
delete from bestellungen where freight > 500
--select * from bestellungen where freight > 500

rollback

select * from kunden 

--L�sche die Stadt beim Kunden ALKFI

update kunden set city = NULL
where customerid = 'ALFKI'

select * from kunden






   	 




--Update alle Kunden und �ndere dsa Land UK auf England










