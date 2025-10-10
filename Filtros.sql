
-- Ordenação de resultados em consultas SQL
/*
Sintaxe:

    SELECT coluna(s) FROM Tabela
    ORDER BY nomeColuna(s) [ ASC | DESC ];

*/

--Ex.:

SELECT *
FROM Livro
ORDER BY NomeLivro; -- ASC

SELECT *
FROM Livro
ORDER BY NomeLivro DESC; -- Descendente

SELECT NomeLivro, IdEditora
FROM Livro
ORDER BY IdEditora; -- ASC

SELECT NomeLivro, IdEditora
FROM Livro
ORDER BY IdEditora DESC; -- Descendente

SELECT NomeLivro, PrecoLivro ,IdEditora
FROM Livro
ORDER BY IdEditora, PrecoLivro ASC; -- Ordenação por mais de uma coluna

SELECT NomeLivro, PrecoLivro ,IdEditora
FROM Livro
ORDER BY IdEditora ASC, PrecoLivro DESC; -- Ordenação por mais de uma coluna em ordem invertida

-- Exercícios:

-- 1. Selecione o nome do livro e o preço, ordenando pelo preço em ordem crescente.
SELECT 
    NomeLivro,
    PrecoLivro
FROM Livro
ORDER BY DataPub;

-- 2. Selecione nome do livro, data de publicação, ordenando pela data de publicação decrescente (mais recente primeiro).
SELECT 
    NomeLivro,
    DataPub
FROM Livro
ORDER BY DataPub DESC;

-- 3. Selecione nome do livro, número de páginas, ordenando pelo número de páginas em ordem decrescente.
SELECT 
    NomeLivro,
    NumeroPaginas
FROM Livro
ORDER BY NumeroPaginas DESC;

-- 4. Selecione nome do autor e sobrenome, ordenando pelo sobrenome em ordem alfabética.
SELECT 
    NomeAutor,
    SobrenomeAutor
FROM Autor
ORDER BY SobrenomeAutor;

-- 5. Selecione o nome da editora, ordenando alfabeticamente pelo nome da editora.
SELECT 
    NomeEditora
FROM Editora
ORDER BY NomeEditora;

-- 6. Selecione assunto (nome do assunto), ordenando em ordem decrescente pelo nome do assunto.
SELECT 
    NomeAssunto
FROM Assunto
ORDER BY NomeAssunto DESC;

-- 7. Selecione nome do livro, preço, ordenando primeiro pelo preço ascendente e depois pelo nome do livro ascendente.
SELECT 
    NomeLivro,
    PrecoLivro
FROM Livro
ORDER BY PrecoLivro ASC, NomeLivro DESC;

-- 8. Selecione nome do livro e número de páginas, ordenando pelo número de páginas ascendente, 
-- mas colocando livros com páginas iguais em ordem decrescente de preço.

SELECT 
    NomeLivro,
    NumeroPaginas,
    PrecoLivro
FROM Livro
ORDER BY NumeroPaginas ASC, PrecoLivro DESC;

--------------------------------------------------

-- Restrição de Resultados [ SELECT TOP ]

/*
Sintaxe:

SELECT TOP (Número | Percentual) colunas
FROM tabela
[WHERE ...]
[ORDER BY ...];

*/

-- Ex.:

SELECT TOP 10 -- (10) número escalar|qtde.
    NomeLivro
FROM Livro
ORDER BY NomeLivro; 


SELECT TOP 10 PERCENT -- (PERCENT) Determina o percentual %
    NomeLivro
FROM Livro
ORDER BY NomeLivro DESC; -- Ou ASC

SELECT TOP 4 -- (4) número escalar|qtde.
    NomeLivro,
    PrecoLivro
FROM Livro
ORDER BY PrecoLivro DESC; 

SELECT TOP 4 PERCENT -- (PERCENT) Determina o percentual %
    NomeLivro,
    PrecoLivro
FROM Livro
ORDER BY NomeLivro DESC; -- Ou ASC

-- WITH TIES - Permite incluir linhas extras se elas “empatam” com o valor de ordenação da última linha retornada.

SELECT TOP 3 WITH TIES -- Mostre os "empatados"
    NomeLivro,
    IdAssunto
FROM Livro
ORDER BY IdAssunto DESC; 



