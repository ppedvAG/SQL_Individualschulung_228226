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
GO

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



--------BSP

--Skalarfunktion

select dbo.funk(100) --> Wert zurück

create function fBrutto(@netto money) returns money
as
BEGIN
          return(select @netto*1.22)
END

select dbo.fbrutto (100)

 --hier di
select freight, dbo.fbrutto(freight) from orders --hier ist die F() ok
where dbo.fbrutto(freight) < 100--schlecht weil zeilneweises druchgehen  scan


select dbo.fRngSumme(10248) -- 440

select * from [order details]



create function dbo.fRngSumme(@bestId int) returns money
as
BEGIN
		return  (
				select sum(unitprice*quantity) from [order details] where orderid = @BestId
				)
END

select dbo.fRngSumme(10248)--440


select * from sys.all_sql_modules where definition like 'create view%' and definition like '%Schemabinding%'



ALTER DATABASE [Northwind] SET COMPATIBILITY_LEVEL = 150


select dbo.fRngSumme(orderid),* from orders
where dbo.fRngSumme(orderid) > 500


alter table orders add RngSumme as dbo.fRngSumme(orderid)

select * from orders where Rngsumme < 500