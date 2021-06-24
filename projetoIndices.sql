----------------------- Índices --------------------

-- Escolhemos os índices principalmente onde é utilizado no campo de Search, assim como 
-- os que são mais utilizados nas queries

-- 1. Entidades são ordenadas pelo nome quando é feito GET na SP. Logo, precisamos
-- de um index que ajude na ordenação.

CREATE NONCLUSTERED INDEX entidadeNomeIdx ON gestaoCondominio.entidade(nome ASC)

-- 2. Seguros são ordenados pelo nome da companhia

CREATE NONCLUSTERED INDEX seguroNomeIdx ON gestaoCondominio.seguro(nomeCompanhia ASC)

-- 3. Serviços são ordenados por nome

CREATE NONCLUSTERED INDEX servicoNomeIdx ON gestaoCondominio.servico(designacao ASC)

-- 4. Nome do condominio

CREATE NONCLUSTERED INDEX condominioNomeIdx ON gestaoCondominio.condominio(nome ASC)