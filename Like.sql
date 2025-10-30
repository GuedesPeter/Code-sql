USE Biblioteca;

-- Cláusula LIKE e NOT LIKE

/*

Sintaxe:

    SELECT Colunas
    FROM Tabelas
    WHERE Coluna LIKE 'Padrão';

*/

/*

Metacaracteres

% - Qualquer caracter de 0 ou mais caracteres 

_ - Qualquer caracter único

[] - Caracteres únicos no intervalo ou conjunto especificado

[ˆ] - Caracteres únicos que NÃO  estão no intervalo ou conjunto especificado

*/

-- Ex.:

SELECT 
*
FROM Livro
WHERE NomeLivro LIKE 'F%'; -- Filtra os Livros cuja o nome tenha a primeira letra como F


SELECT
    NomeAutor
FROM Autor
WHERE NomeAutor NOT LIKE 'S%'; -- Autores que não iniciam com S

SELECT 
    NomeLivro
FROM Livro
WHERE NomeLivro LIKE '[FD]%'; -- Iniciam com a letra F ou D


SELECT 
    NomeLivro
FROM Livro
WHERE NomeLivro LIKE '[ˆFˆD]%'; --NÃO começam com F e nem D

SELECT 
    NomeLivro
FROM Livro
WHERE NomeLivro LIKE '[aeiou]%'; -- Livros que iniciem com vogais

SELECT 
    NomeLivro
FROM Livro
WHERE NomeLivro LIKE '%[aeiou]'; -- Livros que terminam com uma vogal


SELECT 
    NomeLivro
FROM Livro
WHERE NomeLivro LIKE '[0-9]%'; -- Livros que iniciam com um número


SELECT 
    NomeLivro
FROM Livro
WHERE NomeLivro LIKE 'A%o'; -- Iniciam com A e terminam com 'O'


SELECT
    NomeAutor,
    SobrenomeAutor
FROM Autor
WHERE NomeAutor LIKE 'R%' AND SobrenomeAutor LIKE 'B%'; -- Nome iniciado com R e Sobrenome com B


SELECT 
    NomeLivro
FROM Livro
WHERE NomeLivro LIKE '%[aeiou]_'; -- Penultimo caracter é uma Vogal ('_' Substitui um caracter único)


SELECT
    NomeEditora
FROM Editora
WHERE NomeEditora LIKE '[O-T]%'; -- Editoras iniciando em Ó até T



SELECT
    NomeAutor
FROM Autor
WHERE NomeAutor LIKE 'J___'; -- Nome inicia em J e tenha 4 letras exatamente


SELECT 
    NomeLivro
FROM Livro
WHERE NomeLivro NOT LIKE '[aeiou0-9]%'; -- Livros que não iniciam com Vogais e nem com números (Iniciam somente com Consoantes)

