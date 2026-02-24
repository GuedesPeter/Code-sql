USE Biblioteca;

-- EXERCÍCIOS SUBQUERYS

-- 1. Liste o nome dos livros cujo preço seja maior que o preço médio de todos os livros.

SELECT DISTINCT
    L.NomeLivro,
    CONCAT('R$ ',L.PrecoLivro) AS Preco
FROM Livro L, (
    SELECT AVG(PrecoLivro) AS MediaPreco 
    FROM Livro) AS Subquery
WHERE L.PrecoLivro > Subquery.MediaPreco
ORDER BY L.NomeLivro;


-- 2. Liste o nome dos livros com número de páginas maior que a média de páginas dos livros.

SELECT DISTINCT
    L.NomeLivro,
    L.NumeroPaginas
FROM Livro L,(
    SELECT AVG(NumeroPaginas) AS MediaPags 
    FROM Livro
) AS Subquery
WHERE L.NumeroPaginas > Subquery.MediaPags
ORDER BY L.NomeLivro;

-- 3. Liste os livros publicados após a data média de publicação dos livros.

SELECT DISTINCT
    L.NomeLivro,
    L.DataPub
FROM Livro L
WHERE L.DataPub > (
    -- Subquery que calcula a data média de publicação
    SELECT 
        DATEADD(
            DAY, 
            -- Calcula a média dos dias entre uma data base e a data de publicação
            AVG(DATEDIFF(DAY, '19000101', DataPub)),
            -- Soma a média de dias à data base para obter a data média
            '19000101'
        )
    FROM Livro
)
ORDER BY L.NomeLivro;

-- 4. Liste os nomes das editoras que possuem livros cadastrados.

SELECT DISTINCT
    NomeEditora
FROM Editora
WHERE IdEditora IN (
    SELECT IdEditora
    FROM Livro
)
ORDER BY NomeEditora;


-- 5. Liste os nomes das editoras que não possuem nenhum livro cadastrado.

SELECT DISTINCT
    NomeEditora
FROM Editora
WHERE IdEditora NOT IN (
    SELECT IdEditora
    FROM Livro
)
ORDER BY NomeEditora;

-- 6. Liste os livros que pertencem a um determinado assunto (ex: 'Tecnologia') usando subquery.

SELECT
    NomeLivro
FROM Livro
WHERE IdAssunto IN (
    SELECT IdAssunto
    FROM Assunto
    WHERE NomeAssunto = 'Tecnologia'
)
ORDER BY NomeLivro;

-- 7. Liste os nomes dos livros que possuem preço maior que o livro mais barato.

SELECT 
    L.NomeLivro,
    CONCAT('R$ ',L.PrecoLivro) AS Preco
FROM Livro L,(
    SELECT MIN(PrecoLivro) AS MinLivro FROM Livro
) AS Subquery
WHERE L.PrecoLivro > Subquery.MinLivro
ORDER BY L.NomeLivro;

-- 8. Liste os livros que possuem o maior número de páginas.

SELECT DISTINCT
    L.NomeLivro,
    L.NumeroPaginas
FROM Livro L,(
    SELECT AVG(NumeroPaginas) AS MediaPags FROM Livro
) AS Subquery
WHERE l.NumeroPaginas > Subquery.MediaPags
ORDER BY L.NumeroPaginas DESC;

-- 9. Liste os nomes dos autores que participaram de algum livro.

SELECT
    CONCAT(NomeAutor, ' ', SobrenomeAutor) AS Autor
FROM Autor 
WHERE IdAutor IN (
    SELECT IdAutor
    FROM LivroAutor
    WHERE IdLivro IN (
        SELECT IdLivro
        FROM Livro
    )
)
ORDER BY NomeAutor;


-- 10. Liste os nomes dos autores que não participaram de nenhum livro.

SELECT
    CONCAT(NomeAutor, ' ', SobrenomeAutor) AS Autor
FROM Autor 
WHERE IdAutor NOT IN (
    SELECT IdAutor
    FROM LivroAutor
)
ORDER BY NomeAutor;

-- 11. Liste os livros que possuem mais de um autor.

SELECT 
    NomeLivro
FROM Livro
WHERE IdLivro IN (
    SELECT IdLivro
    FROM LivroAutor
    GROUP BY IdLivro
    HAVING COUNT(IdAutor) > 1
)
ORDER BY NomeLivro;


-- 12. Liste os livros cujo preço seja maior que a média de preço dos livros da mesma editora.

SELECT 
    L.NomeLivro,
    CONCAT('R$ ', L.PrecoLivro) AS Valor
FROM Livro L
WHERE L.PrecoLivro > (
    SELECT AVG(PrecoLivro)
    FROM Livro
    WHERE IdEditora = L.IdEditora
)
ORDER BY L.NomeLivro;



-- 13. Liste as editoras cujo livro mais caro seja maior que a média de preço geral dos livros.

SELECT E.NomeEditora
FROM Editora E
WHERE E.IdEditora IN (
    SELECT L.IdEditora
    FROM Livro L
    GROUP BY L.IdEditora
    HAVING MAX(L.PrecoLivro) > (
        SELECT AVG(PrecoLivro) FROM Livro -- Obtém a Média Total dos Livros
    )
)
ORDER BY E.NomeEditora;


-- 14. Liste os assuntos que possuem ao menos um livro cadastrado.

SELECT
    NomeAssunto
FROM Assunto
WHERE IdAssunto IN (
    SELECT 
    IdAssunto
    FROM Livro
)
ORDER BY NomeAssunto;

-- 15. Liste os assuntos que não possuem livros cadastrados.

SELECT
    NomeAssunto
FROM Assunto
WHERE IdAssunto NOT IN (
    SELECT 
    IdAssunto
    FROM Livro
)
ORDER BY NomeAssunto;

-- 16. Liste os livros que possuem o mesmo preço que outro livro diferente.

SELECT NomeLivro, PrecoLivro
FROM Livro
WHERE PrecoLivro IN (
    SELECT PrecoLivro
    FROM Livro
    GROUP BY PrecoLivro
    HAVING COUNT(*) > 1
)
ORDER BY NomeLivro;


-- 17. Liste os livros cujo número de páginas seja maior que o número máximo de páginas dos livros de um determinado assunto.

SELECT L.NomeLivro, L.NumeroPaginas, A.NomeAssunto
FROM Livro L
JOIN Assunto A
ON A.IdAssunto = L.IdAssunto
WHERE L.NumeroPaginas > (
    SELECT MAX(L2.NumeroPaginas)
    FROM Livro L2
    JOIN Assunto A2 ON A2.IdAssunto = L2.IdAssunto
    WHERE A2.NomeAssunto = 'Tecnologia'
)
ORDER BY L.NumeroPaginas;

-- 18. Liste os nomes das editoras que possuem livros com preço acima da média.

SELECT E.NomeEditora,
       CONCAT('R$ ', L.PrecoLivro) AS Preco
FROM Editora E
JOIN Livro L ON L.IdEditora = E.IdEditora
WHERE L.PrecoLivro > (
    SELECT AVG(L2.PrecoLivro)
    FROM Livro L2
)
ORDER BY L.PrecoLivro;


-- 19. Liste os autores que participaram do livro mais caro.

SELECT CONCAT(A.NomeAutor,' ',A.SobrenomeAutor)
FROM Autor A
JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
JOIN Livro L ON L.IdLivro = LA.IdLivro
WHERE L.PrecoLivro = (
    SELECT MAX(L2.PrecoLivro)
    FROM Livro L2
);



-- 20. Liste os livros que possuem autores associados.

SELECT DISTINCT L.NomeLivro
FROM Livro L
WHERE EXISTS (
    SELECT 1
    FROM LivroAutor LA
    WHERE LA.IdLivro = L.IdLivro
);

