--und wie lösen wir das am besten

set statistics io, time on		 --Messung

--Umsatz pro Kunden
--per Join  und per View





--join
select companyname, sum(unitprice*quantity) 
	from 
			customers c inner join orders o				on c.customerid = o.customerid
						inner join [order details] od	on od.orderid = o.orderid
group by companyname

--view
select companyname, sum(possumme)  from vkundeumsatz
group by companyname

--f()
select companyname, sum(RngSumme) 
	from 
			customers c inner join orders o	on c.customerid = o.customerid
group by companyname


--max Frachtkosten pro ang
select employeeid , max(freight) from orders group by employeeid

--was ist der druschnitt der maax kosten
select avg(maxFracht) from 
( select employeeid , max(freight) maxFracht from orders group by employeeid  ) T	  

--	#t



;with cte (angid, maxFr)
as
(
 select employeeid , max(freight) maxFracht from orders group by employeeid
)
select avg(maxFr) from cte


select employeeid , reportsto from employees

 with cte (sp1 , sp2)
 as
 (
 Anker  
 UNION ALL
 select ... tab inner join cte tab.sp1 = cte.sp2
 )
 select * from cte


 with cteang 
 as
 (
 select lastname , employeeid , 1 as Ebene from employees  where reportsto is null
 UNION ALL
 select e1.lastname, e1.employeeid , ebene +1 from employees e1 inner join cteang ct on e1.reportsto = ct.employeeid
 )
 select * from cteang  order by ebene, lastname
