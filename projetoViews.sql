---------------------- VIEWS -------------------

-- 1. View para a tabela RANDOM poder ser utilizada na UDF

CREATE VIEW gestaoCondominio.randomView
AS SELECT RAND() randomResult

SELECT randomResult FROM gestaoCondominio.randomView