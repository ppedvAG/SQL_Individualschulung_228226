--CTE

--CTE

--Unterabfragen 

with cte
as
(select ......)
select * from cte

--Hierarchien
 with cte (sp1 , sp2)
 as
 (
 Anker  
 UNION ALL
 select ... tab inner join cte tab.sp1 = cte.sp2
 )
 select * from cte







WITH CTE
as
(
select country, city from customers
)
select * from cte

;with cte2
as
(
select Employeeid, sum(freight)as Summe from orders
group by employees
) 
select  top 1 * from cte2 order by summe asc
UNION 
select  top 1 * from cte2 order by summe desc


select reportsto,* from employees






;WITH CTENAMEN
AS
(select employeeid, min(freight) as MinFracht from orders group by employeeid)
SELECT * from CTENAMEN




with cte
as
(select employeeid, sum(freight) as SUMMEFRACHT from orders
 group by employeeid)
 select avg(summefracht) from cte


 --Rekursion

 select * from employees
 select lastname, employeeid, reportsto from Employees where reportsto is null

  select e.lastname, e.employeeid, e.reportsto 
 from employees e   where reportsto = 2 inner join cte cte.employeeid = e.reportsto
 --Hierarchieausgabe

 with CTE
 as
 (SELECT --... ANKER .. einstiegspunkt
 UNION ALL
 select e.lastname, e.employeeid, e.reportsto 
 from employees e inner join cte cte.employeeid = e.reportsto

 with cteANG
 as
 ( select lastname, employeeid, reportsto from Employees where reportsto is null
 UNION ALL
   select e.lastname, e.employeeid, e.reportsto 
 from employees e   inner join cteAng on cteAng.employeeid = e.reportsto
 ) select * from cteAng


;with cteAngestellte
as
(
select Lastname, employeeid, reportsto, 1 as Rang from employees where reportsto is null --der Einstiegspunkt
UNION ALL
select e.Lastname, e.employeeid, e.reportsto, RANG+1 from employees  e
										inner join cteAngestellte c on c.EmployeeID=e.ReportsTo
	)
select * from cteAngestellte where rang = 2


with cte
as
(select employeeid, sum(freight) as SUMMEFRACHT from orders
 group by employeeid)
 select avg(summefracht) from cte


 --Rekursion

 select * from employees
 select lastname, employeeid, reportsto from Employees where reportsto is null

  select e.lastname, e.employeeid, e.reportsto 
 from employees e   where reportsto = 2inner join cte cte.employeeid = e.reportsto
 --Hierarchieausgabe

 with CTE
 as
 (SELECT --... ANKER .. einstiegspunkt
 UNION ALL
 select e.lastname, e.employeeid, e.reportsto 
 from employees e inner join cte cte.employeeid = e.reportsto

 with cteANG
 as
 ( select lastname, employeeid, reportsto from Employees where reportsto is null
 UNION ALL
   select e.lastname, e.employeeid, e.reportsto 
 from employees e   inner join cteAng on cteAng.employeeid = e.reportsto
 ) select * from cteAng


;with cteAngestellte
as
(
select Lastname, employeeid, reportsto, 1 as Rang from employees where reportsto is null --der Einstiegspunkt
UNION ALL
select e.Lastname, e.employeeid, e.reportsto, RANG+1 from employees  e
										inner join cteAngestellte c on c.EmployeeID=e.ReportsTo
	)
select * from cteAngestellte where rang = 2

select * from Kunden c inner join orders2 o on c.CustomerID = o.customerid



 --(AngID, Nachname, ManagerID, Ebene, Manager)

 ---und das
 2	Fuller	||	NULL	2	Fuller
1	Davolio	||--->Fuller	2	2	Fuller
3	Leverling	||--->Fuller	2	2	Fuller
4	Peacock	||--->Fuller	2	2	Fuller
5	Buchanan	||--->Fuller	2	2	Fuller
8	Callahan	||--->Fuller	2	2	Fuller
6	Suyama	||--->Fuller--->Buchanan	5	5	Buchanan
7	King	||--->Fuller--->Buchanan	5	5	Buchanan
9	Dodsworth	||--->Fuller--->Buchanan	5	5	Buchanan

with cteang
as
(
select employeeid, lastname, reportsto, convert(varchar(50),'||') as Ebene from employees where reportsto is null--Ankerpunkt
UNION ALL
select e.employeeid, e.lastname, e.reportsto, convert(varchar(50),Ebene + '--->||'+ cteang.lastname)   from employees e inner join cteang 
			on e.reportsto = cteang.employeeid
)
select cteang.*, e.lastname from cteang 
				left join employees e on cteang.reportsto = e.employeeid
--where ebene = 3




--Wieviele % der Gesamtrechnug macht die einzelene Position aus
;with cte (orderid, summe, PrNummer,Proz)
as
(
select top 100 percent 
		orderid,   SUM(unitprice*quantity) over (partition by orderid) SUMME, 
		ProductID, convert(varchar(50),((UnitPrice*Quantity)/SUM(unitprice*quantity) 
					over (partition by orderid))*100) +'%' as PROZ
from [Order Details]
order by 1,3 desc
)
select *,rank() over  (partition by orderid order by proz)  from cte 