USE Biblioteca;


-- Filtros Combinados: Operadores Lógicos [AND - OR - NOT - BETWEEN]


/*
AND -  Mostra os resultados se todas as condições forem verdadeiras
OR - Mostra os resultados se uma das condições forem verdadeiras
NOT - Utilizado para Negar uma condição
BETWEEN - Seleção de intervalos [Entre Um e Outro]
Funciona junto com a clausula AND
*/

-- Ex.:

SELECT *
FROM Livro
WHERE IdLivro > 102 AND IdEditora < 4; --  Mostra os resultados se todas as condições forem verdadeiras


SELECT *
FROM Livro
WHERE IdLivro > 110 OR IdEditora < 4; -- Mostra os resultados se uma das condições forem verdadeiras


SELECT *
FROM Livro
WHERE IdLivro > 110 OR NOT IdEditora < 4; -- Utilizado para Negar uma condição

-- BETWEEN Sintaxe:

/*
    SELECT Colunas
    FROM Tabela
    WHERE Coluna BETWEEN Valor1 AND Valor2;
*/


SELECT
    NomeLivro,
    DataPub
FROM LIVRO
WHERE DataPub BETWEEN '2004-05-07' AND '2014-05-07';


SELECT
    NomeLivro AS LIVRO,
    CONCAT('R$ ',PrecoLivro) AS VALOR_R$
FROM Livro
WHERE PrecoLivro BETWEEN 50.00 AND 100.00;

-- Combinados
SELECT
    NomeLivro AS Livro,
    DataPub AS Data,
    CONCAT('R$ ',PrecoLivro) AS VALOR_R$
FROM Livro
WHERE PrecoLivro >= 20.00
AND DataPub BETWEEN '20060520' AND '20100620'
OR DataPub BETWEEN '20160620' AND '20200620'
ORDER BY DataPub DESC;