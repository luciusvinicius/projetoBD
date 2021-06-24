----------------------- �ndices --------------------

-- Escolhemos os �ndices principalmente onde � utilizado no campo de Search, assim como 
-- os que s�o mais utilizados nas queries

-- 1. Entidades s�o ordenadas pelo nome quando � feito GET na SP. Logo, precisamos
-- de um index que ajude na ordena��o.

CREATE NONCLUSTERED INDEX entidadeNomeIdx ON gestaoCondominio.entidade(nome ASC)

-- 2. Seguros s�o ordenados pelo nome da companhia

CREATE NONCLUSTERED INDEX seguroNomeIdx ON gestaoCondominio.seguro(nomeCompanhia ASC)

-- 3. Servi�os s�o ordenados por nome

CREATE NONCLUSTERED INDEX servicoNomeIdx ON gestaoCondominio.servico(designacao ASC)

-- 4. Nome do condominio

CREATE NONCLUSTERED INDEX condominioNomeIdx ON gestaoCondominio.condominio(nome ASC)