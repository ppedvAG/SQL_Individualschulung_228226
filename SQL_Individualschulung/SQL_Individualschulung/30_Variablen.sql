--Variablen


declare @var1 as int

-- @var lokale variable
-- @@var globale variable

/*

G�ltigkeit.. nur w�hrend des Batches
nur der Ersteller hat Zugriff

globale..
jeder kann zugrreifen solange Var im Batch l�uft....
*/

declare @var as int


set @var = 3

select @var