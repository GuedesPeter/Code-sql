-- SUBQUERYS - SUBCONSULTAS SQL

-- Subquery (subconsulta) é uma consulta dentro de outra consulta SQL
-- Usada para retornar valores que auxiliam a consulta principal
-- Pode aparecer em SELECT, FROM, WHERE ou HAVING
-- Pode retornar um valor, uma coluna ou uma tabela
-- Pode ser correlacionada (depende da consulta externa) ou não
-- Em alguns casos, JOIN pode ter melhor desempenho

-- SINTAXE:

/*
SELECT Coluna(s)
FROM Tabela(s)
WHERE Coluna Operador (
    SELECT Coluna(s)
    FROM Tabela(s)
    WHERE Filtro
)
[ORDER BY Coluna]
*/

-- Ex.:

-- Obtendo o nome dos Livros cuja a Editora seja "Aleph"

SELECT 
    NomeLivro, IdEditora
FROM Livro L
WHERE IdEditora = (
    SELECT IdEditora
    FROM Editora E
    WHERE E.NomeEditora = 'Aleph'
)
ORDER BY L.NomeLivro;


-- Operadores
-- Nomes das Editoras que publicam Livros de Assuntos específicos (1,3 e 7)

SELECT 
    NomeEditora
FROM Editora
WHERE IdEditora IN (
    SELECT IdEditora
    FROM Livro
    WHERE IdAssunto IN (1,3,7)
)
ORDER BY NomeEditora;


-- Subquery na cláusula FROM

-- Calcula Livros que estão acima da média dos Preços

SELECT DISTINCT
    L.NomeLivro,
    L.PrecoLivro
FROM Livro L,
    (SELECT AVG(PrecoLivro) AS MediaPreco
    FROM Livro) AS Subquery
WHERE L.PrecoLivro > Subquery.MediaPreco;

-- Aninhamento de Subquerys (Recomendado utilizar Inner Joins)

SELECT
    NomeEditora
FROM Editora
WHERE IdEditora IN (
    SELECT 
        IdEditora
    FROM Livro
    WHERE IdAssunto = (
        SELECT 
            IdAssunto
        FROM Assunto
        WHERE NomeAssunto = 'Ficção Científica'
    )
)
ORDER BY NomeEditora;




