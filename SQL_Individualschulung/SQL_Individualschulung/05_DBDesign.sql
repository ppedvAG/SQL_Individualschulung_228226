/*

achte beim DB Design auf:

Datentypen sollten ausreichend dimensioniert sein
, aber nicht �berdimensional
--zB datetime2 , wenn Date reichen sollte

wenn m�glich variable Datentypen, wenn variable L�ngen

Unicode , wenn Unicode (vermutlich) gebraucht wird

*/
DECLARE @nstring NCHAR(12);  
SET @nstring = N'�kergatan 24';  
SELECT UNICODE(@nstring), NCHAR(UNICODE(@nstring)); 

--siehe aus ASCII

select ascii('�')  --erweiterter Zeichensatz..

select nchar(228)

/*


Seiten und Bl�cke


DS werden in Seiten gespeichert
8 Seiten am St�ck werden Block genannt

Page --> Extent


Eine Seite hat ein Volumen von 8192 bytes (immer gleich)
Eine Seite kann nicht mehr 700 DS beinhalten
I.d.R muss ein DS in eine Seite passen. (Summe aller Spalten mit fixen Datytpen)
1 DS kann nicht gr��er als 8060 werden
Von 8192bytes sind nur 8072 bytes nutzbar
Die Seiten werden 1:1 von HDD in RA gelesen


Beispiel

1 DS hat 4100
1 Mio DS
Wieviele Seiten--> 1 Mio Seiten
Wie voll sind die Seiten? >50%
Wie gro� ist also die Tabelle? 8 GB
Wie gro� ist der RAM Verbrauch? beim kompletten Lesen der Tabelle 8 GB

L��t sich das herausfinden.. 
und wie gro� ist der Verlust?

*/

create table t2 (id int, sp1 char(4100), sp2 char(4100))


dbcc showcontig('t1')

--- Gescannte Seiten.............................: 20000
--- Mittlere Seitendichte (voll).....................: 50.79%

--> 20000 * 8 KB = 160 MB

set statistics io, time on-- Anzahl der Seiten, CPU in ms und gesamte DAuer in ms
select * from t1 where ID=100 -- 20000.. f�r einen DS lesen wir 160MB in RAM von HDD

--Ohje: SCAN von a bis z alles durchsuchen vs SEEK.. das Herauspicken


dbcc showcontig()

--Was k�nnen wir tun ,um die Seitendichte zu erh�hen..
--Datentyp �ndern von char in Varchar -- APP geht nicht  mehr

--Felder sehr breite Tabelle: Hobby1, Hobby2, Fax1 , Fax2, Fax3, Frau1, Frau2, Frau3, Frau4, Religion

--Was w�re wenn eine Tabelle Kunde in Kunde und Kundensonstiges

--4100 bytes vorher dann 4000 und 100 
--bei 1 MIO
--4 GB + 110MB => statt 8 GB (HDD und RAM)--> 4,1GB RAM und HDD.. aber APP geht nicht mehr


--Besser Alternative
--der dbcc showcontig ist als depricated markiert
--mehr Informationen �ber ...
--auch Infos zu Indizes
select * from sys.dm_db_index_physical_stats
	(db_id(), object_id('t1'), NULL, NULL, 'detailed')

*/
