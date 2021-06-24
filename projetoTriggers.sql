--------------------- TRIGGERS -----------------

-- 1. Um condomino só pode entrar em um condominio ativo em um range. 
-- Também, esse condomino precisa entrar com uma data que
-- não seja após a data atual. Por último, a data de Fim tem de ser maior do que o inicio

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

	IF @endereco IS NULL OR @endereco = ''
		-- Se o endereço for vazio, então utilizamos o endereço do condominio
		BEGIN
			SELECT @endereco = endereço FROM
			gestaoCondominio.condominio AS 
			c WHERE c.numContribuinte = @condominio

			UPDATE gestaoCondominio.fracao
			SET localizacao = @endereco
			WHERE @identificador = identificador 
			AND FK_Condominio = @condominio
		END
END

-- 5. Uma data de nascimento da pessoa tem de ser <= data atual

CREATE TRIGGER gestaoCondominio.validPessoa ON gestaoCondominio.pessoa
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @atual AS DATE = GETDATE()
	DECLARE @data AS DATE

	SELECT @data = dataNascimento FROM inserted;

	IF DATEDIFF(day,@data,@atual) < 0
	BEGIN
		RAISERROR ('Data de nascimento não pode passar o dia atual!', 16, 1);
		ROLLBACK TRAN
	END
END


-- 6. A data de um proprietario não pode ultrapassar a data atual e 
-- a data de fim não pode ser antes da data inicial

CREATE TRIGGER gestaoCondominio.validProprietario
ON gestaoCondominio.proprietario
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @atual AS DATE = GETDATE()
	DECLARE @inicio AS DATE
	DECLARE @fim AS DATE

	SELECT @inicio = inicioExercicio, @fim = fimExercicio FROM inserted;

	IF DATEDIFF(day,@inicio,@atual) < 0 OR (@fim IS NOT NULL AND DATEDIFF(day,@fim,@atual) < 0)
	BEGIN
		RAISERROR ('Data não pode passar o dia atual!', 16, 1);
		ROLLBACK TRAN
	END

	IF @fim IS NOT NULL AND DATEDIFF(day,@inicio,@fim) < 0
	BEGIN
		RAISERROR ('Data final não pode passar a data inicial!', 16, 1);
		ROLLBACK TRAN
	END
END

-- 7. Ver se um seguro é válido

CREATE TRIGGER gestaoCondominio.validSeguro
ON gestaoCondominio.seguro
AFTER INSERT,UPDATE
AS
BEGIN
	DECLARE @capO AS MONEY
	DECLARE @capF AS MONEY

	SELECT @capO = capitalObrigatoio, @capF = capitalFacultativo FROM inserted;

	IF @capF < 0 OR (@capO IS NOT NULL AND @capO < 0)
		BEGIN
			RAISERROR ('O capital não pode ser negativo!', 16, 1);
			ROLLBACK TRAN
		END
END