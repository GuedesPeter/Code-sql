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
-- 12. Exiba os livros cuja data de publicação esteja entre 2018-01-01 e 2022-12-31.
-- 13. Liste os livros com número de páginas entre 200 e 500.

-- 14. Liste os livros cujo preço esteja entre 40 e 80 e o assunto não seja "Ficção".
-- 15. Exiba os livros cuja data de publicação esteja entre 2015 e 2020 ou o preço seja menor que 30.
-- 16. Liste os livros que tenham entre 300 e 600 páginas e editora diferente de "Companhia das Letras".
-- 17. Mostre os livros que tenham preço maior que 90 ou assunto "Economia", mas não da editora "Moderna".
-- 18. Exiba os livros cuja data de publicação esteja entre 2010 e 2018 e o preço não esteja entre 40 e 70.
-- 19. Liste os autores que não escreveram livros de assunto "Autoajuda" ou que publicaram livros com mais de 500 páginas.
-- 20. Mostre o nome dos livros que têm entre 200 e 400 páginas, preço menor que 100 e cuja editora seja "Pearson" ou "Atlas".





