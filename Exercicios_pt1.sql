USE Biblioteca;


-- 1. Retornar o nome dos Livros, Preços e Datas de Publicação
-- 2. Mostrar apenas os sobrenomes dos Autores
-- 3. Retornar a lista de Assuntos
-- 4. Mostrar a lista de Editoras com os IDs de cada uma, com a coluna de nomes de editoras à esquerda da coluna de IDs
-- 5. Mostrar os IDs de assuntos dos quais existem livros cadastrados na tabela de livros sem repetição
-- 6. Criar o nova tabela chamada "LivrosFicção" que contenha todos os dados dos livros relacionados ao assunto de ID 1

-- Respostas:
-- 1.

SELECT 
    NomeLivro,
    PrecoLivro,
    DataPub
FROM Livro;

-- 2.

SELECT
    SobrenomeAutor
FROM Autor;

-- 3.

SELECT 
    NomeAssunto
FROM Assunto;

-- 4.

SELECT  
    NomeEditora,
    IdEditora
FROM Editora;

-- 5.

SELECT DISTINCT
    IdAssunto
FROM Livro;

-- 6.

SELECT *
INTO LivroFiccao
FROM Livro
WHERE IdAssunto = 1;

SELECT * FROM LivroFiccao;
-- DROP TABLE LivroFiccao;