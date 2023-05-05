-- #tab lokale temp Tabelle
-- ##tab globale

--Gültigkeit: solange bis der Ersteller Verbindung schließt
              --oder sie löscht

select * into #t from sys.messages
select * into ##t from sys.messages




