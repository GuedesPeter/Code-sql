USE Biblioteca;

-- ============================================================
-- 🧩 EXERCÍCIOS DE SQL - OPERADORES LÓGICOS (AND, OR, NOT, BETWEEN)
-- Base: Tabelas Livros, Autores, Editoras, Assuntos e LivroAutores
-- ============================================================

-- 1. Liste todos os livros cujo preço seja maior que 50 e o número de páginas seja maior que 300.

SELECT
    NomeLivro AS LIVRO,
    PrecoLivro AS VALOR,
    NumeroPaginas AS PAGINAS
FROM Livro
WHERE PrecoLivro > 50.00 AND NumeroPaginas > 300;

-- 2. Exiba o nome e a data de publicação dos livros publicados após 2010-01-01 e cujo preço seja menor que 100.

SELECT
    NomeLivro AS LIVRO,
    DataPub AS DATA,
    PrecoLivro AS VALOR
FROM Livro
WHERE DataPub > '2010-01-01' AND PrecoLivro < 100.00;

-- 3. Mostre os livros cujo assunto seja "Tecnologia" e a editora seja "HarperCollins".

SELECT
    L.NomeLivro AS Livro,
    A.NomeAssunto AS Assunto,
    E.NomeEditora AS Editora
FROM Livro L
INNER JOIN Assunto A ON A.IdAssunto = L.IdAssunto
INNER JOIN Editora E ON E.IdEditora = L.IdEditora
WHERE A.NomeAssunto = 'Tecnologia'
AND E.NomeEditora = 'HarperCollins';

-- 4. Liste os livros que custam menos de 40 ou possuem menos de 200 páginas.
SELECT 
    NomeLivro,
    PrecoLivro,
    NumeroPaginas
FROM Livro
WHERE PrecoLivro < 40.00 OR NumeroPaginas < 200;

-- 5. Mostre os livros publicados antes de 2015 ou que pertencem ao assunto "Eletrônica".
SELECT 
    L.NomeLivro,
    L.DataPub,
    A.NomeAssunto
FROM Livro L
INNER JOIN Assunto A ON A.IdAssunto = L.IdAssunto
WHERE L.DataPub < '2015' OR A.NomeAssunto = 'Eletrônica';

-- 6. Exiba os nomes dos livros cuja editora seja "O`Reilly" ou "Novatec".

SELECT 
    L.NomeLivro,
    E.NomeEditora
FROM Livro L
INNER JOIN Editora E ON E.IdEditora = L.IdEditora
WHERE E.NomeEditora = 'O`Reilly' OR E.NomeEditora = 'Novatec'
ORDER BY E.NomeEditora DESC;

-- 7. Liste todos os livros que não pertencem ao assunto "Romance".

SELECT
    L.NomeLivro,
    A.NomeAssunto
FROM Livro L
INNER JOIN Assunto A ON A.IdAssunto = L.IdAssunto
WHERE A.NomeAssunto NOT LIKE 'Romance';

-- 8. Mostre os autores cujo sobrenome não começa com a letra "S".
SELECT
     NomeAutor
FROM Autor
WHERE NomeAutor NOT LIKE 'S%'
ORDER BY NomeAutor;

-- 9. Exiba os livros cuja editora não seja "Novatec".

SELECT 
    L.NomeLivro,
    E.NomeEditora
FROM Editora E
INNER JOIN Livro L ON L.IdEditora = E.IdEditora
WHERE E.NomeEditora NOT LIKE 'Novatec'
ORDER BY E.NomeEditora;

-- 10. Liste os livros cujo preço não esteja entre 30 e 70 reais.
SELECT 
    NomeLivro,
    PrecoLivro
FROM Livro
WHERE PrecoLivro NOT BETWEEN 30.00 AND 70.00;

-- [À Fazer]

-- 11. Mostre os livros cujo preço esteja entre 50 e 100 reais.
SELECT 
    NomeLivro,
    CONCAT('R$ ', PrecoLivro) AS Valor
FROM Livro 
WHERE PrecoLivro BETWEEN 50.00 AND 100.00;

-- 12. Exiba os livros cuja data de publicação esteja entre 2010-01-01 e 2022-12-31.
SELECT
    NomeLivro,
    DataPub AS Publicação
FROM Livro
WHERE DataPub BETWEEN '2010-01-01' AND '2022-12-31';

-- 13. Liste os livros com número de páginas entre 200 e 500.
SELECT
    NomeLivro,
    NumeroPaginas
FROM Livro
WHERE NumeroPaginas BETWEEN 200 AND 500;

-- 14. Liste os livros cujo preço esteja entre 40 e 80 e o assunto não seja "Ficção".
SELECT 
    L.NomeLivro AS Livro,
    L.NumeroPaginas AS Páginas,
    A.NomeAssunto AS Assunto
FROM Livro L
INNER JOIN Assunto A ON A.IdAssunto = L.IdAssunto
WHERE PrecoLivro BETWEEN 40.00 AND 80.00
AND A.NomeAssunto NOT LIKE '%Ficção%';

-- 15. Exiba os livros cuja data de publicação esteja entre 2015 e 2020 ou o preço seja menor que 30.
SELECT DISTINCT 
*
FROM Livro
WHERE DataPub BETWEEN '2015' AND '2020'
AND PrecoLivro > 30.00;

-- 16. Liste os livros que tenham entre 300 e 600 páginas e editora diferente de "Companhia das Letras".
SELECT DISTINCT
    L.NomeLivro,
    L.NumeroPaginas,
    E.NomeEditora
FROM Livro L
JOIN Editora E ON E.IdEditora = L.IdEditora
WHERE L.NumeroPaginas BETWEEN 300 AND 600
AND E.NomeEditora != 'Companhia das Letras';


-- 17. Mostre os livros que tenham preço maior que 90 ou assunto "Economia", mas não da editora "Moderna".
SELECT DISTINCT
    L.NomeLivro,
    L.PrecoLivro,
    A.NomeAssunto,
    E.NomeEditora
FROM Livro L 
JOIN Editora E ON E.IdEditora = L.IdEditora
JOIN Assunto A ON A.IdAssunto = L.IdAssunto
WHERE L.PrecoLivro > 90 OR A.NomeAssunto = 'Economia'
AND E.NomeEditora NOT LIKE '%Moderna%'; -- != "Moderna"

-- 18. Exiba os livros cuja data de publicação esteja entre 2010 e 2018 e o preço não esteja entre 40 e 70.
SELECT DISTINCT
    NomeLivro,
    PrecoLivro,
    DataPub
FROM Livro 
WHERE DataPub BETWEEN '2010' AND '2018'
AND PrecoLivro NOT BETWEEN 40.00 AND 70.00;

-- 19. Liste os autores que não escreveram livros de assunto "Autoajuda" ou que publicaram livros com mais de 500 páginas.
SELECT DISTINCT
    CONCAT(A.NomeAutor, ' ',A.SobrenomeAutor) AS Autor,
    L.NomeLivro,
    L.NumeroPaginas,
    AA.NomeAssunto
FROM Autor A
JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
JOIN Livro L ON L.IdLivro = LA.IdLivro
JOIN Assunto AA ON AA.IdAssunto = L.IdAssunto
WHERE AA.NomeAssunto != 'Autoajuda' OR L.NumeroPaginas > 500;

-- 20. Mostre o nome dos livros que têm entre 200 e 400 páginas, preço menor que 100 e cuja editora seja "Pearson" ou "Atlas".
SELECT
    L.NomeLivro,
    L.NumeroPaginas,
    L.PrecoLivro,
    E.NomeEditora
FROM Livro L 
JOIN Editora E ON E.IdEditora = L.IdEditora
WHERE L.NumeroPaginas BETWEEN 200 AND 400
AND L.PrecoLivro < 100.00 
AND E.NomeEditora = 'Pearson' OR E.NomeEditora = 'Atlas';




