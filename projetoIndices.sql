----------------------- Índices --------------------

-- 1. Entidades são ordenadas pelo nome quando é feito GET na SP. Logo, precisamos
-- de um index que ajude na ordenação.

CREATE NONCLUSTERED INDEX entidadeNomeIdx ON gestaoCondominio.entidade(nome ASC)

-- 2. Seguros são ordenados pelo nome da companhia

CREATE NONCLUSTERED INDEX seguroNomeIdx ON gestaoCondominio.seguro(nomeCompanhanhia ASC)

