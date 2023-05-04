/*

Sortieren der Ergebnismenge
Erstsortierung und Zweitsortierung
ASC DESC

*/

 select orderid 
		, requireddate, shippeddate
		, datediff(dd, requireddate, shippeddate)  as Ueberfaellig
		--, datediff(dd, shippeddate,requireddate)   
from orders 
order by   Ueberfaellig desc



