USE Biblioteca;

-- Filtrar resultados de uma consulta com WHERE

/*

SELECT coluna(s)
FROM Tabela
WHERE coluna [operador] valor;
[ORDER BY coluna]
*/


-- Ex.:

SELECT
    NomeLivro,
    DataPub
FROM Livro
WHERE IdEditora = 3;
-- ORDER BY

SELECT
    IdAutor,
    NomeAutor
FROM Autor
WHERE SobrenomeAutor = 'Verne';

SELECT
    NomeLivro,
    PrecoLivro
FROM Livro
WHERE PrecoLivro > 100.00
ORDER BY PrecoLivro DESC;

-- Cláusula WHERE: Subconsultas [Subquerys]

SELECT
    NomeLivro,
    DataPub
FROM Livro
WHERE IdEditora = (

    SELECT IdEditora
    FROM Editora
    WHERE NomeEditora = 'Aleph'

)
ORDER BY NomeLivro; -- Opcional

