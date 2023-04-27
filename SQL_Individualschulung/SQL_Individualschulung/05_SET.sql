---------------------------------------
-- SPRACHSETTINGS
---------------------------------------
/* 
mit welche Sprachausghabe möchte man leben .. gerade in Südtirol;-)
*/

sp_helplanguage

set language	 German

select datename(dw, getdate())

set language	 Italian

select datename(dw, getdate())


------------------------------------------


 SET DATEFORMAT mdy;  
GO  
DECLARE @datevar DATETIME2 = '31/12/2008 09:01:01.1234567';  
SELECT @datevar;  
GO  


SET DATEFORMAT ymd;  
GO  
DECLARE @datevar DATETIME2 = '31/12/2008 09:01:01.1234567';  
SELECT @datevar;  
GO  


SET DATEFORMAT dmy;  
GO  
DECLARE @datevar DATETIME2 = '31.12.2008 09:01:01.1234567';  
SELECT @datevar;  
GO  				  

-------------------------------------------------
--ARITHABORT besser aktivieren, sonst evtl Performanceeinbußen
-------------------------------------------------

/*
Beendet eine Abfrage, wenn während der Abfrage ein Überlauffehler oder ein Fehler aufgrund einer Division durch Null auftritt.
*/


DECLARE @ARITHABORT VARCHAR(3) = 'OFF';  
IF ( (64 & @@OPTIONS) = 64 ) SET @ARITHABORT = 'ON';  
SELECT @ARITHABORT AS ARITHABORT;

---------------------------------------------------------
-- NOCOUNT
---------------------------------------------------------

/*
 betroffene Zeilenzahl zurückgeben lassen
*/
  SET NOCOUNT ON

select * from customers


SET NOCOUNT OFF

select * from customers

-----------------------------------------------------------
-- PROFILE
-----------------------------------------------------------

/*
Infos zur Abfrage inkl Plan
*/


---------------------------------------------
-- Messung Statistics
--------------------------------------------

/* 
IO und TIME
CPU Dauer in MS , Ausfürhungsdauer in ms und Anzahl gelesenen Seiten
Analyse und Kompilierzeit
*/



------------------------------------------
 -- ANSI NULL
------------------------------------------
/*
 Gibt an, dass sich die Vergleichsoperatoren Gleich (=) und Ungleich
 (<>) bei Verwendung mit NULL-Werten in SQL Server ISO-konform verhalten müssen.

Boolescher Ausdruck	SET ANSI_NULLS ON	SET ANSI_NULLS OFF
NULL = NULL		UNKNOWN						TRUE
1 = NULL		UNKNOWN						FALSE
NULL <> NULL	UNKNOWN						FALSE
1 <> NULL		UNKNOWN						TRUE
NULL > NULL		UNKNOWN						UNKNOWN
1 > NULL		UNKNOWN						UNKNOWN
NULL IS NULL	TRUE						TRUE
1 IS NULL		FALSE						FALSE
NULL IS NOT	NULL   FALSE					FALSE
1 IS NOT NULL	TRUE						TRUE

*/
CREATE TABLE dbo.t1 (a INT NULL);  
INSERT INTO dbo.t1 values (NULL),(0),(1);  
GO  
  

PRINT 'Testing ANSI_NULLS ON';  
SET ANSI_NULLS ON--OFF;  
GO  
DECLARE @varname int;  
SET @varname = NULL  
  
SELECT a   
FROM t1   
WHERE a = @varname;  
  
SELECT a   
FROM t1   
WHERE a <> @varname;  
  
SELECT a   
FROM t1   
WHERE a IS NULL;  
GO


--------------------------------------------------------
-- ANSI WARNING
--------------------------------------------------------
/*
wenn bei Aggregaten eine NULL vorkommt--> Warnung
oder string zu lang

*/

 CREATE TABLE T1   
(  
   a int,   
   b int NULL,   
   c varchar(20)  
);  
GO  
  
SET NOCOUNT ON;  
  
INSERT INTO T1   
VALUES (1, NULL, '')   
      ,(1, 0, '')  
      ,(2, 1, '')  
      ,(2, 2, '');  
  
SET NOCOUNT OFF;  
GO


PRINT '**** Setting ANSI_WARNINGS ON';  
GO  
  
SET ANSI_WARNINGS ON;  
GO  
  
PRINT 'Testing NULL in aggregate';  
GO  
SELECT a, SUM(b)   
FROM T1   
GROUP BY a;  
GO  
  
PRINT 'Testing String Overflow in INSERT';  
GO  
INSERT INTO T1   
VALUES (3, 3, 'Text string longer than 20 characters');  
GO  
  
PRINT 'Testing Divide by zero';  
GO  
SELECT a / b AS ab   
FROM T1;  
GO