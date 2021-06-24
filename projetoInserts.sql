--delete from gestaoCondominio.temAssociada
--delete from gestaoCondominio.associado
--delete from gestaoCondominio.zona
----
--delete from gestaoCondominio.proprietario
--delete from gestaoCondominio.condomino
----
--delete from gestaoCondominio.pessoa
--delete from gestaoCondominio.empresa
----
--delete from gestaoCondominio.entidade
--delete from gestaoCondominio.fornece
----
--delete from gestaoCondominio.seguro
--delete from gestaoCondominio.servico
----
--delete from gestaoCondominio.fracao
----
--delete from gestaoCondominio.condominio
----
--delete from gestaoCondominio.mensalidade
----
--delete from gestaoCondominio.pagamento

INSERT INTO gestaoCondominio.entidade
VALUES
(1, '964709662', 'luciusviniciusf@ua.pt', 'Lucius Filho', 'Rua São Sebastião 124')

INSERT INTO gestaoCondominio.entidade
VALUES
(2, '914281478', 'diana.siso@ua.pt', 'Diana Siso', 'Rua São José 984')

INSERT INTO gestaoCondominio.entidade
VALUES
(3, '123456789', 'randommail@gmail.com', 'Paulo Sousa', 'Rua Glória 199')

INSERT INTO gestaoCondominio.entidade
VALUES
(4, '987654321', 'diogomonteiro@ua.pt', 'Diogo Monteiro', 'Rua São Sebastião 124')

INSERT INTO gestaoCondominio.entidade
VALUES
(5, '123987456', 'dinislei@ua.pt', 'Dinis Lei', 'Av Silva 24')

INSERT INTO gestaoCondominio.entidade
VALUES
(6, '654321987', 'isabelrosario@ua.pt', 'Isabel Rosario', 'Av São João 88')

INSERT INTO gestaoCondominio.entidade
VALUES
(7, '321654000', 'afonsocampos@ua.pt', 'Afonso Campos', 'Rua São José 200')

INSERT INTO gestaoCondominio.entidade
VALUES
(8, '010203040', 'chadcamila@ua.pt', 'Chad Camila', 'Av Maria da Glória 12')

INSERT INTO gestaoCondominio.entidade
VALUES
(9, '102033311', 'tomecarvalho@ua.pt', 'Tomé Carvalho', 'Rua Arnaldo Simões Januário 241')

-------------------------------------

INSERT INTO gestaoCondominio.condominio 
VALUES 
('258341908', 0001, 'Condomínio Sul Ribeira', '20190609', null, 1, 50, 'Av. 25 de Abril 41, 3050-335 Mealhada')

INSERT INTO gestaoCondominio.condominio 
VALUES 
('279352856', 0002, 'Condomínio Porto Azul', '20201001', null, 1, 1200, 'Rua Doutor José Paulo Cancela, 3780-307 Anadia')

INSERT INTO gestaoCondominio.condominio 
VALUES 
('295831584', 0003, 'Condomínio Inspiração do Além', '20180202', null, 1, 90, 'R. Liberdade, 3750-779 Águeda')

INSERT INTO gestaoCondominio.condominio 
VALUES 
('253774987', 0004, 'Condomínio Avestruz Selvagem', '20190802', '20200802', 0, 734.98, 'R. Principal 21, Jafafe')

-------------------------------------------------

INSERT INTO gestaoCondominio.pessoa
VALUES
('297692330', '12345678', 'M', '20010917',1)


INSERT INTO gestaoCondominio.pessoa
VALUES
('123456789', '00100200', 'F', '20000426',2)


INSERT INTO gestaoCondominio.pessoa
VALUES
('999888222', '22299988', 'NB','19880509',3)


INSERT INTO gestaoCondominio.pessoa
VALUES
('987654321', '18475732', 'M', '20011225',4)


INSERT INTO gestaoCondominio.pessoa
VALUES
('178495637', '87584900', 'M', '20000830',5)


INSERT INTO gestaoCondominio.pessoa
VALUES
('856553758', '09463849', 'F', '19980401',6)


INSERT INTO gestaoCondominio.pessoa
VALUES
('992236485', '88443527', 'M', '20001012',7)


INSERT INTO gestaoCondominio.pessoa
VALUES
('759305867', '27584534', 'F', '19900101',8)


INSERT INTO gestaoCondominio.pessoa
VALUES
('756353556', '00495829', 'M', '19760407',9)

------------------------------------------------

INSERT INTO gestaoCondominio.entidade
VALUES
(10, '000111222', 'nicelevators@hotmail.com', 'Nice Elevators tda', 'Av São Alexandre 2')

INSERT INTO gestaoCondominio.entidade
VALUES
(11, '784648284', 'ultimateSecurity@gmail.com', 'Security Ultimate', 'Av São Alexandre 4')

INSERT INTO gestaoCondominio.entidade
VALUES
(12, '123658390', 'speedcleanfast@hotmail.com', 'SpeedClean', 'Rua São José 600')

INSERT INTO gestaoCondominio.entidade
VALUES
(13, '005968211', 'oficialMcDonalds@hotmail.com', 'Mc Donalds', 'Av São Vincente 14')

---------------------------------------------------------

INSERT INTO gestaoCondominio.empresa
VALUES
('172849686', 10)

INSERT INTO gestaoCondominio.empresa
VALUES
('858596970', 11)

INSERT INTO gestaoCondominio.empresa
VALUES
('123456789', 12)

INSERT INTO gestaoCondominio.empresa
VALUES
('987654321', 13)

----------------------------------------------------

INSERT INTO gestaoCondominio.fracao 
VALUES ('1A', 200, null, '258341908')

INSERT INTO gestaoCondominio.fracao 
VALUES ('1B', 210, null, '258341908')

INSERT INTO gestaoCondominio.fracao 
VALUES ('2A', 200, null, '258341908')

INSERT INTO gestaoCondominio.fracao 
VALUES ('2B', 210, null, '258341908')

INSERT INTO gestaoCondominio.fracao 
VALUES ('3A', 200, null, '258341908')

INSERT INTO gestaoCondominio.fracao 
VALUES ('3B', 210, null, '258341908')

--------------------------------------

INSERT INTO gestaoCondominio.fracao 
VALUES ('0A', 300, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('0B', 250, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('0C', 200, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('1A', 120, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('1B', 98, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('1C', 110, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('2A', 120, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('2B', 98, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('2C', 110, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('3A', 120, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('3B', 98, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('3C', 110, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('4A', 140, null, '279352856')

INSERT INTO gestaoCondominio.fracao 
VALUES ('4B', 160, null, '279352856')

-------------------------------------------

INSERT INTO gestaoCondominio.fracao
VALUES
('1A', 200, 'R. Liberdade, Condominio Inspiração do Além 1-A, 3750-779 Águeda', '295831584')

INSERT INTO gestaoCondominio.fracao
VALUES
('2A', 200, 'R. Liberdade, Condominio Inspiração do Além 2-A, 3750-779 Águeda', '295831584')

INSERT INTO gestaoCondominio.fracao
VALUES
('3A', 200, 'R. Liberdade, Condominio Inspiração do Além 3-A, 3750-779 Águeda', '295831584')

INSERT INTO gestaoCondominio.fracao
VALUES
('4A', 200, 'R. Liberdade, Condominio Inspiração do Além 4-A, 3750-779 Águeda', '295831584')

INSERT INTO gestaoCondominio.fracao
VALUES
('1B', 205, 'R. Liberdade, Condominio Inspiração do Além 1-B, 3750-779 Águeda', '295831584')

INSERT INTO gestaoCondominio.fracao
VALUES
('2B', 205, 'R. Liberdade, Condominio Inspiração do Além 2-B, 3750-779 Águeda', '295831584')

INSERT INTO gestaoCondominio.fracao
VALUES
('3B', 205, 'R. Liberdade, Condominio Inspiração do Além 3-B, 3750-779 Águeda', '295831584')

INSERT INTO gestaoCondominio.fracao
VALUES
('4B', 205, 'R. Liberdade, Condominio Inspiração do Além 4-B, 3750-779 Águeda', '295831584')

INSERT INTO gestaoCondominio.fracao
VALUES
('1A', 200, 'Condominio Avestruz Selvagem 1-A, R. Principal 21, Jafafe', '253774987')

INSERT INTO gestaoCondominio.fracao
VALUES
('2A', 200, 'Condominio Avestruz Selvagem 2-A, R. Principal 21, Jafafe', '253774987')

INSERT INTO gestaoCondominio.fracao
VALUES
('3A', 200, 'Condominio Avestruz Selvagem 3-A, R. Principal 21, Jafafe', '253774987')

INSERT INTO gestaoCondominio.fracao
VALUES
('1B', 200, 'Condominio Avestruz Selvagem 1-B, R. Principal 21, Jafafe', '253774987')

INSERT INTO gestaoCondominio.fracao
VALUES
('2B', 205, 'Condominio Avestruz Selvagem 2-B, R. Principal 21, Jafafe', '253774987')

INSERT INTO gestaoCondominio.fracao
VALUES
('3B', 205, 'Condominio Avestruz Selvagem 3-B, R. Principal 21, Jafafe', '253774987')

INSERT INTO gestaoCondominio.fracao
VALUES
('1C', 200, 'Condominio Avestruz Selvagem 1-C, R. Principal 21, Jafafe', '253774987')

INSERT INTO gestaoCondominio.fracao
VALUES
('2C', 205, 'Condominio Avestruz Selvagem 2-C, R. Principal 21, Jafafe', '253774987')

INSERT INTO gestaoCondominio.fracao
VALUES
('3C', 205, 'Condominio Avestruz Selvagem 3-C, R. Principal 21, Jafafe', '253774987')

-------------------------------------

INSERT INTO gestaoCondominio.seguro 
VALUES
(01, 'seguro multirriscos', 1000, null, 'Seguros 100%', 'Coletivo', '279352856', null)

INSERT INTO gestaoCondominio.seguro 
VALUES
(02, 'seguro multirriscos', 1200, null, 'Seguros 100%', 'Coletivo', '279352856', null)

INSERT INTO gestaoCondominio.seguro 
VALUES
(03, 'seguro multirriscos', 1100, null, 'Seguros 100%', 'Coletivo', '295831584', null)

INSERT INTO gestaoCondominio.seguro 
VALUES
(04, 'seguro contra-incendio', 1000, null,  'Seguros 100%', 'Coletivo', '279352856', null)

INSERT INTO gestaoCondominio.seguro 
VALUES
(05, 'seguro contra-incendio', 1200, null, 'Seguros 100%', 'Coletivo', '279352856', null)

INSERT INTO gestaoCondominio.seguro 
VALUES
(06, 'seguro contra-incendio', 1100, null, 'Seguros 100%', 'Coletivo', '295831584', null)

INSERT INTO gestaoCondominio.seguro 
VALUES
(07, 'seguro contra acidentes pessoais', 2000, 1300, 'Seguros Ok', 'Singualar',  '279352856', '1A')

----------------------------------------------------

INSERT INTO gestaoCondominio.servico 
VALUES
(0001, 'Limpeza', 55.40, 4, null, '279352856')

INSERT INTO gestaoCondominio.servico 
VALUES
(0002, 'Limpeza', 50.20, 3, null, '258341908')

INSERT INTO gestaoCondominio.servico 
VALUES
(0003, 'Limpeza', 60.40, 5, null, '295831584')

INSERT INTO gestaoCondominio.servico 
VALUES
(0004, 'Segurança', 237.20, 24, null, '279352856')

INSERT INTO gestaoCondominio.servico 
VALUES
(0005, 'Segurança', 237.20, 24, null, '295831584')

INSERT INTO gestaoCondominio.servico 
VALUES
(0006, 'Elevador', 40.50, 24, null, '258341908')

INSERT INTO gestaoCondominio.servico 
VALUES
(0007, 'Elevador', 40.50, 24, null, '279352856')

INSERT INTO gestaoCondominio.servico 
VALUES
(0008, 'Elevador', 40.20, 24, null, '295831584')

------------------------------------------------

INSERT INTO gestaoCondominio.zona 
VALUES
(0001, 'Elevador')

INSERT INTO gestaoCondominio.zona 
VALUES
(0002, 'Garagem')

INSERT INTO gestaoCondominio.zona 
VALUES
(0003, 'Campo de Volei')

INSERT INTO gestaoCondominio.zona 
VALUES
(0004, 'Lojas')

INSERT INTO gestaoCondominio.zona 
VALUES
(0005, 'Churrasqueira')

---------------------------------------------

INSERT INTO gestaoCondominio.proprietario
VALUES
(1,  '295831584', '1A', '20191008', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(2,'253774987', '1C',  '20100228', '20160607')

INSERT INTO gestaoCondominio.proprietario
VALUES
(1, '253774987','1C',  '20160608', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(5,'295831584', '1B',  '20180909', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(7, '295831584','2A',  '20121122', '20140224')

INSERT INTO gestaoCondominio.proprietario
VALUES
(2, '295831584','2A',  '20140225', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(8, '295831584','2B',  '20180910', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(9, '295831584','4A',  '20160101', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(2, '295831584','3A',  '20210101', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(3,  '295831584','3B', '20001109', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(1,  '295831584','4B', '20210202', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(12, '253774987','1A',  '20120131', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(10, '253774987','1B',  '20180914', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(12, '253774987','2A' , '20120131', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(11, '253774987','2B',  '20140320', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(13, '253774987','2C',  '20101011', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(13, '253774987','3A',  '20150505', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(10, '253774987','3B',  '20170714', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(11, '253774987','3C',  '20140408', NULL)

---------------------------------------

INSERT INTO gestaoCondominio.condomino
VALUES
(1, '295831584','1A',  '20191008', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(2, '253774987','1C',  '20200228', '20200607')

INSERT INTO gestaoCondominio.condomino
VALUES
(4, '295831584','1A',  '20200612', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(5,'295831584', '1B',  '20180909', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(7, '295831584','2A',  '20191122', '20200224')

INSERT INTO gestaoCondominio.condomino
VALUES
(2, '295831584','2A',  '20190225', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(8, '295831584','2B',  '20180910', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(9, '295831584','4A',  '20190101', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(2, '295831584','3A',  '20210101', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(3,  '295831584','3B', '20201109', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(1,  '295831584','4B', '20210202', NULL)

------------------------------------------

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '295831584', '1A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '295831584', '2A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '295831584', '3A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '295831584', '4A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '295831584', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '295831584', '2B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '295831584', '3B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '295831584', '4B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '295831584', '1A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '295831584', '2A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '295831584', '3A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '295831584', '4A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '295831584', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '295831584', '2B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '295831584', '3B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '295831584', '4B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '295831584', '4B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '295831584', '4B')
----------------------------

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '253774987', '1A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '253774987', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '253774987', '1C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '253774987', '2A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '253774987', '2B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '253774987', '2C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '253774987', '3A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '253774987', '3B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '253774987', '3C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '253774987', '1A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '253774987', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '253774987', '1C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '253774987', '2A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '253774987', '2B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '253774987', '2C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '253774987', '3A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '253774987', '3B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '253774987', '3C')

-- ----------------------
INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '258341908', '1A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '258341908', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '258341908', '2A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '258341908', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '258341908', '3A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '258341908', '3B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '258341908', '1A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '258341908', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '258341908', '2A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '258341908', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '258341908', '3A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '258341908', '3B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0003, '258341908', '1A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0003, '258341908', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0003, '258341908', '2A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0003, '258341908', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0003, '258341908', '3A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0003, '258341908', '3B')

-----------------------------

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0004, '279352856', '0C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0004, '279352856', '0B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0004, '279352856', '0A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '279352856', '1A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '279352856', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '279352856', '1C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '279352856', '2A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '279352856', '2B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '279352856', '2C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '279352856', '3A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '279352856', '3B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '279352856', '3C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '279352856', '4A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '279352856', '4B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '279352856', '1A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '279352856', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '279352856', '1C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '279352856', '2A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '279352856', '2B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '279352856', '2C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '279352856', '3A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '279352856', '3B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '279352856', '3C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '279352856', '4A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0002, '279352856', '4B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '279352856', '1A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '279352856', '1B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '279352856', '1C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '279352856', '2A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '79352856', '2B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '279352856', '2C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '279352856', '3A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '279352856', '3B')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '279352856', '3C')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '279352856', '4A')

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0005, '279352856', '4B')

-- ----------------------

INSERT INTO gestaoCondominio.proprietario
VALUES
(3,  '258341908', '1A', '20191008', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(13,  '258341908', '1B', '20200220', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(8,  '258341908', '2A', '20120821', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(8,  '258341908', '2B', '20120821', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(11,  '258341908', '3A', '20140915', '20170409')

INSERT INTO gestaoCondominio.proprietario
VALUES
(2,  '258341908', '3A', '20170410', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(2,  '258341908', '3B', '20181009', NULL)

----------------------------------------------

INSERT INTO gestaoCondominio.proprietario
VALUES
(13,  '279352856', '0A', '20191008', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(13,  '279352856', '0B', '20191008', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(13,  '279352856', '0C', '20191008', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(6,  '279352856', '1A', '20200127', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(7,  '279352856', '1B', '20170707', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(7,  '279352856', '1C', '20160606', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(9,  '279352856', '2A', '20190909', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(10,  '279352856', '2B', '20150505', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(6,  '279352856', '2C', '20160130', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(2,  '279352856', '3A', '20210330', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(3,  '279352856', '3B', '20161008', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(4,  '279352856', '3C', '20190810', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(13,  '279352856', '4A', '20191008', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(1,  '279352856', '4B', '20140404', NULL)

-----------------------------------------

INSERT INTO gestaoCondominio.entidade
VALUES
(14, '875839359', 'lucaspereira@hotmail.com', 'Lucas Pereira', 'Rua São Bernado 28')

INSERT INTO gestaoCondominio.entidade
VALUES
(15, '868333450', 'johnsmith@gmail.pt', 'John Smith', 'Rua São Vincente 188')

INSERT INTO gestaoCondominio.entidade
VALUES
(16, '987321755', 'alicedasilva@hotmail.com', 'Alice Silva', 'Av Urubu 34')

INSERT INTO gestaoCondominio.entidade
VALUES
(17, '102938400', 'alexsaria@gmail.com', 'Alex Saria', 'Rua Liberdade 122')

INSERT INTO gestaoCondominio.entidade
VALUES
(18, '890123050', 'mramogus@sus.jp', 'Ian Sakamoto', 'Av Maria da Glória 12')

INSERT INTO gestaoCondominio.entidade
VALUES
(19, '192939405', 'loremipsum@generator.com', 'Laura Imps', 'Av São Alexandre 12')

INSERT INTO gestaoCondominio.entidade
VALUES
(20, '859030220', 'danielmonteiro@ua.pt', 'Daniel Monteiro', 'Av São Bernado 1024')

INSERT INTO gestaoCondominio.entidade
VALUES
(21, '467382930', 'carloscosta@ua.pt', 'Carlos Costa', 'Rua Santa Maria da Glória 27')

INSERT INTO gestaoCondominio.entidade
VALUES
(22, '098543200', 'jsp@ua.pt', 'Joaquim Pinto', 'Rua Santa Maria da Glória 28')

INSERT INTO gestaoCondominio.entidade
VALUES
(23, '555889300', 'carlosbastos@ua.pt', 'Carlos Bastos', 'Rua Santa Maria da Glória 127')

INSERT INTO gestaoCondominio.entidade
VALUES
(24, '696900850', 'verakharlanmova@ua.pt', 'Vera Kharlamova', 'Rua Principal do Centro 4')

INSERT INTO gestaoCondominio.entidade
VALUES
(25, '123220000', 'cruzcruz@ua.pt', 'Cruz Cruz', 'Rua Pereira Martins 99')

INSERT INTO gestaoCondominio.entidade
VALUES
(26, '855383111', 'alexandremartins@ua.pt', 'Alexandre Martins', 'Rua Santa Maria da Glória 57')

INSERT INTO gestaoCondominio.entidade
VALUES
(27, '198949918', 'iloveminecraft@gmail.com', 'Steven Alex', 'Rua da Terra 34')

INSERT INTO gestaoCondominio.entidade
VALUES
(28, '123948449', 'noobmaster69@sus.jp', 'Thor Martins', 'Rua da Terra 69')

--------------------------------------------------------------------------

INSERT INTO gestaoCondominio.condomino
VALUES
(14, '258341908','1A',  '20191011', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(15,  '258341908', '1B', '20200221', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(16,  '258341908', '2A', '20190925', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(17,  '258341908', '2B', '20190921', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(18,  '258341908', '3A', '20200915', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(19,  '258341908', '3B', '20191110', NULL)

--------------------------------------------------------------------

INSERT INTO gestaoCondominio.pessoa
VALUES
('758393940', '53183940', 'M', '19880917',14)

INSERT INTO gestaoCondominio.pessoa
VALUES
('473819019', '98374000', 'M', '19670122',15)

INSERT INTO gestaoCondominio.pessoa
VALUES
('182379128', '54398478', 'F','19980509',16)

INSERT INTO gestaoCondominio.pessoa
VALUES
('958734958', '43090009', 'F', '19990909',17)

INSERT INTO gestaoCondominio.pessoa
VALUES
('591797909', '86889940', 'M', '19980808',18)

INSERT INTO gestaoCondominio.pessoa
VALUES
('378982788', '99993333', 'F', '19970707',19)

INSERT INTO gestaoCondominio.pessoa
VALUES
('490804238', '09483942', 'M', '19960606',20)

INSERT INTO gestaoCondominio.pessoa
VALUES
('893829138', '12313100', 'M', '19800101',21)

INSERT INTO gestaoCondominio.pessoa
VALUES
('831830183', '34534501', 'M', '19950505',22)

INSERT INTO gestaoCondominio.pessoa
VALUES
('234580810', '05498359', 'M', '19940404',23)

INSERT INTO gestaoCondominio.pessoa
VALUES
('598131235', '23239895', 'F', '19930303',24)

INSERT INTO gestaoCondominio.pessoa
VALUES
('631531211', '93842000', 'M', '19920202',25)

INSERT INTO gestaoCondominio.pessoa
VALUES
('123092302', '09809340', 'M', '19910101',26)

INSERT INTO gestaoCondominio.pessoa
VALUES
('098590488', '30456409', 'NB', '19890808',27)

INSERT INTO gestaoCondominio.pessoa
VALUES
('234924799', '23452278', 'M', '19901212',28)

---------------------------------------------------------------------------

INSERT INTO gestaoCondominio.entidade
VALUES
(29, '998604489', 'mariadasilva@hotmail.com', 'Maria Silva', 'Av da Paz 28')

INSERT INTO gestaoCondominio.entidade
VALUES
(30, '893458719', 'telmocunha@ua.pt', 'Telmo Cunha', 'Av da Paz 90')

INSERT INTO gestaoCondominio.entidade
VALUES
(31, '123794569', 'tos@ua.pt', 'Tomé Oliveira', 'Av Princial 668')

INSERT INTO gestaoCondominio.entidade
VALUES
(32, '123845200', 'mos@ua.pt', 'Miguel Oliveira', 'Av Princial 668')

INSERT INTO gestaoCondominio.entidade
VALUES
(33, '094860403', 'paularama@ua.pt', 'Paula Rama', 'Av Principal 666')

INSERT INTO gestaoCondominio.entidade
VALUES
(34, '857834753', 'kellyfernanda@ua.pt', 'Kelly Fernanda', 'Av Principal 665')

---------------------------------------------------------------------------------

INSERT INTO gestaoCondominio.pessoa
VALUES
('023483450', '50968300', 'F', '19880808',29)

INSERT INTO gestaoCondominio.pessoa
VALUES
('234875298', '43234126', 'M', '19870707',30)

INSERT INTO gestaoCondominio.pessoa
VALUES
('131122211', '37683766', 'M', '19860606',31)

INSERT INTO gestaoCondominio.pessoa
VALUES
('000101123', '91891319', 'M', '19850505',32)

INSERT INTO gestaoCondominio.pessoa
VALUES
('297973911', '12351575', 'F', '19840404',33)

INSERT INTO gestaoCondominio.pessoa
VALUES
('123841898', '98794900', 'F', '19830303',34)

---------------------------------------------------

INSERT INTO gestaoCondominio.condomino
VALUES
(20,  '279352856', '0A', '20201108', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(21,  '279352856', '0B', '20210108', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(22,  '279352856', '0C', '20210202', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(23,  '279352856', '1A', '20210227', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(24,  '279352856', '1B', '20201207', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(25,  '279352856', '1C', '20210606', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(26,  '279352856', '2A', '20201109', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(27,  '279352856', '2B', '20210505', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(28,  '279352856', '2C', '20210430', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(29,  '279352856', '3A', '20210401', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(30,  '279352856', '3B', '20201108', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(31,  '279352856', '3C', '20201210', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(32,  '279352856', '3C', '20201110', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(33,  '279352856', '4A', '20201101', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(34,  '279352856', '4B', '20210422', NULL)

--------------------------------------------

INSERT INTO gestaoCondominio.fornece
VALUES
(0008, 10, '20200101', null)

INSERT INTO gestaoCondominio.fornece
VALUES
(0006, 10, '20200101', null)

INSERT INTO gestaoCondominio.fornece
VALUES
(0007, 10, '20200101', null)

INSERT INTO gestaoCondominio.fornece
VALUES
(0004, 11, '20200102', null)

INSERT INTO gestaoCondominio.fornece
VALUES
(0005, 11, '20200102', null)

INSERT INTO gestaoCondominio.fornece
VALUES
(0001, 12, '20200101', null)

INSERT INTO gestaoCondominio.fornece
VALUES
(0002, 12, '20200102', null)

INSERT INTO gestaoCondominio.fornece
VALUES
(0003, 12, '20200103', null)

