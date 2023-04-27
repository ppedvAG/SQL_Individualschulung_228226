/*

 Datentypen

TEXT

varchar(50)
char(50)

nchar(50)
nvarchar(50)

int
smallint
bigint
tinyint
bit

deciaml(18,0)

money

datetime

datetime2
smalldatetime
date 
time


evtl muss konvertiert werden

*/

   sp_helplanguage

   set language	 German

   select datename(dw, getdate())

    set language	 Italian

   select datename(dw, getdate())


 ---------------------------------

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
