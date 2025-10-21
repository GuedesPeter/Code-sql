USE Biblioteca;

-- Limpar uma Tabela: TRUNCATE TABLE
/*
    Esse comando limpa uma tabela removendo todos os seus registros, porém
    sem excluir (apagar) a tabela

    Sintaxe:

        TRUNCATE TABLE tabela;

*/

-- Tabela para teste
CREATE TABLE TESTE(

    IdTeste SMALLINT PRIMARY KEY IDENTITY,
    ValorTeste SMALLINT NOT NULL
);

-- Rotina para inserir dados na tabela TESTE
DECLARE @Contador INT = 1

WHILE @Contador <=100
BEGIN 
    INSERT INTO TESTE(ValorTeste)
    VALUES (@Contador * 3)
    SET @Contador = @Contador + 1
END

SELECT * FROM TESTE;

-- LIMPAR A TABELA: TRUNCATE TABLE

TRUNCATE TABLE TESTE;

-- Verificar o valor atua de IDENTITY
SELECT IDENT_CURRENT('TESTE') AS IDENTITY_VALOR; 

-- Excluir a Tabela TESTE
DROP TABLE TESTE;