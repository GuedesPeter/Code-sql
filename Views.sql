USE Biblioteca;

-- VIEWS (Exibiões)

/*
Uma VIEW no SQL é uma tabela virtual criada a partir de uma consulta (SELECT).
Ela não armazena dados fisicamente — apenas guarda a lógica da consulta. Quando você consulta a view, o banco executa o SELECT definido nela.

- Simplificam consultas complexas
- Implementa segurança e abstração de dados
- Agregação e Sumarização de Dados

*/


-- Sintaxe:
/*

CREATE [OR ALTER] VIEW NomeView AS
SELECT Colunas 
FROM Tabelas 
WHERE Condições

*/

-- Ex1.:

CREATE OR ALTER VIEW vwLivroPreco AS
    SELECT TOP 5 
    NomeLivro, PrecoLivro
    FROM Livro
    ORDER BY PrecoLivro;


SELECT * FROM vwLivroPreco;

-- Visualizar a Definição de View (Como ela foi criada / gerada)

EXEC sp_helptext vwLivroPreco;


-- Ex2.: (Verificação Prévia)

IF OBJECT_ID('vwLivroAssunto', 'view') IS NOT NULL
    DROP VIEW vwLivroAssunto;
GO
CREATE VIEW vwLivroAssunto AS
    SELECT 
    L.NomeLivro AS Livro,
    A.NomeAssunto AS Assunto
    FROM Livro L
    INNER JOIN Assunto A 
    ON A.IdAssunto = L.IdAssunto;
GO


SELECT Livro, Assunto 
FROM vwLivroAssunto;