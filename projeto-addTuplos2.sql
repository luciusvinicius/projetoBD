
create table gestaoCondominio.pagamento (
	numRecibo int not null primary key,
	valorPagamento money not null,
	entidade char(5),
	referencia char(9),
	dataPagamento date not null,
	tipoPagamento varchar(30) not null,
)

create table gestaoCondominio.entidade(
	identificador int primary key not null,
	telemovel char(9) not null unique,
	email varchar(120) not null unique,
	nome varchar(120) not null,
	enderecoAtual varchar(200) not null
)

create table gestaoCondominio.condominio (
	numContribuinte char(9) not null primary key,
	numRegistro	int	not null unique,
	nome varchar(100) not null,
	inicioExercicio date not null,
	fimExercicio date,
	estado bit not null,
	saldo money not null,
	endereço varchar(200) not null unique,
)

create table gestaoCondominio.pessoa(
	numContribuinte char(9) not null primary key,
	numCC char(8) not null unique,
	genero varchar(2) not null,
	dataNascimento date not null,
	FK_Entidade int references gestaoCondominio.entidade(identificador) not null,
)

create table gestaoCondominio.servico(
	codigo int not null primary key,
	designacao varchar(120) not null,
	custo money not null,
	horas int not null,
	FK_Pagamento int references gestaoCondominio.pagamento(numRecibo) default null,
	FK_Condominio char(9) references gestaoCondominio.condominio(numContribuinte) not null,
)

create table gestaoCondominio.empresa(
	nipc char(9) primary key not null,
	identificador int references gestaoCondominio.entidade(identificador) not null,
)

create table gestaoCondominio.fornece(
	FK_Servico int references gestaoCondominio.servico(codigo) not null,
	FK_Entidade int references gestaoCondominio.entidade(identificador) not null,
	inicioExercicio date not null,
	fimExercicio date,
)

create table gestaoCondominio.mensalidade(
  ano smallint not null,
  descricao varchar(120),
  valor money not null,
  numMensalidadesPagas tinyint not null,
  FK_Entidade int references gestaoCondominio.entidade(identificador) not null,
  FK_Pagamento int references gestaoCondominio.pagamento(numRecibo) default null,
  FK_Condominio char(9) references gestaoCondominio.condominio(numContribuinte) not null,
  FK_Fracao char(2),
  foreign key (FK_Fracao, FK_Condominio) references gestaoCondominio.fracao(identificador, FK_Condominio),
  primary key (FK_Fracao, FK_Condominio, ano)
)

create table gestaoCondominio.fracao(
	identificador char(2) not null,
	area int not null,
	localizacao varchar(200),
	FK_Condominio char(9) references gestaoCondominio.condominio(numContribuinte) not null,
	primary key (identificador, FK_Condominio)
)

create table gestaoCondominio.seguro(
	numApolice int primary key not null,
	designacao varchar(200) not null,
	capitalObrigatorio money not null,
	capitalFacultativo money,
	nomeCompanhia varChar (120) not null,
	tipo varchar(20) not null,
	FK_Condominio char(9) references gestaoCondominio.condominio(numContribuinte) not null,
	FK_Fracao char(2),
	foreign key (FK_Fracao, FK_Condominio) references gestaoCondominio.fracao(identificador, FK_Condominio),
)

create table gestaoCondominio.zona(
	codigo int primary key not null,
	designacao varchar(120) not null,
)

create table gestaoCondominio.temAssociada(
	FK_Zona	int references gestaoCondominio.zona(codigo) not null,
	FK_Condominio char(9),
	FK_Fracao char(2),
	foreign key (FK_Fracao, FK_Condominio) references gestaoCondominio.fracao(identificador, FK_Condominio),
)

create table gestaoCondominio.proprietario(
	FK_Entidade int references gestaoCondominio.entidade(identificador) not null,
	FK_Condominio char(9),
	FK_Fracao char(2),
	foreign key (FK_Fracao, FK_Condominio) references gestaoCondominio.fracao(identificador, FK_Condominio),
	inicioExercicio date not null,
	fimExercicio date,
)

create table gestaoCondominio.condomino(
	FK_Entidade int references gestaoCondominio.entidade(identificador) not null,
	FK_Condominio char(9),
	FK_Fracao char(2),
	foreign key (FK_Fracao, FK_Condominio) references gestaoCondominio.fracao(identificador, FK_Condominio),
	inicioExercicio date not null,
	fimExercicio date,
)

CREATE TABLE gestaoCondominio.associado(
	FK_Condominio char(9),
	FK_Fracao	char(2),
	FK_Mensalidade	smallint,
	FK_pagamento	int references gestaoCondominio.pagamento(numRecibo),
	foreign key (FK_Fracao, FK_Condominio, FK_Mensalidade) references gestaoCondominio.mensalidade(FK_Fracao,FK_Condominio,ano)
)

----------------------------------------------------
-------------------- INSERTS -----------------------
----------------------------------------------------

INSERT INTO gestaoCondominio.entidade
VALUES
(1, '964709662', 'luciusviniciusf@ua.pt', 'Lucius Filho', 'Rua São Sebastião 124'),
(2, '914281478', 'diana.siso@ua.pt', 'Diana Siso', 'Rua São José 984'),
(3, '123456789', 'randommail@gmail.com', 'Paulo Sousa', 'Rua Glória 199'),
(4, '987654321', 'diogomonteiro@ua.pt', 'Diogo Monteiro', 'Rua São Sebastião 124'),
(5, '123987456', 'dinislei@ua.pt', 'Dinis Lei', 'Av Silva 24'),
(6, '654321987', 'isabelrosario@ua.pt', 'Isabel Rosario', 'Av São João 88'),
(7, '321654000', 'afonsocampos@ua.pt', 'Afonso Campos', 'Rua São José 200'),
(8, '010203040', 'chadcamila@ua.pt', 'Chad Camila', 'Av Maria da Glória 12'),
(9, '102033311', 'tomecarvalho@ua.pt', 'Tomé Carvalho', 'Rua Arnaldo Simões Januário 241')


INSERT INTO gestaoCondominio.condominio 
VALUES 
('258341908', 0001, 'Condomínio Sul Ribeira', '20190609', null, 1, 50, 'Av. 25 de Abril 41, 3050-335 Mealhada'),
('279352856', 0002, 'Condomínio Porto Azul', '20201001', null, 1, 1200, 'Rua Doutor José Paulo Cancela, 3780-307 Anadia'),
('295831584', 0003, 'Condomínio Inspiração do Além', '20180202', null, 1, 90, 'R. Liberdade, 3750-779 Águeda'),
('253774987', 0004, 'Condomínio Avestruz Selvagem', '20190802', '20200802', 0, 734.98, 'R. Principal 21, Jafafe')

INSERT INTO gestaoCondominio.pessoa
VALUES
('297692330', '12345678', 'M', '20010917',1),
('123456789', '00100200', 'F', '20000426',2),
('999888222', '22299988', 'NB','19880509',3),
('987654321', '18475732', 'M', '20011225',4),
('178495637', '87584900', 'M', '20000830',5),
('856553758', '09463849', 'F', '19980401',6),
('992236485', '88443527', 'M', '20001012',7),
('759305867', '27584534', 'F', '19900101',8),
('756353556', '00495829', 'M', '19760407',9)

INSERT INTO gestaoCondominio.entidade
VALUES
(10, '000111222', 'nicelevators@hotmail.com', 'Nice Elevators tda', 'Av São Alexandre 2'),
(11, '784648284', 'ultimateSecurity@gmail.com', 'Security Ultimate', 'Av São Alexandre 4'),
(12, '123658390', 'speedcleanfast@hotmail.com', 'SpeedClean', 'Rua São José 600'),
(13, '005968211', 'oficialMcDonalds@hotmail.com', 'Mc Donalds', 'Av São Vincente 14')

INSERT INTO gestaoCondominio.empresa
VALUES
('172849686', 10),
('858596970', 11),
('123456789', 12),
('987654321', 13)

INSERT INTO gestaoCondominio.fracao 
VALUES 
('1A', 200, null, '258341908'),
('1B', 210, null, '258341908'),
('2A', 200, null, '258341908'),
('2B', 210, null, '258341908'),
('3A', 200, null, '258341908'),
('3B', 210, null, '258341908')

INSERT INTO gestaoCondominio.fracao 
VALUES 
('0A', 300, null, '279352856'),
('0B', 250, null, '279352856'),
('0C', 200, null, '279352856'),
('1A', 120, null, '279352856'),
('1B', 98, null, '279352856'),
('1C', 110, null, '279352856'),
('2A', 120, null, '279352856'),
('2B', 98, null, '279352856'),
('2C', 110, null, '279352856'),
('3A', 120, null, '279352856'),
('3B', 98, null, '279352856'),
('3C', 110, null, '279352856'),
('4A', 140, null, '279352856'),
('4B', 160, null, '279352856')

INSERT INTO gestaoCondominio.fracao
VALUES
('1A', 200, 'R. Liberdade, Condominio Inspiração do Além 1-A, 3750-779 Águeda', '295831584'),
('2A', 200, 'R. Liberdade, Condominio Inspiração do Além 2-A, 3750-779 Águeda', '295831584'),
('3A', 200, 'R. Liberdade, Condominio Inspiração do Além 3-A, 3750-779 Águeda', '295831584'),
('4A', 200, 'R. Liberdade, Condominio Inspiração do Além 4-A, 3750-779 Águeda', '295831584'),
('1B', 205, 'R. Liberdade, Condominio Inspiração do Além 1-B, 3750-779 Águeda', '295831584'),
('2B', 205, 'R. Liberdade, Condominio Inspiração do Além 2-B, 3750-779 Águeda', '295831584'),
('3B', 205, 'R. Liberdade, Condominio Inspiração do Além 3-B, 3750-779 Águeda', '295831584'),
('4B', 205, 'R. Liberdade, Condominio Inspiração do Além 4-B, 3750-779 Águeda', '295831584'),
('1A', 200, 'Condominio Avestruz Selvagem 1-A, R. Principal 21, Jafafe', '253774987'),
('2A', 200, 'Condominio Avestruz Selvagem 2-A, R. Principal 21, Jafafe', '253774987'),
('3A', 200, 'Condominio Avestruz Selvagem 3-A, R. Principal 21, Jafafe', '253774987'),
('1B', 200, 'Condominio Avestruz Selvagem 1-B, R. Principal 21, Jafafe', '253774987'),
('2B', 205, 'Condominio Avestruz Selvagem 2-B, R. Principal 21, Jafafe', '253774987'),
('3B', 205, 'Condominio Avestruz Selvagem 3-B, R. Principal 21, Jafafe', '253774987'),
('1C', 200, 'Condominio Avestruz Selvagem 1-C, R. Principal 21, Jafafe', '253774987'),
('2C', 205, 'Condominio Avestruz Selvagem 2-C, R. Principal 21, Jafafe', '253774987'),
('3C', 205, 'Condominio Avestruz Selvagem 3-C, R. Principal 21, Jafafe', '253774987')

INSERT INTO gestaoCondominio.seguro 
VALUES
(01, 'seguro multirriscos', 1000, null, 'Seguros 100%', 'Coletivo', '279352856', null),
(02, 'seguro multirriscos', 1200, null, 'Seguros 100%', 'Coletivo', '279352856', null),
(03, 'seguro multirriscos', 1100, null, 'Seguros 100%', 'Coletivo', '295831584', null),
(04, 'seguro contra-incendio', 1000, null,  'Seguros 100%', 'Coletivo', '279352856', null),
(05, 'seguro contra-incendio', 1200, null, 'Seguros 100%', 'Coletivo', '279352856', null),
(06, 'seguro contra-incendio', 1100, null, 'Seguros 100%', 'Coletivo', '295831584', null),
(07, 'seguro contra acidentes pessoais', 2000, 1300, 'Seguros Ok', 'Singualar',  '279352856', '1A')

INSERT INTO gestaoCondominio.servico 
VALUES
(0001, 'Limpeza', 55.40, 4, null, '279352856'),
(0002, 'Limpeza', 50.20, 3, null, '258341908'),
(0003, 'Limpeza', 60.40, 5, null, '295831584'),
(0004, 'Segurança', 237.20, 24, null, '279352856'),
(0005, 'Segurança', 237.20, 24, null, '295831584'),
(0006, 'Elevador', 40.50, 24, null, '258341908'),
(0007, 'Elevador', 40.50, 24, null, '279352856'),
(0008, 'Elevador', 40.20, 24, null, '295831584')

INSERT INTO gestaoCondominio.zona 
VALUES
(0001, 'Elevador'),
(0002, 'Garagem'),
(0003, 'Campo de Volei'),
(0004, 'Lojas'),
(0005, 'Churrasqueira')

INSERT INTO gestaoCondominio.proprietario
VALUES
(1,  '295831584', '1A', '20191008', NULL),
(2,'253774987', '1C',  '20100228', '20160607'),
(1, '253774987','1C',  '20160608', NULL),
(5,'295831584', '1B',  '20180909', NULL),
(6,'295831584', '1C',  '20170707', NULL),
(7, '295831584','2A',  '20121122', '20140224'),
(2, '295831584','2A',  '20140225', NULL),
(8, '295831584','2B',  '20180910', NULL),
(9, '295831584','4A',  '20160101', NULL),
(2, '295831584','3A',  '20210101', NULL),
(3,  '295831584','3B', '20001109', NULL),
(1,  '295831584','4B', '20210202', NULL),
(12, '253774987','1A',  '20120131', NULL),
(10, '253774987','1B',  '20180914', NULL),
(12, '253774987','2A' , '20120131', NULL),
(11, '253774987','2B',  '20140320', NULL),
(13, '253774987','2C',  '20101011', NULL),
(13, '253774987','3A',  '20150505', NULL),
(10, '253774987','3B',  '20170714', NULL),
(11, '253774987','3C',  '20140408', NULL)

INSERT INTO gestaoCondominio.condomino
VALUES
(1, '295831584','1A',  '20191008', NULL),
(2, '253774987','1C',  '20100228', '20160607'),
(4, '295831584','1A',  '20200612', NULL),
(5,'295831584', '1B',  '20180909', NULL),
(7, '295831584','2A',  '20121122', '20140224'),
(2, '295831584','2A',  '20140225', NULL),
(8, '295831584','2B',  '20180910', NULL),
(9, '295831584','4A',  '20160101', NULL),
(2, '295831584','3A',  '20210101', NULL),
(3,  '295831584','3B', '20001109', NULL),
(1,  '295831584','4B', '20210202', NULL)

INSERT INTO gestaoCondominio.temAssociada 
VALUES 
(0001, '295831584', '1A'),
(0001, '295831584', '2A'),
(0001, '295831584', '3A'),
(0001, '295831584', '4A'),
(0001, '295831584', '1B'),
(0001, '295831584', '2B'),
(0001, '295831584', '3B'),
(0001, '295831584', '4B'),
(0002, '295831584', '1A'),
(0002, '295831584', '2A'),
(0002, '295831584', '3A'),
(0002, '295831584', '4A'),
(0002, '295831584', '1B'),
(0002, '295831584', '2B'),
(0002, '295831584', '3B'),
(0002, '295831584', '4B'),
(0005, '295831584', '4B'),
(0005, '295831584', '4B'),
----------------------------
(0001, '253774987', '1A'),
(0001, '253774987', '1B'),
(0001, '253774987', '1C'),
(0001, '253774987', '2A'),
(0001, '253774987', '2B'),
(0001, '253774987', '2C'),
(0001, '253774987', '3A'),
(0001, '253774987', '3B'),
(0001, '253774987', '3C'),
(0002, '253774987', '1A'),
(0002, '253774987', '1B'),
(0002, '253774987', '1C'),
(0002, '253774987', '2A'),
(0002, '253774987', '2B'),
(0002, '253774987', '2C'),
(0002, '253774987', '3A'),
(0002, '253774987', '3B'),
(0002, '253774987', '3C'),
-- ----------------------
(0001, '258341908', '1A'),
(0001, '258341908', '1B'),
(0001, '258341908', '2A'),
(0001, '258341908', '1B'),
(0001, '258341908', '3A'),
(0001, '258341908', '3B'),
(0002, '258341908', '1A'),
(0002, '258341908', '1B'),
(0002, '258341908', '2A'),
(0002, '258341908', '1B'),
(0002, '258341908', '3A'),
(0002, '258341908', '3B'),
(0003, '258341908', '1A'),
(0003, '258341908', '1B'),
(0003, '258341908', '2A'),
(0003, '258341908', '1B'),
(0003, '258341908', '3A'),
(0003, '258341908', '3B'),
-----------------------------
(0004, '279352856', '0C'),
(0004, '279352856', '0B'),
(0004, '279352856', '0A'),
(0001, '279352856', '1A'),
(0001, '279352856', '1B'),
(0001, '279352856', '1C'),
(0001, '279352856', '2A'),
(0001, '279352856', '2B'),
(0001, '279352856', '2C'),
(0001, '279352856', '3A'),
(0001, '279352856', '3B'),
(0001, '279352856', '3C'),
(0001, '279352856', '4A'),
(0001, '279352856', '4B'),
(0002, '279352856', '1A'),
(0002, '279352856', '1B'),
(0002, '279352856', '1C'),
(0002, '279352856', '2A'),
(0002, '279352856', '2B'),
(0002, '279352856', '2C'),
(0002, '279352856', '3A'),
(0002, '279352856', '3B'),
(0002, '279352856', '3C'),
(0002, '279352856', '4A'),
(0002, '279352856', '4B'),
(0005, '279352856', '1A'),
(0005, '279352856', '1B'),
(0005, '279352856', '1C'),
(0005, '279352856', '2A'),
(0005, '279352856', '2B'),
(0005, '279352856', '2C'),
(0005, '279352856', '3A'),
(0005, '279352856', '3B'),
(0005, '279352856', '3C'),
(0005, '279352856', '4A'),
(0005, '279352856', '4B')
-- ----------------------

INSERT INTO gestaoCondominio.proprietario
VALUES
(3,  '258341908', '1A', '20191008', NULL),
(13,  '258341908', '1B', '20200220', NULL),
(8,  '258341908', '2A', '20120821', NULL),
(8,  '258341908', '2B', '20120821', NULL),
(11,  '258341908', '3A', '20140915', '20170409'),
(2,  '258341908', '3A', '20170410', NULL),
(2,  '258341908', '3B', '20181009', NULL)

INSERT INTO gestaoCondominio.proprietario
VALUES
(13,  '279352856', '0A', '20191008', NULL),
(13,  '279352856', '0B', '20191008', NULL),
(13,  '279352856', '0C', '20191008', NULL),
(6,  '279352856', '1A', '20200127', NULL),
(7,  '279352856', '1B', '20170707', NULL),
(7,  '279352856', '1C', '20160606', NULL),
(9,  '279352856', '2A', '20190909', NULL),
(10,  '279352856', '2B', '20150505', NULL),
(6,  '279352856', '2C', '20160130', NULL),
(2,  '279352856', '3A', '20210330', NULL),
(3,  '279352856', '3B', '20161008', NULL),
(4,  '279352856', '3C', '20190810', NULL),
(13,  '279352856', '4A', '20191008', NULL),
(1,  '279352856', '4B', '20140404', NULL)

INSERT INTO gestaoCondominio.entidade
VALUES
(14, '875839359', 'lucaspereira@hotmail.com', 'Lucas Pereira', 'Rua São Bernado 28'),
(15, '868333450', 'johnsmith@gmail.pt', 'John Smith', 'Rua São Vincente 188'),
(16, '987321755', 'alicedasilva@hotmail.com', 'Alice Silva', 'Av Urubu 34'),
(17, '102938400', 'alexsaria@gmail.com', 'Alex Saria', 'Rua Liberdade 122'),
(18, '890123050', 'mramogus@sus.jp', 'Ian Sakamoto', 'Av Maria da Glória 12'),
(19, '192939405', 'loremipsum@generator.com', 'Laura Imps', 'Av São Alexandre 12'),
(20, '859030220', 'danielmonteiro@ua.pt', 'Daniel Monteiro', 'Av São Bernado 1024'),
(21, '467382930', 'carloscosta@ua.pt', 'Carlos Costa', 'Rua Santa Maria da Glória 27'),
(22, '098543200', 'jsp@ua.pt', 'Joaquim Pinto', 'Rua Santa Maria da Glória 28'),
(23, '555889300', 'carlosbastos@ua.pt', 'Carlos Bastos', 'Rua Santa Maria da Glória 127'),
(24, '696900850', 'verakharlanmova@ua.pt', 'Vera Kharlamova', 'Rua Principal do Centro 4'),
(25, '123220000', 'cruzcruz@ua.pt', 'Cruz Cruz', 'Rua Pereira Martins 99'),
(26, '855383111', 'alexandremartins@ua.pt', 'Alexandre Martins', 'Rua Santa Maria da Glória 57'),
(27, '198949918', 'iloveminecraft@gmail.com', 'Steven Alex', 'Rua da Terra 34'),
(28, '123948449', 'noobmaster69@sus.jp', 'Thor Martins', 'Rua da Terra 69')

INSERT INTO gestaoCondominio.condomino
VALUES
(14, '258341908','1A',  '20191011', NULL),
(15,  '258341908', '1B', '20200221', NULL),
(16,  '258341908', '2A', '20120925', NULL),
(17,  '258341908', '2B', '20120921', NULL),
(18,  '258341908', '3A', '20150915', NULL),
(19,  '258341908', '3B', '20181110', NULL)

INSERT INTO gestaoCondominio.pessoa
VALUES
('758393940', '53183940', 'M', '19880917',14),
('473819019', '98374000', 'M', '19670122',15),
('182379128', '54398478', 'F','19980509',16),
('958734958', '43090009', 'F', '19990909',17),
('591797909', '86889940', 'M', '19980808',18),
('378982788', '99993333', 'F', '19970707',19),
('490804238', '09483942', 'M', '19960606',20),
('893829138', '12313100', 'M', '19800101',21),
('831830183', '34534501', 'M', '19950505',22),
('234580810', '05498359', 'M', '19940404',23),
('598131235', '23239895', 'F', '19930303',24),
('631531211', '93842000', 'M', '19920202',25),
('123092302', '09809340', 'M', '19910101',26),
('098590488', '30456409', 'NB', '19890808',27),
('234924799', '23452278', 'M', '19901212',28)

INSERT INTO gestaoCondominio.entidade
VALUES
(29, '998604489', 'mariadasilva@hotmail.com', 'Maria Silva', 'Av da Paz 28'),
(30, '893458719', 'telmocunha@ua.pt', 'Telmo Cunha', 'Av da Paz 90'),
(31, '123794569', 'tos@ua.pt', 'Tomé Oliveira', 'Av Princial 668'),
(32, '123845200', 'mos@ua.pt', 'Miguel Oliveira', 'Av Princial 668'),
(33, '094860403', 'paularama@ua.pt', 'Paula Rama', 'Av Principal 666'),
(34, '857834753', 'kellyfernanda@ua.pt', 'Kelly Fernanda', 'Av Principal 665')

INSERT INTO gestaoCondominio.pessoa
VALUES
('023483450', '50968300', 'F', '19880808',29),
('234875298', '43234126', 'M', '19870707',30),
('131122211', '37683766', 'M', '19860606',31),
('000101123', '91891319', 'M', '19850505',32),
('297973911', '12351575', 'F', '19840404',33),
('123841898', '98794900', 'F', '19830303',34)


INSERT INTO gestaoCondominio.condomino
VALUES
(20,  '279352856', '0A', '20191108', NULL),
(21,  '279352856', '0B', '20200108', NULL),
(22,  '279352856', '0C', '20210202', NULL),
(23,  '279352856', '1A', '20200227', NULL),
(24,  '279352856', '1B', '20180707', NULL),
(25,  '279352856', '1C', '20170606', NULL),
(26,  '279352856', '2A', '20200909', NULL),
(27,  '279352856', '2B', '20160505', NULL),
(28,  '279352856', '2C', '20160430', NULL),
(29,  '279352856', '3A', '20210401', NULL),
(30,  '279352856', '3B', '20161108', NULL),
(31,  '279352856', '3C', '20191210', NULL),
(32,  '279352856', '3C', '20191110', NULL),
(33,  '279352856', '4A', '20191101', NULL),
(34,  '279352856', '4B', '20140422', NULL)

INSERT INTO gestaoCondominio.fornece
VALUES
(0008, 10, '20200101', null),
(0006, 10, '20200101', null),
(0007, 10, '20200101', null),
(0004, 11, '20200102', null),
(0005, 11, '20200102', null),
(0001, 12, '20200101', null),
(0002, 12, '20200102', null),
(0003, 12, '20200103', null)

----------------------------------------------------
-------------------- QUERIES -----------------------
----------------------------------------------------

--------------- 1. Queries Básicas -----------------
-- Descrição: Queries que são compostas literalmente
-- para obter todos os atributos de uma relação

SELECT * FROM gestaoCondominio.entidade; 

SELECT * FROM gestaoCondominio.condominio;

SELECT * FROM gestaoCondominio.fracao;

SELECT * FROM gestaoCondominio.seguro;

SELECT * FROM gestaoCondominio.proprietario;

SELECT * FROM gestaoCondominio.condomino;

SELECT * FROM gestaoCondominio.zona;

SELECT * FROM gestaoCondominio.temAssociada;

--------------- 2. Queries Gerais ------------------
-- Descrição: Queries simples feitas apenas com a 
-- comparação entre duas relações


-- Selecionar todas as entidades que são pessoas

SELECT identificador, nome, numContribuinte 
FROM gestaoCondominio.pessoa AS p, gestaoCondominio.entidade AS e
WHERE p.FK_Entidade = e.identificador;

-- Selecionar todas as entidades que são empresas

SELECT emp.identificador, nome, nipc 
FROM gestaoCondominio.empresa AS emp, gestaoCondominio.entidade AS e
WHERE emp.identificador = e.identificador;

-- Selecionar o condominio e suas frações

SELECT nome, estado, identificador
FROM gestaoCondominio.condominio AS c, gestaoCondominio.fracao AS f
WHERE c.numContribuinte = f.FK_Condominio

-- Selecionar todos os seguros de um condominio

SELECT c.nome AS nomeCondominio, saldo, numApolice, nomeCompanhia, capitalObrigatorio, capitalFacultativo
FROM gestaoCondominio.condominio AS c, gestaoCondominio.seguro AS s
WHERE c.numContribuinte = s.FK_Condominio


--------------- 3. Queries Medianas ------------------
-- Descrição: Queries que não são compostas
-- apenas de um where em um único select.
-- Já começam a aperecer agregações

---- Selecionar todas as entidades que são proprietárias e sua fração

SELECT c.nome, e.nome, f.identificador
FROM gestaoCondominio.entidade AS e JOIN
gestaoCondominio.proprietario AS p
ON p.FK_Entidade = e.identificador
JOIN gestaoCondominio.fracao AS f
ON f.identificador = p.FK_Fracao
AND f.FK_Condominio = p.FK_Condominio
JOIN gestaoCondominio.condominio AS c
ON c.numContribuinte = f.FK_Condominio;

---- Selecionar todas as pessoas que são proprietárias e sua fração

SELECT c.nome AS condominio, e.nome AS pessoa, pes.genero, f.identificador
FROM gestaoCondominio.condominio AS c 
JOIN gestaoCondominio.fracao AS f
ON f.FK_Condominio = c.numContribuinte
AND c.numContribuinte = 295831584
JOIN gestaoCondominio.proprietario AS p
ON p.FK_Fracao = f.identificador 
AND p.FK_Condominio = f.FK_Condominio
JOIN gestaoCondominio.entidade AS e
ON p.FK_Entidade = e.identificador
JOIN gestaoCondominio.pessoa AS pes
ON pes.identificador = e.identificador;

-- Selecionar todos os condominos do condominio 'Condomínio Porto Azul',
-- seus telefones e a fração em que eles moram

SELECT e.nome, e.telemovel, f.identificador
FROM gestaoCondominio.condominio AS c, gestaoCondominio.fracao AS f,
gestaoCondominio.entidade AS e, gestaoCondominio.condomino AS cnd
WHERE c.nome = 'Condomínio Porto Azul' AND c.numContribuinte = f.FK_Condominio 
AND f.FK_Condominio = cnd.FK_Condominio AND f.identificador = cnd.FK_Fracao
AND cnd.FK_Entidade = e.identificador;

-- Selecionar todas as entidades que são proprietárias
-- e o número de frações que são proprietárias

SELECT c.nome AS nomeCondominio, e.nome AS nomeEntidade, count(f.identificador) AS nFracoes
FROM gestaoCondominio.condominio AS c, gestaoCondominio.fracao AS f,
gestaoCondominio.entidade AS e, gestaoCondominio.proprietario AS p
WHERE c.numContribuinte = f.FK_Condominio 
AND f.FK_Condominio = p.FK_Condominio AND f.identificador = p.FK_Fracao
AND p.FK_Entidade = e.identificador
GROUP BY c.nome, e.nome;


------- Stored Pocedures -------
DROP PROCEDURE gestaoCondominio.ProprietariosFracao

CREATE PROCEDURE gestaoCondominio.ProprietariosFracao
@condominio char(9), @fracao varchar(2)
AS
-- Desc: Obter todas as ENTIDADES (e seu tipo) que são proprietárias
DECLARE @tablename TABLE (
	identificador int,
	telemovel char(9),
	email varchar(120),
	nome varchar(120),
	enderecoAtual varchar(200),
	tipo bit
)

DECLARE @tipo AS bit=0
INSERT INTO @tablename
	SELECT DISTINCT ent.*,@tipo AS tipo
	FROM gestaoCondominio.condominio AS con
	JOIN gestaoCondominio.fracao AS frac
	ON con.numContribuinte = frac.FK_Condominio
	AND (@fracao = '' OR frac.identificador = @fracao)
	AND con.numContribuinte = @condominio
	JOIN gestaoCondominio.proprietario AS prop
	ON prop.FK_Fracao = frac.identificador
	AND prop.FK_Condominio = frac.FK_Condominio
	JOIN gestaoCondominio.entidade AS ent
	ON ent.identificador = prop.FK_Entidade
	JOIN gestaoCondominio.empresa AS emp
	ON emp.identificador = ent.identificador;

SET @tipo = 1
INSERT INTO @tablename
	SELECT DISTINCT ent.*,@tipo AS tipo
	FROM gestaoCondominio.condominio AS con
	JOIN gestaoCondominio.fracao AS frac
	ON con.numContribuinte = frac.FK_Condominio
	AND (@fracao = '' OR frac.identificador = @fracao)
	AND con.numContribuinte = @condominio
	JOIN gestaoCondominio.proprietario AS prop
	ON prop.FK_Fracao = frac.identificador
	AND prop.FK_Condominio = frac.FK_Condominio
	JOIN gestaoCondominio.entidade AS ent
	ON ent.identificador = prop.FK_Entidade
	JOIN gestaoCondominio.pessoa AS pess
	ON pess.identificador = ent.identificador;
	
SELECT * FROM @tablename ORDER BY nome

EXEC gestaoCondominio.ProprietariosFracao '253774987', '1C'

CREATE PROCEDURE gestaoCondominio.CondominosFracao
@condominio char(9), @fracao varchar(2)
AS
-- Desc: Obter todas as ENTIDADES (e seu tipo) que são condominas
DECLARE @tablename TABLE (
	identificador int,
	telemovel char(9),
	email varchar(120),
	nome varchar(120),
	enderecoAtual varchar(200),
	tipo bit
)

DECLARE @tipo AS bit=0
INSERT INTO @tablename
	SELECT DISTINCT ent.*,@tipo AS tipo
	FROM gestaoCondominio.condominio AS con
	JOIN gestaoCondominio.fracao AS frac
	ON con.numContribuinte = frac.FK_Condominio
	AND (@fracao = '' OR frac.identificador = @fracao)
	AND con.numContribuinte = @condominio
	JOIN gestaoCondominio.condomino AS prop
	ON prop.FK_Fracao = frac.identificador
	AND prop.FK_Condominio = frac.FK_Condominio
	JOIN gestaoCondominio.entidade AS ent
	ON ent.identificador = prop.FK_Entidade
	JOIN gestaoCondominio.empresa AS emp
	ON emp.identificador = ent.identificador;

SET @tipo = 1
INSERT INTO @tablename
	SELECT DISTINCT ent.*,@tipo AS tipo
	FROM gestaoCondominio.condominio AS con
	JOIN gestaoCondominio.fracao AS frac
	ON con.numContribuinte = frac.FK_Condominio
	AND (@fracao = '' OR frac.identificador = @fracao)
	AND con.numContribuinte = @condominio
	JOIN gestaoCondominio.condomino AS prop
	ON prop.FK_Fracao = frac.identificador
	AND prop.FK_Condominio = frac.FK_Condominio
	JOIN gestaoCondominio.entidade AS ent
	ON ent.identificador = prop.FK_Entidade
	JOIN gestaoCondominio.pessoa AS pess
	ON pess.identificador = ent.identificador;
	
SELECT * FROM @tablename ORDER BY nome

EXEC gestaoCondominio.CondominosFracao '295831584', ''

DROP PROCEDURE gestaoCondominio.insertCondominio

CREATE PROCEDURE gestaoCondominio.insertCondominio
@numC CHAR(9), @numReg INT, @nome VARCHAR(100),
@inicio VARCHAR(80), @fim VArCHAR(80), @estado INT, @saldo MONEY,
@endereco VARCHAR(200)
AS
DECLARE @inicioD AS DATE = convert(datetime, @inicio, 103)
DECLARE @fimD AS DATE = convert(datetime, @fim, 103)
--IF @fim IS NOT NULL
	--SET @fimD = convert(datetime, @fim, 103)
DECLARE @estadoD AS BIT = cast(@estado AS BIT)

INSERT INTO gestaoCondominio.condominio VALUES
(@numC, @numReg, @nome, @inicioD, @fimD, @estadoD, @saldo, @endereco)

EXEC gestaoCondominio.insertCondominio '', '', '', '09/09/2019', '10/10/2020', 1, 215, 'n sei kk'

-----------------------------------------------------------

CREATE PROCEDURE gestaoCondominio.paga
@ano smallint, @entidade INT, @condominio CHAR(9), @fracao CHAR(2),
@valor MONEY, @tipo AS varchar(30)
AS
BEGIN TRANSACTION

DECLARE @valorMensalidade AS MONEY
DECLARE @numMensalidades AS TINYINT
DECLARE @newNumMens AS INT

SELECT @valorMensalidade = valor, @numMensalidades = numMensalidadesPagas FROM
gestaoCondominio.mensalidade
WHERE ano=@ano AND FK_Entidade = @entidade AND FK_Condominio = @condominio
AND FK_Fracao = @fracao

-- numMensaidades não pode passar de 12
SET @newNumMens = (@valor / @valorMensalidade)

if @numMensalidades + @newNumMens > 12
	BEGIN
			RAISERROR ('Esse ano não aceita mais tanto pagamento!' ,16,1)
			ROLLBACK TRAN
	END

-- Se o valor pago for igual a 0, ou diferente de um valor exato,
-- cancela a transação

ELSE IF @valor = 0 OR (@valor % @valorMensalidade != 0)
	BEGIN
		PRINT 'não deveria'
		RAISERROR ('Valor pago tem de ser compatível com o valor da mensalidade!' ,16,1)
		ROLLBACK TRAN
	END
ELSE
	BEGIN
		DECLARE @numRecibo AS INT
		SELECT @numRecibo = (count(*)+1) FROM gestaoCondominio.pagamento
		PRINT @numRecibo

		-- SAVE POINT antes de alterar qualquer tabela

		SAVE TRAN beforeChanges

		DECLARE @entidadeP AS char(5)
		DECLARE @referencia AS char(9)

		SELECT @entidadeP = dbo.randomBetween(10000, 99999)
		SELECT @referencia = dbo.randomBetween(100000000, 999999999)

		INSERT INTO gestaoCondominio.pagamento
		(numRecibo, valorPagamento, dataPagamento, tipoPagamento, entidade, referencia)
		VALUES
		(@numRecibo, @valor, GETDATE(), @tipo, @entidadeP, @referencia)

		UPDATE gestaoCondominio.mensalidade
		SET numMensalidadesPagas = @newNumMens + @numMensalidades
		WHERE ano=@ano AND FK_Entidade = @entidade AND FK_Condominio = @condominio
		AND FK_Fracao = @fracao

		INSERT INTO gestaoCondominio.associado
		VALUES
		(@condominio, @fracao, @ano, @numRecibo)

		-- Confirmar se as informações estão realmente salvas

		DECLARE @verifyNumMensalidades AS TINYINT
		DECLARE @verifyAssociado AS INT
		DECLARE @verifyPagamento AS INT

		SELECT @verifyPagamento = count(*) FROM
		gestaoCondominio.pagamento 
		WHERE numRecibo = @numRecibo

		IF @verifyPagamento != 1
			ROLLBACK TRAN beforeChanges 

		SELECT @verifyNumMensalidades = numMensalidadesPagas
		FROM gestaoCondominio.mensalidade
		WHERE ano=@ano AND FK_Entidade = @entidade AND FK_Condominio = @condominio
		AND FK_Fracao = @fracao

		IF @verifyNumMensalidades = @numMensalidades
			ROLLBACK TRAN beforeChanges

		SELECT @verifyAssociado = count(*)
		FROM gestaoCondominio.associado
		WHERE FK_Mensalidade=@ano AND FK_Condominio = @condominio
		AND FK_Fracao = @fracao AND FK_pagamento = @numRecibo

		IF @verifyAssociado != 1
			ROLLBACK TRAN beforeChanges

		-- Se chegou até aqui, foi tudo atualizado

		COMMIT

	END

DROP PROCEDURE gestaoCondominio.paga

EXEC gestaoCondominio.paga 2020, 13, '279352856', '0A', 32.75, 'Dinheiro' 

@ano smallint, @entidade INT, @condominio CHAR(9), @fracao CHAR(2),
@valor MONEY, @tipo AS varchar(30)

SELECT * FROM gestaoCondominio.pagamento
SELECT * FROM gestaoCondominio.mensalidade
SELECT * from gestaoCondominio.associado
---------------------- VIEWS -------------------

-- 1. View para a tabela RANDOM poder ser utilizada na UDF

CREATE VIEW gestaoCondominio.randomView
AS SELECT RAND() randomResult

SELECT randomResult FROM gestaoCondominio.randomView

----------------------- UDF --------------------

-- 1. Uma função que gera um número aleatório entre dois ints e
-- retorna o seu String. (Usada para gerar os números aleatórios da
-- entidade e referencia no pagamento)

CREATE FUNCTION dbo.randomBetween(@baixo INT, @cima INT)
RETURNS VARCHAR(9) AS
BEGIN
	DECLARE @random AS FLOAT
	DECLARE @returnInt AS INT
	DECLARE @return AS VARCHAR(9)

	SELECT @random = randomResult FROM gestaoCondominio.randomView

	SET @returnInt = ROUND(((@cima - @baixo -1) * @random + @baixo), 0)

	SET @return = CAST(@returnInt AS VARCHAR(9))
	RETURN @return
END

DECLARE @teste AS varchar(9)

SELECT @teste = dbo.randomBetween(100000000, 999999999)
--------------------- TRIGGERS -----------------

-- 1. Um condomino só pode entrar em um condominio ativo em um range. 
-- Também, esse condomino precisa entrar com uma data que
-- não seja após a data atual. Por último, a data de Fim tem de ser maior do que o inicio
DROP TRIGGER gestaoCondominio.validCondomino;
CREATE TRIGGER gestaoCondominio.validCondomino
ON gestaoCondominio.condomino
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @condominio AS char(9)
	DECLARE @inicio AS DATE
	DECLARE @fim AS DATE
	DECLARE @estado AS BIT
	DECLARE @atual AS DATE = GETDATE()
	DECLARE @condominioInicio AS DATE
	DECLARE @condominioFim AS DATE


	SELECT @condominio = FK_Condominio, @inicio = inicioExercicio,
	@fim = fimExercicio FROM inserted;

	SELECT @estado = estado, @condominioInicio = inicioExercicio,
	@condominioFim = fimExercicio
	FROM gestaoCondominio.condominio
	WHERE numContribuinte = @condominio

	--IF @estado = 0
	--	BEGIN
	--		RAISERROR ('Não pode inserir em um condomínio que não está mais ativo!', 16,1);
	--		ROLLBACK TRAN
	--	END

	--ELSE 
	IF DATEDIFF(day, @inicio, @fim) < 0
		BEGIN
			RAISERROR ('O fim não pode ser menor do que o início', 16, 1);
			ROLLBACK TRAN
		END

	ELSE IF DATEDIFF(day, @inicio, @atual) < 0 OR (@fim IS NOT NULL AND DATEDIFF(day, @fim, @atual) < 0)
		BEGIN
			RAISERROR ('Não pode inserir depois da data atual!', 16, 1);
			ROLLBACK TRAN
		END

	ELSE IF DATEDIFF(day, @condominioInicio, @inicio) < 0 OR (@fim IS NOT NULL AND DATEDIFF(day, @condominioFim, @fim) > 0)
	OR DATEDIFF(day, @condominioFim, @inicio) > 0
		BEGIN
			RAISERROR ('Não condiz com a data do condominio!', 16, 1);
			ROLLBACK TRAN
		END
END

-- 2. Um Condominio tem que possuir as datas 
-- menores que a data atual, e a data de fim < começo

DROP TRIGGER gestaoCondominio.validCondominio
CREATE TRIGGER gestaoCondominio.validCondominio
ON gestaoCondominio.condominio
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @FIM AS DATE
	DECLARE @INICIO AS DATE
	DECLARE @atual AS DATE = GETDATE()

	SELECT @FIM = fimExercicio, @INICIO = inicioExercicio FROM inserted;

	IF DATEDIFF(day, @INICIO, @FIM) < 0
		BEGIN
			RAISERROR ('O fim não pode ser menor do que o início', 16, 1);
			ROLLBACK TRAN
		END

	ELSE IF DATEDIFF(day, @INICIO, @atual) < 0 OR (@FIM IS NOT NULL AND DATEDIFF(day, @FIM, @atual) < 0)
		BEGIN
			RAISERROR ('Não pode inserir depois da data atual!', 16, 1);
			ROLLBACK TRAN
		END
END

-- 3. Para fornecer, basta verificar as datas

CREATE TRIGGER gestaoCondominio.validFornece
ON gestaoCondominio.fornece
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @atual AS DATE = GETDATE()
	DECLARE @inicio AS DATE
	DECLARE @fim AS DATE

	SELECT @fim = fimExercicio, @inicio = inicioExercicio FROM inserted;

	IF DATEDIFF(day, @inicio, @fim) < 0
		BEGIN
			RAISERROR ('O fim não pode ser menor do que o início', 16, 1);
			ROLLBACK TRAN
		END

	ELSE IF DATEDIFF(day, @inicio, @atual) < 0 OR (@fim IS NOT NULL AND DATEDIFF(day, @fim, @atual) < 0)
		BEGIN
			RAISERROR ('Não pode inserir depois da data atual!', 16, 1);
			ROLLBACK TRAN
		END
END

-- 4. Se a fração não possuir localização, ela possuirá a mesma do condomínio

CREATE TRIGGER gestaoCondominio.enderecoFracao
ON gestaoCondominio.fracao
AFTER INSERT, UPDATE
AS 
BEGIN
	DECLARE @endereco AS VARCHAR(200)
	DECLARE @condominio AS char(9)
	DECLARE @identificador AS char(2)

	SELECT @endereco = localizacao, @condominio = FK_Condominio, @identificador = identificador
	FROM inserted

	DECLARE @xmlteste XML = (SELECT identificador FROM inserted)
	PRINT CONVERT(NVArCHAR(MAX), @xmlteste)

	PRINT 'comeco'
	PRINT @endereco
	PRINT @identificador
	PRINT @condominio
	IF @endereco IS NULL OR @endereco = ''
		-- Se o endereço for vazio, então utilizamos o endereço do condominio
		BEGIN
			PRINT 'if'
			SELECT @endereco = endereço FROM
			gestaoCondominio.condominio AS 
			c WHERE c.numContribuinte = @condominio

			PRINT @endereco
			PRINT 'novo'
			PRINT @identificador
			PRINT @condominio
			UPDATE gestaoCondominio.fracao
			SET localizacao = @endereco
			WHERE @identificador = identificador 
			AND FK_Condominio = @condominio
		END
	PRINT 'fim'
END

DROP TRIGGER gestaoCondominio.enderecoFracao


--UPDATE gestaoCondominio.fracao
--SET localizacao = null, identificador = '0A', FK_Condominio = '279352856'
--WHERE localizacao = null AND identificador = '0A' AND FK_Condominio = '279352856'

--UPDATE gestaoCondominio.fracao
--SET localizacao = c.endereço
--FROM gestaoCondominio.condominio AS C
--JOIN gestaoCondominio.fracao AS f
--ON f.FK_Condominio = c.numContribuinte AND f.localizacao IS NULL

--INSERT INTO gestaoCondominio.fracao
--VALUES ('8A', 500, null, '279352856')

select * from gestaoCondominio.condominio;
select * from gestaoCondominio.fracao;
----- outros

drop table gestaoCondominio.fracao -- ja drop
drop table gestaoCondominio.seguro -- ja drop
drop table gestaoCondominio.zona -- já drop
drop table gestaoCondominio.temAssociada -- ja drop
drop table gestaoCondominio.proprietario -- ja drop
drop table gestaoCondominio.condomino  -- ja drop 
drop table gestaoCondominio.condominio -- já drop
drop table gestaoCondominio.entidade --já drop
drop table gestaoCondominio.empresa -- já drop
drop table gestaoCondominio.fornece --já drop
drop table gestaoCondominio.mensalidade --já drop
drop table gestaoCondominio.pagamento --já drop
drop table gestaoCondominio.servico --já drop
drop table gestaoCondominio.pessoa --já drop

declare @teste AS varchar(90) = 'ola';
SELECT c.*,@teste AS colunafoda from
gestaoCondominio.condominio AS c JOIN
gestaoCondominio.fracao AS f ON
f.FK_Condominio = c.NumContribuinte

DECLARE @condominio AS char(9) = '253774987'
DECLARE @fracao AS varchar(2) = ''
DECLARE @tipo AS bit=0
	SELECT DISTINCT ent.*,@tipo AS tipo
	FROM gestaoCondominio.condominio AS con
	JOIN gestaoCondominio.fracao AS frac
	ON con.numContribuinte = frac.FK_Condominio
	AND (@fracao = '' OR frac.identificador = @fracao)
	AND con.numContribuinte = @condominio
	JOIN gestaoCondominio.proprietario AS prop
	ON prop.FK_Fracao = frac.identificador
	AND prop.FK_Condominio = frac.FK_Condominio
	JOIN gestaoCondominio.entidade AS ent
	ON ent.identificador = prop.FK_Entidade
	JOIN gestaoCondominio.empresa AS emp
	ON emp.identificador = ent.identificador;

	SELECT * FROM gestaoCondominio.condominio

	SELECT * from gestaoCondominio.proprietario
	WHERE FK_Condominio = '253774987'

	SELECT * from gestaoCondominio.condomino
	WHERE FK_Condominio = '295831584'
	
--	gestaoCondominio.empresa AS emp
--	JOIN gestaoCondominio.entidade AS ent
--	ON ent.identificador = emp.identificador
--	JOIN gestaoCondominio.proprietario AS prop
--	ON emp.identificador = prop.FK_Entidade

--SET @tipo = 1
--INSERT INTO @tablename
--	SELECT DISTINCT ent.*,@tipo AS tipo
--	FROM gestaoCondominio.pessoa AS pess
--	JOIN gestaoCondominio.entidade AS ent
--	ON ent.identificador = pess.identificador
--	JOIN gestaoCondominio.proprietario AS prop
--	ON pess.identificador = prop.FK_Entidade

--CREATE PROCEDURE gestaoCondominio.ProprietariosFracao 
---- Obter todos os proprietarios de uma fração
--@condominio char(9),
--@fracao char(2),
--@filter varchar(50)
--AS
--DECLARE @proprietarioTable TABLE(
--	condominio	varchar(100),
--	pessoa		varchar(120),
--	genero		varchar(2),
--	identificador varchar(2)
--)

--INSERT INTO @proprietarioTable
--	SELECT c.nome AS condominio, e.nome AS pessoa, pes.genero, f.identificador
--	FROM gestaoCondominio.condominio AS c 
--	JOIN gestaoCondominio.fracao AS f
--	ON f.FK_Condominio = c.numContribuinte
--	AND c.numContribuinte = @condominio
--	JOIN gestaoCondominio.proprietario AS p
--	ON p.FK_Fracao = f.identificador 
--	AND p.FK_Condominio = f.FK_Condominio
--	JOIN gestaoCondominio.entidade AS e
--	ON p.FK_Entidade = e.identificador
--	JOIN gestaoCondominio.pessoa AS pes
--	ON pes.identificador = e.identificador

--IF @filter != '' AND @fracao != ''
--SELECT * FROM @proprietarioTable
--WHERE identificador = @fracao AND pessoa like '%' + @filter +'%'

--ELSE IF @filter != ''
--SELECT * FROM @proprietarioTable
--WHERE pessoa like '%' + @filter +'%'

--ELSE IF @fracao != ''
--SELECT * FROM @proprietarioTable
--WHERE identificador = @fracao

--ELSE
--SELECT * FROM @proprietarioTable;

--EXEC gestaoCondominio.ProprietariosFracao 295831584, '2A', 'Di'

--DROP PROCEDURE gestaoCondominio.ProprietariosFracao

SELECT * FROM gestaoCondominio.condominio;
SELECT * FROM gestaoCondominio.fracao AS F, gestaoCondominio.condominio AS c
where F.FK_Condominio = C.numContribuinte
SELECT * FROM gestaoCondominio.condomino
WHERE FK_Condominio = '253774987';

INSERT INTO gestaoCondominio.condomino
VALUES
(20,  '253774987', '2A', '20210108', null)

DELETE FROm gestaoCondominio.condomino
WHERE FK_Entidade = 20

DELETE FROm gestaoCondominio.condominio
WHERE numRegistro = 0

INSERT INTO gestaoCondominio.condominio (numContribuinte, numRegistro,nome, endereço, inicioExercicio, estado, saldo)
VALUES
('','','','',convert(datetime,'', 103),'','')


SELECT * FROM gestaoCondominio.mensalidade
SELECT * FROM gestaoCondominio.pagamento