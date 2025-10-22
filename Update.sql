USE Biblioteca;


-- Atualizar registros de uma tabela (Alterar valores de uma coluna)

/*
Sintaxe:

    UPDATE Tabela
    SET Coluna = Novo_valor
    WHERE Coluna = Filtro;

*/

-- Obs: UTILIZAR SEMPRE *BEGIN TRANSACTION E WHERE NESTES TIPOS DE OPERAÇÃO

--Ex.:

SELECT 
    IdLivro,
    NomeLivro,
    PrecoLivro,
    NumeroPaginas
FROM Livro;

UPDATE Livro
SET NomeLivro = '1984' -- '1985'
WHERE IdLivro = 118;

UPDATE Livro
SET PrecoLivro = 50 -- 74.99
WHERE IdLivro = 105;

UPDATE Livro
SET PrecoLivro = PrecoLivro * 1.1 -- Aumenta em 10% o valor do PrecoLivro
WHERE IdLivro = 105;

UPDATE Livro
SET PrecoLivro = PrecoLivro * 0.8 -- Reduz em 20% o valor do PrecoLivro
WHERE IdLivro = 105;

-- Alterando mais de uma coluna

UPDATE Livro
SET PrecoLivro = 60, NumeroPaginas = 320
WHERE IdLivro = 105;