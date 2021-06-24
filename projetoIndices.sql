----------------------- �ndices --------------------

-- 1. Entidades s�o ordenadas pelo nome quando � feito GET na SP. Logo, precisamos
-- de um index que ajude na ordena��o.

CREATE NONCLUSTERED INDEX entidadeNomeIdx ON gestaoCondominio.entidade(nome ASC)

-- 2. Seguros s�o ordenados pelo nome da companhia

CREATE NONCLUSTERED INDEX seguroNomeIdx ON gestaoCondominio.seguro(nomeCompanhanhia ASC)

