--Variablen


declare @var1 as int

-- @var lokale variable
-- @@var globale variable

/*

Gültigkeit.. nur während des Batches
nur der Ersteller hat Zugriff

globale..
jeder kann zugrreifen solange Var im Batch läuft....
*/

declare @var as int


set @var = 3

select @var