
create table gestaoCondominio.pagamento (
	numRecibo int not null primary key,
	valorPagamento money not null,
	entidade char(5),
	referencia char(9),
	dataPagamento date not null,
	tipoPagamento varchar(30) not null,
	descricao	varchar(120)
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
	identificador int references gestaoCondominio.entidade(identificador) not null,
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

create table gestaoCondominio.fracao(
	identificador char(2) not null,
	area int not null,
	localizacao varchar(200),
	FK_Condominio char(9) references gestaoCondominio.condominio(numContribuinte) not null,
	primary key (identificador, FK_Condominio)
)

create table gestaoCondominio.mensalidade(
  ano smallint not null,
  descricao varchar(120),
  valor money not null,
  numMensalidadesPagas tinyint not null,
  FK_Entidade int references gestaoCondominio.entidade(identificador) not null,
  FK_Condominio char(9) references gestaoCondominio.condominio(numContribuinte) not null,
  FK_Fracao char(2),
  foreign key (FK_Fracao, FK_Condominio) references gestaoCondominio.fracao(identificador, FK_Condominio),
  primary key (FK_Fracao, FK_Condominio, ano)
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
