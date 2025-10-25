USE Biblioteca;

/*
Combinar Consultas com o operador UNION

Sintaxe:

    SELECT Colunas FROM Tabela1
    UNION
    SELECT Colunas FROM Tabela2
    ...

O UNION junta o resultado do 1º SELECT com o 2º SELECT e retorna
em tela
*/

-- Ex.: Exibir em uma unica lista o nome dos Autores e nome das Editoras cadastradas

-- 1.

SELECT NomeAutor NOME, 'Autor' AS Tipo FROM Autor
UNION
SELECT NomeEditora NOME, 'Editora' AS Tipo FROM Editora;

-- 2.
SELECT 
    CONCAT(NomeAutor, ' ', SobrenomeAutor) AS Nome, 'Autor'
AS Tipo FROM Autor 
UNION
SELECT 
    NomeEditora AS Nome, 'Editora'
AS Tipo FROM Editora;

-- 3.
SELECT
    NomeLivro AS Nome, 'Livro' AS Tipo FROM Livro
UNION
SELECT 
    NomeAssunto AS Nome, 'Assunto' AS Tipo FROM Assunto;


-- 4. DataSet Geral - Inserindo as Uniões em uma tabela temporária
SELECT 
    CONCAT(NomeAutor, ' ', SobrenomeAutor) AS Nome, 
    'Autor' AS Tipo
INTO DataSet -- INSERT AQUI
FROM Autor

UNION

SELECT 
    NomeEditora AS Nome, 
    'Editora' AS Tipo
FROM Editora

UNION

SELECT  
    NomeLivro AS Nome, 
    'Livro' AS Tipo
FROM Livro

UNION

SELECT 
    NomeAssunto AS Nome, 
    'Assunto' AS Tipo
FROM Assunto;


SELECT * FROM DataSet
WHERE Tipo = 'Editora';

DROP TABLE DataSet; -- Apaga a tabela temporária DataSet