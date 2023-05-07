--�berfl�ssige Indizes identifizieren

--kosten Performance bei INSERT / DELETE, da sie gepfelgt werden m�ssen

--Systemsichten
-- select * from sys.dm_db_index_physical_Stats verkn�pft mikt sys.indexes
------------------------------
--Alternative: sp_blitzIndex  --von Brent Ozar..findet auch �berplappende Indizes zB    IX_A       IX_AB     IX_ABC

EXEC dbo.sp_BlitzIndex @DatabaseName='Northwind', @SchemaName='dbo', @TableName='Kundeumsatz';
------------------------------


select object_name(i.object_id) as TableName
      ,i.type_desc,i.name
      ,us.user_seeks, us.user_scans
      ,us.user_lookups,us.user_updates
      ,us.last_user_scan, us.last_user_update
  from sys.indexes as i
       left outer join sys.dm_db_index_usage_stats as us
                    on i.index_id=us.index_id
                   and i.object_id=us.object_id
 where objectproperty(i.object_id, 'IsUserTable') = 1
go








