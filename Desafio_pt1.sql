USE Biblioteca;


-- ============================================================
-- 🧩 DESAFIO 1 JOINs — INNER JOIN
-- Base: Tabelas Livros, Autores, Editoras, Assuntos e LivroAutores
-- ============================================================



-- 1. Liste o nome do autor, o total de livros que ele escreveu e o nome das editoras onde publicou,
--    exibindo apenas autores que publicaram em mais de uma editora (use INNER JOIN entre todas as tabelas necessárias).

SELECT
    A.NomeAutor,
    COUNT(DISTINCT L.IdLivro) AS QTDE_LIVROS,
    E.NomeEditora
FROM Autor A
INNER JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
INNER JOIN Livro L ON L.IdLivro = LA.IdLivro
INNER JOIN Editora E ON E.IdEditora = L.IdEditora
GROUP BY LA.IdAutor,A.NomeAutor, E.NomeEditora
HAVING COUNT(DISTINCT E.IdEditora) >= 1
ORDER BY A.NomeAutor, E.NomeEditora;


-- 2. Mostre o nome do livro, a editora, o assunto e todos os autores relacionados,
--    agrupando por livro e concatenando os nomes dos autores em uma única linha.

-- STRING_AGG(CONCAT(A.NomeAutor, ' ', A.SobrenomeAutor), ', ') → junta os nomes dos autores em uma única string separada por vírgulas.

SELECT
    L.NomeLivro AS LIVRO,
    E.NomeEditora AS EDITORA,
    AA.NomeAssunto AS ASSUNTO,
    STRING_AGG(CONCAT(A.NomeAutor, ' ', A.SobrenomeAutor), ', ') AS AUTORES
FROM Livro L
JOIN LivroAutor LA ON LA.IdLivro = L.IdLivro
JOIN Autor A ON A.IdAutor = LA.IdAutor
JOIN Assunto AA ON AA.IdAssunto = L.IdAssunto
JOIN Editora E ON E.IdEditora = L.IdEditora
GROUP BY L.NomeLivro, E.NomeEditora, AA.NomeAssunto
ORDER BY L.NomeLivro;




-- 3. Exiba o nome do autor, o número total de páginas somadas de todos os seus livros e o nome do assunto mais recorrente,
--    utilizando INNER JOIN entre as tabelas e funções de agregação.

SELECT 
    CONCAT(A.NomeAutor, ' ', A.SobrenomeAutor) AS AUTOR,
    SUM(L.NumeroPaginas) AS TOTAL_PAGINAS,
    TOPASS.NomeAssunto AS ASSUNTO_MAIS_RECORRENTE
FROM Autor A
INNER JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
INNER JOIN Livro L ON L.IdLivro = LA.IdLivro
CROSS APPLY (
    SELECT TOP 1 AA2.NomeAssunto
    FROM LivroAutor LA2
    INNER JOIN Livro L2 ON L2.IdLivro = LA2.IdLivro
    INNER JOIN Assunto AA2 ON AA2.IdAssunto = L2.IdAssunto
    WHERE LA2.IdAutor = A.IdAutor
    GROUP BY AA2.NomeAssunto
    ORDER BY COUNT(*) DESC
) AS TOPASS
GROUP BY A.IdAutor, A.NomeAutor, A.SobrenomeAutor, TOPASS.NomeAssunto
ORDER BY A.NomeAutor;



-- 4. Liste os livros que possuem mais de um autor, mostrando o nome do livro, a editora e a quantidade de autores associados.

SELECT
    L.NomeLivro AS LIVRO,
    E.NomeEditora AS EDITORA,
    COUNT(A.IdAutor) AS QTD_AUTORES
FROM Livro L 
JOIN LivroAutor LA ON LA.IdLivro = L.IdLivro
JOIN Autor A ON A.IdAutor = LA.IdAutor
JOIN Editora E ON E.IdEditora = L.IdEditora
GROUP BY L.NomeLivro, E.NomeEditora
HAVING COUNT(A.IdAutor) > 1;

-- 5. Mostre o nome da editora, o total de livros publicados por assunto e o preço médio desses livros,
--    usando INNER JOIN entre Livros, Editoras e Assuntos e aplicando GROUP BY com múltiplos campos.

SELECT
    E.NomeEditora AS EDITORA,
    COUNT(L.IdLivro) AS TOTAL_LIVROS,
    A.NomeAssunto AS ASSUNTO,
    FORMAT(AVG(L.PrecoLivro),'N2','PT-BR') AS PRECO_MEDIO
FROM Editora E 
JOIN Livro L ON L.IdEditora = E.IdEditora
JOIN Assunto A ON A.IdAssunto = L.IdAssunto
GROUP BY E.NomeEditora, A.NomeAssunto;


-- 6. Exiba o nome do autor e o livro mais caro que ele escreveu, incluindo o nome da editora e o assunto do livro.
--    (Use INNER JOIN e uma subconsulta ou CTE para identificar o livro mais caro de cada autor.)

-- STRING_AGG(CONCAT(A.NomeAutor, ' ', A.SobrenomeAutor), ', ') → junta os nomes dos autores em uma única string separada por vírgulas.

SELECT
    STRING_AGG(CONCAT(A.NomeAutor,' ',A.SobrenomeAutor), ',') AS AUTOR,
    CONCAT('R$ ',MAX(L.PrecoLivro)) AS Livro_Mais_Caro,
    E.NomeEditora AS EDITORA,
    AA.NomeAssunto AS ASSUNTO
FROM Autor A 
JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
JOIN Livro L ON L.IdLivro = LA.IdLivro
JOIN Editora E ON E.IdEditora = L.IdEditora
JOIN Assunto AA ON AA.IdAssunto = L.IdAssunto
GROUP BY A.NomeAutor,E.NomeEditora, AA.NomeAssunto;


-- 7. Liste os assuntos e as editoras que publicaram livros nesses assuntos,
--    mas somente para assuntos em que o preço médio dos livros seja superior a 200.

SELECT
    A.NomeAssunto AS ASSUNTO,
    E.NomeEditora AS EDITORA,
    L.NomeLivro AS LIVRO,
    CONCAT('R$ ',AVG(L.PrecoLivro)) AS Vlr_MEDIO
FROM Assunto A
JOIN Livro L ON L.IdAssunto = A.IdAssunto
JOIN Editora E ON E.IdEditora = L.IdEditora
GROUP BY A.NomeAssunto,E.NomeEditora,L.NomeLivro
HAVING AVG(L.PrecoLivro) > 200.00;



-- 8. Mostre os 5 autores com maior número de páginas publicadas (soma das páginas de todos os livros),
--    junto com o nome da editora e do assunto do livro mais extenso que publicaram.

WITH AutorPaginas AS (
    SELECT
        A.IdAutor,
        CONCAT(A.NomeAutor, ' ', A.SobrenomeAutor) AS AUTOR,
        SUM(L.NumeroPaginas) AS TOTAL_PAGINAS
    FROM Autor A
    INNER JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
    INNER JOIN Livro L ON L.IdLivro = LA.IdLivro
    GROUP BY A.IdAutor, A.NomeAutor, A.SobrenomeAutor
)
SELECT TOP 5
    AP.AUTOR,
    AP.TOTAL_PAGINAS,
    L.NomeLivro AS LIVRO_MAIS_EXTENSO,
    E.NomeEditora AS EDITORA,
    AA.NomeAssunto AS ASSUNTO
FROM AutorPaginas AP
INNER JOIN LivroAutor LA ON LA.IdAutor = AP.IdAutor
INNER JOIN Livro L ON L.IdLivro = LA.IdLivro
INNER JOIN Editora E ON E.IdEditora = L.IdEditora
INNER JOIN Assunto AA ON AA.IdAssunto = L.IdAssunto
WHERE L.NumeroPaginas = (
    SELECT MAX(L2.NumeroPaginas)
    FROM LivroAutor LA2
    INNER JOIN Livro L2 ON L2.IdLivro = LA2.IdLivro
    WHERE LA2.IdAutor = AP.IdAutor
)
ORDER BY AP.TOTAL_PAGINAS DESC;



