select top 10 * from orders

select top 10 * from customers

select top 15 * from orders order by freight asc


--Welche Bestllung hat die höchsten Frachtkosten

select top 1 * from orders order by freight desc

select top 10 percent * from orders order by freight desc


--Firma: alle ersten 13 aus orders sortiert nach Frachtkosten aufsteigend
select top 15 * from orders order by freight asc
select top 13 with ties * from orders order by freight asc











