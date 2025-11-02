USE Biblioteca;


-- Joins: INNER JOIN


/*
Sintaxe:

    SELECT 
        Colunas,
        ...
    FROM Tabela1 T1
    INNER JOIN Tabela2 T2
        ON T1.Coluna = T2.Coluna
    ...
*/

-- Ex.:

SELECT
    L.NomeLivro,
    A.NomeAssunto
FROM Livro L
INNER JOIN Assunto A
    ON L.IdAssunto = A.IdAssunto;



SELECT
    L.NomeLivro AS LIVRO,
    E.NomeEditora AS EDITORA
FROM Livro L
INNER JOIN Editora E
    ON L.IdEditora = E.IdEditora
WHERE E.NomeEditora LIKE '[MH]%'
ORDER BY L.NomeLivro;


SELECT
    L.NomeLivro AS LIVRO,
    CONCAT(A.NomeAutor,' ',A.SobrenomeAutor) AS AUTOR
FROM Livro L
INNER JOIN LivroAutor LA
    ON LA.IdLivro = L.IdLivro
INNER JOIN Autor A
    ON A.IdAutor = LA.IdAutor
ORDER BY L.NomeLivro DESC;

