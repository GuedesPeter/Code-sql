USE Biblioteca;

-- Consulta Simples -> SELECT

-- Sintaxe:
-- SELECT coluna(s) FROM Tabela;

SELECT NomeLivro FROM Livro;

SELECT SobrenomeAutor FROM Autor;

SELECT * FROM Autor; -- * Retorna todas as colunas das tabelas

-- Colunas especificadas

SELECT NomeLivro, PrecoLivro, ISBN13
FROM Livro;

SELECT DISTINCT IdEditora -- Seleciona sem repetições [DISTINCT]
FROM Livro;

-- Montar uma Tabela a partir de dados filtrados
-- SELECT INTO [Cria uma tabela com dados de outra]
--Sintaxe:
/*
    SELECT colna(s)
    INTO nova_Tabela
    FROM tabela_Atual;
*/

SELECT NomeLivro, ISBN13
INTO LivroISBN -- Tabela Criada
FROM Livro;
-- Verificação
SELECT * FROM LivroISBN;
-- Apagar a Tabela
DROP TABLE LivroISBN;