--CASE
--Ausgaben können überschrieben werden
--er werden keine Daten verändert

SELECT CASE
			WHEN
			WHEN
			...
			ELSE
	   END as SPALTE, SP2, SP3
FROM TAB


SELECT country,
		CASE
			WHEN COUNTRY = 'Germany' THEN 'EU'
		END AS EUNOTEU
FROM Customers

SELECT country,
		CASE
			WHEN COUNTRY = 'Germany' THEN 'EU'
			WHEN COUNTRY = 'USA'  THEN 'AMERIKA'
			ELSE '??'
		END AS EUNOTEU
FROM Customers


SELECT country,
		CASE
			WHEN COUNTRY IN ('Germany','UK','Italy', 'France') THEN 'EU'
			WHEN COUNTRY = 'USA'  THEN 'AMERIKA'
			ELSE '??'
		END AS EUNOTEU
FROM Customers


--Orders --Freight... 0.02 - 1007 ..78.2442
--Ausgabe der Orders (orderid, freight) und ANgabe ob über bzw unter Schnitt



SELECT orderid, freight ,
		CASE
			WHEN freight > 78 THEN 'über Schnitt'
			ELSE				   'unter Schnitt'
		END
FROM Orders


--Ausgabe der Orders (orderid, freight) ..
--Frachtkosten sind unsere Kosten, daher:
--Bewertung per A B C Analyse
--A  günstig:  unter 10
--B   normal:  unter 500
--C schlecht:  über oder gleich 500


SELECT orderid,
		freight,
		CASE
			WHEN freight < 10 THEN 'A'
			WHEN freight < 500 THEN 'B'
			ELSE 'C'
		END AS ABC
FROM Orders ORDER BY 3 DESC

SELECT orderid,
		freight,
		CASE
			WHEN freight < 500 THEN 'B' --ist eine Bedingung erfüllt wird keine weiterer Fall behandelt
			WHEN freight < 10 THEN 'A'			
			ELSE 'C'
		END AS ABC
FROM Orders ORDER BY 3 desc



-------------------------------

--IF

/*
IF (Bedingung erfüllt) Anweisung
ELSE (Bedingung nicht erfüllt) Anweisung

*/

IF (1=0) Select 'A' ELSE Select 'B'


--besser
IF (1=0) 
	Select 'A' 
ELSE 
	Select 'B'

IF (1=1)  --Falls mehr Anweisung verarbeitet werden sollen, dann BLOCK Anweisung
	BEGIN
		Select  'A' 
		Select  'C'
	END
ELSE 
	BEGIN
		Select 'B'
		select 'D'
	END

	--Man sicher nichts falsch, wenn man immer BEGIn END verwendet..


--mehr Bedigungen
--Tipp: Klamern verwenden

IF (1=1) OR (2=1)
	Begin 
			print 'Servus'
	End

IF (1=1) AND (2=1)
	Begin 
			print 'Servus'
	End
ELSE
	BEGIN
			print 'falsch'
	END

--Wenn wir mehr als 50 Kunden haben, dann Ausgabe der Kundentabelle

IF (Select ..) > Wert


IF ((Select count(*) from customers) > 50)
Begin
	select * from customers
End
ELSE
	select 'weniger als fuffzisch!'