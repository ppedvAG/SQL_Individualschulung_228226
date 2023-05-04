--Benutzerdefinierte Funktion

--Skalar .. Tabellenwertfunktion

create function fskalar(@par1 int, @par2 int) 
returns int
as
begin
   return (select @par1 * @par2)
end

select dbo.fskalar(100,200)

--(inline) tvf
create function ftab (@par1 int,@par2 int)
returns table
as
return
select @par1 as Sp1, @par2 as sp2

select * from ftab(100,200)


--MSTVF
CREATE FUNCTION dbo.fMSTVF (@par1 INTEGER)
RETURNS @tabelle TABLE
		 (sp1 int,
		  sp2 int,
		  sp3 int)
AS 
BEGIN
	/*  keine temporären Tabellen
	select freight,orderid, employeeid into #t from orders
	where freight < @par1
	--CTE VIEW etc
	*/ 
	with cte as
	(
	select freight,orderid, employeeid  from orders
	where freight < @par1
	)
	insert  @tabelle
	select * from cte	 	
 return
END
GO

select * from fMSTVF(10)