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