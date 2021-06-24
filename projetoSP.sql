
------- Stored Pocedures -------

------------------- GETTERS ---------------------------------

-- 1. Obter as frações de um condomínio
drop proc gestaoCondominio.getFracoes
CREATE PROC gestaoCondominio.getFracoes
@condominio char(9), @fracao varchar(2)
AS
BEGIN
	SELECT F.identificador as id,area,localizacao,E.nome as prop FROM
	gestaoCondominio.condominio AS C join
	gestaoCondominio.fracao AS F
	ON C.numContribuinte = F.FK_Condominio
	AND C.numContribuinte = @condominio
	AND (@fracao = '' OR F.identificador LIKE '%' + @fracao + '%' )
	join gestaoCondominio.proprietario AS P
	ON F.identificador = P.FK_Fracao
	join gestaoCondominio.entidade as E
	ON E.identificador = P.FK_Entidade
END

-- 2. Obter as frações de um condomínio
drop proc gestaoCondominio.getSeguros
create proc gestaoCondominio.getSeguros
@condominio char(9), @seguro varchar(2)
as
begin
	select s.* from gestaoCondominio.condominio as C
	join gestaoCondominio.seguro as S
	on C.numContribuinte = S.FK_Condominio
	AND C.numContribuinte = @condominio
	AND (@seguro = '' OR S.nomeCompanhanhia LIKE '%' + @seguro + '%')
end

exec gestaoCondominio.getSeguros '279352856', ''

-- 3. Obter os serviços de um condomínio
drop proc gestaoCondominio.getServicos
create proc gestaoCondominio.getServicos
@condominio char(9), @servico varchar(120)
as
begin
	select s.* from gestaoCondominio.condominio as C
	join gestaoCondominio.servico as S
	on C.numContribuinte = S.FK_Condominio
	AND C.numContribuinte = @condominio
	AND (@servico = '' OR S.designacao LIKE '%' + @servico + '%')
end

-- 4. Obter todos os proprietarios que são pessoas de um condomínio 

drop proc gestaoCondominio.ProprietariosPessoas
CREATE PROCEDURE gestaoCondominio.ProprietariosPessoas
@condominio char(9), @nome varchar(120)
AS
	SELECT ent.*,pess.*,prop.*
	FROM gestaoCondominio.condominio AS con
	JOIN gestaoCondominio.fracao AS frac
	ON con.numContribuinte = frac.FK_Condominio
	AND con.numContribuinte = @condominio
	JOIN gestaoCondominio.proprietario AS prop
	ON prop.FK_Fracao = frac.identificador
	AND prop.FK_Condominio = frac.FK_Condominio
	JOIN gestaoCondominio.entidade AS ent
	ON ent.identificador = prop.FK_Entidade
	AND (@nome = '' OR ent.nome LIKE '%' + @nome + '%')
	JOIN gestaoCondominio.pessoa AS pess
	ON pess.identificador = ent.identificador
	ORDER BY nome;

-- 5. Obter todos os proprietários que são empresas de um condomínio

drop proc gestaoCondominio.ProprietariosEmpresas
CREATE PROCEDURE gestaoCondominio.ProprietariosEmpresas
@condominio char(9), @nome varchar(120)
AS
	SELECT DISTINCT ent.*,emp.*,prop.*
	FROM gestaoCondominio.condominio AS con
	JOIN gestaoCondominio.fracao AS frac
	ON con.numContribuinte = frac.FK_Condominio
	AND con.numContribuinte = @condominio
	JOIN gestaoCondominio.proprietario AS prop
	ON prop.FK_Fracao = frac.identificador
	AND prop.FK_Condominio = frac.FK_Condominio
	JOIN gestaoCondominio.entidade AS ent
	ON ent.identificador = prop.FK_Entidade
	AND (@nome = '' OR ent.nome LIKE '%' + @nome + '%')
	JOIN gestaoCondominio.empresa AS emp
	ON emp.identificador = ent.identificador
	ORDER BY nome;


-- 6. Obter todos os condominos que são pessoas de um condomínio

drop proc gestaoCondominio.CondominosPessoas
CREATE PROCEDURE gestaoCondominio.CondominosPessoas
@condominio char(9), @nome varchar(120)
AS
	SELECT ent.*,pess.*,cond.*
	FROM gestaoCondominio.condominio AS con
	JOIN gestaoCondominio.fracao AS frac
	ON con.numContribuinte = frac.FK_Condominio
	AND con.numContribuinte = @condominio
	JOIN gestaoCondominio.condomino AS cond
	ON cond.FK_Fracao = frac.identificador
	AND cond.FK_Condominio = frac.FK_Condominio
	JOIN gestaoCondominio.entidade AS ent
	ON ent.identificador = cond.FK_Entidade
	AND (@nome = '' OR ent.nome LIKE '%' + @nome + '%')
	JOIN gestaoCondominio.pessoa AS pess
	ON pess.identificador = ent.identificador
	ORDER BY nome;

-- 7. Obter todos os condominos que são empresas de um condomínio
drop proc gestaoCondominio.CondominosEmpresas
CREATE PROCEDURE gestaoCondominio.CondominosEmpresas
@condominio char(9), @nome varchar(120)
AS
	SELECT DISTINCT ent.*,emp.*,cond.*
	FROM gestaoCondominio.condominio AS con
	JOIN gestaoCondominio.fracao AS frac
	ON con.numContribuinte = frac.FK_Condominio
	AND con.numContribuinte = @condominio
	JOIN gestaoCondominio.condomino AS cond
	ON cond.FK_Fracao = frac.identificador
	AND cond.FK_Condominio = frac.FK_Condominio
	JOIN gestaoCondominio.entidade AS ent
	ON ent.identificador = cond.FK_Entidade
	AND (@nome = '' OR ent.nome LIKE '%' + @nome + '%')
	JOIN gestaoCondominio.empresa AS emp
	ON emp.identificador = ent.identificador
	ORDER BY nome;


---------------------- INSERÇÕES -------------------------------

-- Lembrando que as inserções não estão necessariamente responsabilizadas
-- pelas condições, uma vez que os triggers já fazem isso.

-- 1. Inserir em um condomínio

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

-- 2. Inserir uma Fração

drop proc gestaoCondominio.insertFracao
CREATE PROCEDURE gestaoCondominio.insertFracao
@entidade AS int, @identificador AS char(2), @condominio AS char(9),
@area as int, @localizacao as varchar(200), @zona as int, @mensalidade as money
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION 
		SAVE TRAN comeco

		DECLARE @atual AS DATE = GETDATE()
		DECLARE @ano AS int = YEAR(GETDATE())
		-- Se não puder inserir na relação propietario (ou seja, entidade não existe)
		-- ocorrerá rollback

		INSERT INTO gestaoCondominio.fracao 
		values(@identificador,@area,@localizacao,@condominio);

		INSERT INTO gestaoCondominio.proprietario
		values(@entidade, @condominio, @identificador, @atual, NULL)

		INSERT INTO gestaoCondominio.temAssociada
		values(@zona,@condominio,@identificador)

		INSERT INTO gestaoCondominio.mensalidade
		values(@ano, null, @mensalidade, 0, @entidade, @condominio, @identificador)

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		--IF @@TRANCOUNT > 0	-- se tiver ocorrido alguma transaction
		ROLLBACK TRAN comeco

		DECLARE @qntd AS int

		SELECT @qntd = count(*) FROM gestaoCondominio.condominio WHERE numContribuinte = @condominio

		IF @qntd = 0
			RAISERROR ('Condomínio não existe!',16,1)

		SELECT @qntd = count(*) FROM gestaoCondominio.entidade WHERE identificador = @entidade

		IF @qntd = 0
			RAISERROR ('Entidade não existe!',16,1)

		SELECT @qntd = count(*) FROM gestaoCondominio.zona WHERE codigo = @zona

		IF @qntd = 0
			RAISERROR ('Zona não existe!',16,1)

	END CATCH
END

-- 3. Inserir uma Empresa

CREATE PROC gestaoCondominio.insertEmpresa
@identificador AS int, @nome AS varchar(120), @telemovel AS char(9),
@nipc AS char(9), @email AS varchar(120), @endereco AS varchar(200)
AS
BEGIN
	SET XACT_ABORT ON
	BEGIN TRAN
	INSERT INTO gestaoCondominio.entidade
	VALUES (@identificador, @telemovel, @email, @nome, @endereco)

	INSERT INTO gestaoCondominio.empresa
	VALUES (@nipc, @identificador)
	COMMIT TRAN
END

-- 4. Inserir um Serviço

CREATE PROC gestaoCondominio.insertServico
@codigo AS int, @designacao as varchar(120), @custo as money, 
@horas as int, @condominio as char(9), @tipo as varchar(30)
AS
BEGIN
		INSERT INTO gestaoCondominio.servico
		VALUES(@codigo,@designacao, @custo, @horas, @numRecibo, @condominio)
END

-- 5. Inserir um Seguro

CREATE PROC gestaoCondominio.insertSeguro
@condominio AS char(9), @fracao As char(2), @designacao as varchar(200),
@capitalO as money, @capitalF as varchar(10), @nome as varchar(120), @tipo as varchar(20),
@numApolice as int
AS
BEGIN
	IF @fracao = ''
		SET @fracao = NULL

	IF @capitalF = ''
		SET @capitalF = NULL
	ELSE -- converter capitalF para money
		select @capitalF = convert(varchar(50), convert(money, @capitalF))

	INSERT INTO gestaoCondominio.seguro
	values(@numApolice,@designacao,@capitalO,@capitalF,@nome,@tipo,@condominio,@fracao)
END

-- 6. Inserir uma pessoa

CREATE PROC gestaoCondominio.insertPessoa
@identificador as int, @telemovel as char(9), @email as varchar(120),
@nome as varchar(120), @endereco as varchar(200), @numContribuinte as char(9),
@numCC as char(8), @genero as varchar(2), @dataNascimento as varchar(120)
AS
BEGIN
	DECLARE @data AS DATE = convert(datetime, @dataNascimento, 103)
	SET XACT_ABORT ON
	BEGIN TRAN

	INSERT INTO gestaoCondominio.entidade 
		VALUES(@identificador, @telemovel, @email, @nome, @endereco)

	INSERT INTO gestaoCondominio.pessoa
		VALUES(@numContribuinte, @numCC, @genero, @dataNascimento, @identificador)

	COMMIT TRAN
END

-- 7. Inserir uma Zona

CREATE PROC gestaoCondominio.insertZona
@codigo as int, @designacao as varchar(120)
AS
BEGIN
	INSERT INTO gestaoCondominio.zona
		VALUES(@codigo, @designacao)
END

CREATE PROC gestaoCondominio.insertFornecedor
@identificadorEntidade as int, @identificadorServico as int
AS
BEGIN
	INSERT INTO gestaoCondominio.fornece
		VALUES(@identificadorEntidade, @identificadorServico, GETDATE(), null)
END

----------------------- UPDATE ---------------------------------

-- 1. Fazer um update para o condominio

CREATE PROC gestaoCondominio.updateCondominio
@numContribuinte AS char(9), @numRegistro AS int, @nome AS varchar(100),
@inicioExercicio AS varchar(30), @fimExercicio AS varchar(30),
@estado AS bit, @saldo AS money, @endereco AS varchar(200)
AS
BEGIN
	
	DECLARE @inicioD AS DATE = convert(datetime, @inicioExercicio, 103)
	IF @fimExercicio != ''
		BEGIN
			DECLARE @fimD AS DATE = convert(datetime, @fimExercicio, 103)
			UPDATE gestaoCondominio.condominio
			SET numRegistro = @numRegistro, nome = @nome, inicioExercicio = @inicioExercicio,
			fimExercicio = @fimExercicio, estado = @estado, saldo = @saldo, endereço = @endereco
			WHERE numContribuinte = @numContribuinte
		END
	ELSE
		BEGIN
			UPDATE gestaoCondominio.condominio
			SET numRegistro = @numRegistro, nome = @nome, inicioExercicio = @inicioExercicio,
			estado = @estado, saldo = @saldo, endereço = @endereco
			WHERE numContribuinte = @numContribuinte
		END
END
select * from gestaoCondominio.condominio

-- 2. Fração

CREATE PROC gestaoCondominio.updateFracao
@identificador as char(2), @area as int, @localizacao as varchar(200)
as
begin
	update gestaoCondominio.fracao
	set identificador = @identificador, area = @area, localizacao = @localizacao
	where identificador = @identificador
end

CREATE PROC gestaoCondominio.updateSeguro
@numApolice as int, @fracao as char(2), @capitalF as float, @capitalO as float
as
begin
	update gestaoCondominio.seguro
	set FK_Fracao = @fracao, capitalFacultativo = @capitalF, capitalObrigatorio= @capitalO
	where numApolice = @numApolice
end

CREATE PROC gestaoCondominio.updateServico
@codigo as int, @designacao as varchar(120), @horas as int, @custo as money
as
begin
	update gestaoCondominio.servico
	set designacao = @designacao, horas = @horas, custo = @custo
	where codigo = @codigo
end



--------------------- UTILIDADES -------------------------------

-- 1. Fazer uma entidade pagar uma mensalidade.

CREATE PROCEDURE gestaoCondominio.pagaMensalidade
@ano smallint, @entidade INT, @condominio CHAR(9), @fracao CHAR(2),
@valor MONEY, @tipo AS varchar(30)
AS
BEGIN TRANSACTION
SAVE TRAN comeco
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
			ROLLBACK TRAN comeco
	END

-- Se o valor pago for igual a 0, ou diferente de um valor exato,
-- cancela a transação
ELSE IF @valor < 0
	BEGIN
		RAISERROR ('Valor não pode ser negativo!' ,16,1)
		ROLLBACK TRAN comeco
	END

ELSE IF @valor = 0 OR (@valor % @valorMensalidade != 0)
	BEGIN
		RAISERROR ('Valor pago tem de ser compatível com o valor da mensalidade!' ,16,1)
		ROLLBACK TRAN comeco
	END
ELSE
	BEGIN
		DECLARE @numRecibo AS INT
		SELECT @numRecibo = (count(*)+1) FROM gestaoCondominio.pagamento
		PRINT @numRecibo

		-- SAVE POINT antes de alterar qualquer tabela
		SET XACT_ABORT ON
		-- SAVE TRAN beforeChanges

		DECLARE @entidadeP AS char(5)
		DECLARE @referencia AS char(9)

		SELECT @entidadeP = dbo.randomBetween(10000, 99999)
		SELECT @referencia = dbo.randomBetween(100000000, 999999999)

		INSERT INTO gestaoCondominio.pagamento
		(numRecibo, valorPagamento, dataPagamento, tipoPagamento, entidade, referencia, 'Mensalidade')
		VALUES
		(@numRecibo, @valor, GETDATE(), @tipo, @entidadeP, @referencia)

		UPDATE gestaoCondominio.mensalidade
		SET numMensalidadesPagas = @newNumMens + @numMensalidades
		WHERE ano=@ano AND FK_Entidade = @entidade AND FK_Condominio = @condominio
		AND FK_Fracao = @fracao

		INSERT INTO gestaoCondominio.associado
		VALUES
		(@condominio, @fracao, @ano, @numRecibo)

		-- Se chegou até aqui, foi tudo atualizado

		COMMIT

	END

-- 2. Pagar um serviço

CREATE PROC gestaoCondominio.pagaServico
@codigo as int, @tipo as varchar(30)
AS
BEGIN
	DECLARE @fk_p AS int
	DECLARE @custo AS money
	DECLARE @horas as int

	SELECT @fk_p = FK_Pagamento, @custo = custo, @horas = horas
	FROM gestaoCondominio.servico WHERE codigo = @codigo;

	IF (@fk_p IS NOT NULL)
		RAISERROR ('Serviço já pago!',16,1);
	ELSE
		BEGIN
			DECLARE @entidadeP AS char(5)
			DECLARE @referencia AS char(9)
			DECLARE @numRecibo AS INT
			SELECT @numRecibo = (count(*)+1) FROM gestaoCondominio.pagamento

			SELECT @entidadeP = dbo.randomBetween(10000, 99999)
			SELECT @referencia = dbo.randomBetween(100000000, 999999999)

			SET XACT_ABORT ON
			BEGIN TRAN

			INSERT INTO gestaoCondominio.pagamento
			(numRecibo, valorPagamento, dataPagamento, tipoPagamento, entidade, referencia, 'Serviço')
			VALUES
			(@numRecibo, @custo * @horas, GETDATE(), @tipo, @entidadeP, @referencia)

			UPDATE gestaoCondominio.servico
			set FK_Pagamento = @numRecibo
			where codigo = @codigo

			COMMIT TRAN
		END
END

--------------------- NÂO UTILIZADO -----------------------------

--CREATE PROCEDURE gestaoCondominio.CondominosFracao
--@condominio char(9), @fracao varchar(2)
--AS
---- Desc: Obter todas as ENTIDADES (e seu tipo) que são condominas
--DECLARE @tablename TABLE (
--	identificador int,
--	telemovel char(9),
--	email varchar(120),
--	nome varchar(120),
--	enderecoAtual varchar(200),
--	tipo bit
--)

--DECLARE @tipo AS bit=0
--INSERT INTO @tablename
--	SELECT DISTINCT ent.*,@tipo AS tipo
--	FROM gestaoCondominio.condominio AS con
--	JOIN gestaoCondominio.fracao AS frac
--	ON con.numContribuinte = frac.FK_Condominio
--	AND (@fracao = '' OR frac.identificador = @fracao)
--	AND con.numContribuinte = @condominio
--	JOIN gestaoCondominio.condomino AS prop
--	ON prop.FK_Fracao = frac.identificador
--	AND prop.FK_Condominio = frac.FK_Condominio
--	JOIN gestaoCondominio.entidade AS ent
--	ON ent.identificador = prop.FK_Entidade
--	JOIN gestaoCondominio.empresa AS emp
--	ON emp.identificador = ent.identificador;

--SET @tipo = 1
--INSERT INTO @tablename
--	SELECT DISTINCT ent.*,@tipo AS tipo
--	FROM gestaoCondominio.condominio AS con
--	JOIN gestaoCondominio.fracao AS frac
--	ON con.numContribuinte = frac.FK_Condominio
--	AND (@fracao = '' OR frac.identificador = @fracao)
--	AND con.numContribuinte = @condominio
--	JOIN gestaoCondominio.condomino AS prop
--	ON prop.FK_Fracao = frac.identificador
--	AND prop.FK_Condominio = frac.FK_Condominio
--	JOIN gestaoCondominio.entidade AS ent
--	ON ent.identificador = prop.FK_Entidade
--	JOIN gestaoCondominio.pessoa AS pess
--	ON pess.identificador = ent.identificador;
	