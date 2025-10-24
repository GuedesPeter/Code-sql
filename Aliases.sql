USE Biblioteca;


-- Nomes Alternativos: AS [Alias - Nome Temporário]


/*
Sinatxe:

    SELECT Coluna [AS] nome_alternativo
    FROM Tabela [AS] nome_alternativo_tabela
    WHERE ...
*/

-- Alias de Colunas

SELECT
    NomeLivro AS LIVROS
FROM Livro;


SELECT
    CONCAT(NomeAutor,' ', SobrenomeAutor) AS AUTOR
FROM Autor;

-- Alias de Tabelas

SELECT
    L.NomeLivro AS LIVRO,
    CONCAT('Editora -  ',E.NomeEditora) AS Lista_Editoras
FROM Livro L
INNER JOIN Editora E ON E.IdEditora = L.IdEditora;


-- Alias Alternativo: SQL reconhece sem o [AS]

SELECT
    NomeLivro  LIVROS
FROM Livro;