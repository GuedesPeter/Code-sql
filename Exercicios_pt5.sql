USE Biblioteca;

/* ===========================================================
   🧩 EXERCÍCIOS DE SQL SERVER – GROUP BY e HAVING
   Base de dados: Livros, Autores, Editoras, Assuntos, LivroAutores
   =========================================================== */

/* 1. Exiba o número total de livros cadastrados por cada editora. */

SELECT
    COUNT(L.IdLivro) AS Qtde_Livros,
    E.NomeEditora AS Editora
FROM Livro L
INNER JOIN Editora E ON E.IdEditora = L.IdEditora
GROUP BY E.NomeEditora;

/* 2. Mostre a média de preço dos livros agrupados por assunto. */

SELECT
    A.NomeAssunto AS Assunto,
    CONCAT('R$ ', ROUND(AVG(L.PrecoLivro),2)) AS Media_Preco
FROM Livro L 
INNER JOIN Assunto A ON A.IdAssunto = L.IdAssunto
GROUP BY A.NomeAssunto;

/* 3. Liste as editoras que possuem mais de 2 livros publicados. */

SELECT
    E.NomeEditora AS Editora,
    COUNT(L.IdLivro) AS Livros
FROM Editora E
INNER JOIN Livro L ON L.IdEditora = E.IdEditora
GROUP BY E.NomeEditora -- Agrupar antes do filtro de agragações
HAVING COUNT(L.IdLivro) > 2; -- Filtro de função de agregação


/* 4. Exiba o total de páginas somadas dos livros por cada editora. */

SELECT
    SUM(L.NumeroPaginas) AS Total_Páginas,
    E.NomeEditora AS Editora
FROM Livro L
JOIN Editora E ON E.IdEditora = L.IdEditora
GROUP BY E.NomeEditora;


/* 5. Mostre o preço médio dos livros por ano de publicação. */

SELECT
    CONCAT('R$ ',AVG(PrecoLivro)) AS Media_Valor,
    YEAR(DataPub) AS Ano
FROM Livro
GROUP BY DataPub;

/* 6. Liste os assuntos cujo preço médio dos livros seja superior a R$ 70,00. */

SELECT
    A.NomeAssunto AS Assunto,
    CONCAT('R$ ',AVG(L.PrecoLivro)) AS Media_Preco
FROM Assunto A
JOIN Livro L ON L.IdAssunto = A.IdAssunto
GROUP BY A.NomeAssunto
HAVING AVG(L.PrecoLivro) > 70.00;


/* 7. Exiba o total de livros publicados por ano. */

SELECT
    COUNT(IdLivro) AS Qtd_Livros,
    YEAR(DataPub) AS Ano_Publicacao
FROM Livro 
GROUP BY DataPub;

/* 8. Liste as editoras com preço médio dos livros inferior a R$ 70,00. */

SELECT
    E.NomeEditora AS Editora,
    CONCAT('R$ ', AVG(PrecoLivro)) AS Preco_Medio
FROM Editora E 
JOIN Livro L ON L.IdEditora = E.IdEditora
GROUP BY E.NomeEditora
HAVING AVG(L.PrecoLivro) < 70.00;

/* 9. Mostre o número de autores diferentes que possuem livros em cada editora. */

SELECT 
    COUNT(DISTINCT A.IdAutor) AS Qtd_Autor,
    E.NomeEditora AS Editora
FROM Autor A 
JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
JOIN Livro L ON L.IdLivro = LA.IdLivro
JOIN Editora E ON E.IdEditora = L.IdEditora
GROUP BY E.NomeEditora;

/* 10. Exiba os assuntos que possuem mais de 2 livros cadastrados. */

SELECT 
    A.NomeAssunto,
    COUNT(L.IdLivro) AS QTD
FROM Assunto A 
JOIN Livro L ON L.IdAssunto = A.IdAssunto
GROUP BY A.NomeAssunto
HAVING COUNT(L.IdLivro) > 2;


/* 11. Liste os autores e a quantidade total de livros escritos por cada um. */

SELECT
    A.NomeAutor AS AUTOR,
    COUNT(L.IdLivro) AS QTD_LIVROS
FROM Autor A 
JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
JOIN Livro L ON L.IdLivro = LA.IdLivro
GROUP BY A.NomeAutor;

/* 12. Mostre os anos de publicação em que foram publicados mais de 2 livros. */

SELECT
    YEAR(DataPub) AS Ano_Publicacao
FROM Livro
GROUP BY DataPub
HAVING COUNT(IdLivro) >= 2;

/* 13. Exiba o número médio de páginas por assunto. */

SELECT
    A.NomeAssunto,
    AVG(L.NumeroPaginas) AS Media_Paginas
FROM Livro L
JOIN Assunto A ON A.IdAssunto = L.IdAssunto
GROUP BY A.NomeAssunto;

/* 14. Liste as editoras cujo total de páginas publicadas ultrapassa 1000 páginas. */

SELECT 
    E.NomeEditora,
    SUM(L.NumeroPaginas) AS Paginas
FROM Editora E
JOIN Livro L ON L.IdEditora = E.IdEditora
GROUP BY E.NomeEditora
HAVING SUM(L.NumeroPaginas) >= 1000;

/* 15. Mostre o menor e o maior preço de livro agrupado por assunto. */

SELECT 
    A.NomeAssunto,
    MAX(L.PrecoLivro) AS Vlr_Maximo,
    MIN(L.PrecoLivro) AS Vlr_Minimo
FROM Livro L
JOIN Assunto A ON A.IdAssunto = L.IdAssunto
GROUP BY A.NomeAssunto;


/* 16. Exiba o total de autores diferentes por assunto. */

SELECT 
     AA.NomeAssunto AS Assunto,
    COUNT(DISTINCT A.IdAutor) AS Total_Autores
FROM Autor A
JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
JOIN Livro L ON L.IdLivro = LA.IdLivro
JOIN Assunto AA ON AA.IdAssunto = L.IdAssunto
GROUP BY AA.NomeAssunto;

/* 17. Liste as editoras cujo preço médio de livro esteja entre R$ 60,00 e R$ 120,00. */

SELECT 
    E.NomeEditora AS Editora,
    AVG(L.PrecoLivro) AS Vlr_Medio_Livro
FROM Editora E
JOIN Livro L ON L.IdEditora = E.IdEditora
GROUP BY E.NomeEditora
HAVING AVG(L.PrecoLivro) BETWEEN 60.00 AND 120.00;

/* 18. Mostre o número de livros por autor que possuem mais de 1 obras publicadas. */

SELECT 
    A.NomeAutor,
    COUNT(L.IdLivro) AS Qtd_Livros
FROM Livro L
JOIN LivroAutor LA ON LA.IdLivro = L.IdLivro
JOIN Autor A ON A.IdAutor = LA.IdAutor
GROUP BY A.NomeAutor
HAVING COUNT(L.IdLivro) > 1;

/* 19. Exiba o total de livros e o preço médio por editora, ordenando pelo total de livros. */

SELECT
    COUNT(L.IdLivro) AS Total_Livros,
    AVG(L.PrecoLivro) AS Preco_Medio,
    E.NomeEditora AS Editora
FROM Livro L
JOIN Editora E ON E.IdEditora = L.IdEditora
GROUP BY E.NomeEditora
ORDER BY Total_Livros; --DESC

/* 20. Liste os assuntos cujo total de páginas médias dos livros seja maior que 300. */

SELECT
    A.NomeAssunto AS Assunto,
    AVG(L.NumeroPaginas) AS Media_Paginas
FROM Assunto A 
JOIN Livro L ON L.IdAssunto = A.IdAssunto
GROUP BY A.NomeAssunto
HAVING AVG(L.NumeroPaginas) > 300;