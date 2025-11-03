USE Biblioteca;

-- ============================================================
-- 🧩 EXERCÍCIOS JOINs — INNER JOIN
-- Base: Tabelas Livros, Autores, Editoras, Assuntos e LivroAutores
-- ============================================================


-- 1. Liste o nome do livro e o nome da editora usando INNER JOIN.

SELECT
    L.NomeLivro AS LIVRO,
    E.NomeEditora AS EDITORA
FROM Livro L
INNER JOIN Editora E 
    ON E.IdEditora = L.IdEditora;

-- 2. Mostre o nome do livro e o nome do assunto associado.

SELECT 
    L.NomeLivro AS LIVRO,
    A.NomeAssunto AS ASSUNTO
FROM Livro L 
INNER JOIN Assunto A
    ON A.IdAssunto = L.IdAssunto;


-- 3. Exiba o nome do livro e o nome completo dos autores.

SELECT
    L.NomeLivro AS LIVRO,
    CONCAT(A.NomeAutor, ' ',A.SobrenomeAutor) AS AUTOR
FROM Livro L 
INNER JOIN LivroAutor LA ON LA.IdLivro = L.IdLivro
INNER JOIN Autor A ON A.IdAutor = LA.IdAutor;

-- 4. Liste o nome do autor e todos os livros que ele escreveu.

SELECT
    CONCAT(A.NomeAutor, ' ',A.SobrenomeAutor) AS AUTOR,
    L.NomeLivro AS LIVRO
FROM Autor A 
INNER JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
INNER JOIN Livro L ON L.IdLivro = LA.IdLivro;

-- 5. Mostre o nome do livro, o nome do autor e o nome da editora.

SELECT 
    L.NomeLivro AS LIVRO,
    CONCAT(A.NomeAutor, ' ',A.SobrenomeAutor) AS AUTOR,
    E.NomeEditora AS EDITORA
FROM Livro L 
INNER JOIN LivroAutor LA ON LA.IdLivro = L.IdLivro
INNER JOIN Autor A ON A.IdAutor = LA.IdAutor
INNER JOIN Editora E ON E.IdEditora = L.IdEditora;

-- 6. Liste o nome do livro e o assunto correspondente, apenas para livros com preço acima de 50.

SELECT
    L.NomeLivro AS LIVRO,
    A.NomeAssunto AS ASSUNTO,
    CONCAT('R$ ',L.PrecoLivro) AS PRECO
FROM Livro L
INNER JOIN Assunto A ON A.IdAssunto = L.IdAssunto
WHERE L.PrecoLivro > 50.00;

-- 7. Exiba o nome do livro, o nome da editora e o preço.

SELECT
    L.NomeLivro AS LIVRO,
    E.NomeEditora AS EDITORA,
    CONCAT('R$ ',L.PrecoLivro) AS PRECO
FROM Livro L 
INNER JOIN Editora E ON E.IdEditora = L.IdEditora;

-- 8. Liste os autores e as editoras dos livros que publicaram.

SELECT
    CONCAT(A.NomeAutor,' ',A.SobrenomeAutor) AS AUTOR,
    E.NomeEditora AS EDITORA,
    L.NomeLivro AS Livro_Publicado
FROM Autor A 
INNER JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
INNER JOIN Livro L ON L.IdLivro = LA.IdLivro
INNER JOIN Editora E ON E.IdEditora = L.IdEditora;

-- 9. Mostre o nome do livro, número de páginas e o nome do assunto.

SELECT
    L.NomeLivro AS LIVRO,
    L.NumeroPaginas AS PAGINAS,
    A.NomeAssunto AS ASSUNTO
FROM Livro L 
INNER JOIN Assunto A ON A.IdAssunto = L.IdAssunto;

-- 10. Liste todos os livros, seus autores e os assuntos associados.

SELECT
    L.NomeLivro AS LIVRO,
    CONCAT(A.NomeAutor,' ',A.SobrenomeAutor) AS AUTOR,
    AA.NomeAssunto AS ASSUNTO
FROM Livro L 
INNER JOIN LivroAutor LA ON LA.IdLivro = L.IdLivro
INNER JOIN Autor A ON A.IdAutor = LA.IdAutor
INNER JOIN Assunto AA ON AA.IdAssunto = L.IdAssunto;


-- 11. Liste o nome do livro e o nome do autor, ordenando pelo nome do autor.

SELECT
    L.NomeLivro AS LIVRO,
    CONCAT(A.NomeAutor, ' ', A.SobrenomeAutor) AS AUTOR
FROM Livro L 
INNER JOIN LivroAutor LA ON LA.IdLivro = L.IdLivro
INNER JOIN Autor A ON A.IdAutor = LA.IdAutor
ORDER BY A.NomeAutor;

-- 12. Exiba o nome do livro, nome do autor e sobrenome do autor.

SELECT
    L.NomeLivro AS LIVRO,
    A.NomeAutor,
    A.SobrenomeAutor
FROM Livro L 
INNER JOIN LivroAutor LA ON LA.IdLivro = L.IdLivro
INNER JOIN Autor A ON A.IdAutor = LA.IdAutor;

-- 13. Liste os livros com o nome da editora e do assunto.

SELECT
    L.NomeLivro,
    E.NomeEditora,
    A.NomeAssunto
FROM Livro L 
INNER JOIN Editora E ON E.IdEditora = L.IdEditora
INNER JOIN Assunto A ON A.IdAssunto = L.IdAssunto
ORDER BY L.NomeLivro;

-- 14. Mostre o nome do autor e a quantidade de livros escritos (sem usar GROUP BY).

SELECT DISTINCT
    CONCAT(A.NomeAutor,' ',A.SobrenomeAutor) AS AUTOR,
    COUNT(L.IdLivro) OVER (PARTITION BY A.IdAutor)AS QTD_LIVROS
FROM Autor A 
INNER JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
INNER JOIN Livro L ON L.IdLivro = LA.IdLivro;
-- COUNT(...) OVER (PARTITION BY A.IdAutor) conta quantos livros cada autor escreveu sem agrupar formalmente as linhas (ou seja, sem GROUP BY).

-- 15. Exiba o nome do livro, autor e assunto, apenas para livros publicados após 2010.

SELECT
    CONCAT(L.NomeLivro,' - ',YEAR(L.DataPub)) AS LIVRO,
    CONCAT(A.NomeAutor,' ',A.SobrenomeAutor) AS AUTOR,
    AA.NomeAssunto AS ASSUNTO
FROM Livro L 
INNER JOIN LivroAutor LA ON LA.IdLivro = L.IdLivro
INNER JOIN Autor A ON A.IdAutor = LA.IdAutor
INNER JOIN Assunto AA ON AA.IdAssunto = L.IdAssunto
WHERE YEAR(L.DataPub) > '2010';

-- 16. Liste o nome da editora e os livros publicados por ela.

SELECT
    E.NomeEditora,
    L.NomeLivro
FROM Editora E 
INNER JOIN Livro L ON L.IdEditora = E.IdEditora;

-- 17. Exiba todos os livros com o nome do assunto e do autor, ordenados por data de publicação.

SELECT 
    L.NomeLivro AS LIVRO,
    AA.NomeAssunto AS ASSUNTO,
    CONCAT(A.NomeAutor,' ',A.SobrenomeAutor) AS AUTOR,
    YEAR(L.DataPub) AS PUBLICADO_EM
FROM Livro L 
INNER JOIN LivroAutor LA ON LA.IdLivro = L.IdLivro
INNER JOIN Autor A ON A.IdAutor = LA.IdAutor
INNER JOIN Assunto AA ON AA.IdAssunto = L.IdAssunto
ORDER BY L.DataPub;

-- 18. Liste todos os autores que escreveram livros de um determinado assunto.

SELECT
    CONCAT(A.NomeAutor,' ',A.SobrenomeAutor) AS AUTOR,
    AA.NomeAssunto AS ASSUNTO,
    L.NomeLivro AS LIVRO
FROM Autor A
JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
JOIN Livro L ON L.IdLivro = LA.IdLivro
JOIN Assunto AA ON AA.IdAssunto = L.IdAssunto
WHERE AA.NomeAssunto LIKE '%Tecnologia%';


-- 19. Mostre o nome do livro, ISBN13 e o nome da editora.

SELECT DISTINCT
     L.NomeLivro,
     L.ISBN13,
     E.NomeEditora
FROM Livro L 
JOIN Editora E ON E.IdEditora = L.IdEditora
ORDER BY L.ISBN13;

-- 20. Liste o nome do livro, nome da editora e assunto.

SELECT DISTINCT
    L.NomeLivro,
    E.NomeEditora,
    A.NomeAssunto
FROM Livro L 
JOIN Editora E ON E.IdEditora = L.IdEditora
JOIN Assunto A ON A.IdAssunto = L.IdAssunto;

-- 21. Exiba o nome do autor e todos os livros que ele escreveu, incluindo a data de publicação.

SELECT
    CONCAT(A.NomeAutor,' ',A.SobrenomeAutor) AS AUTOR,
    L.NomeLivro AS LIVRO,
    FORMAT(L.DataPub,'dd/MM/yyyy') AS PUBLICACAO
FROM Autor A 
LEFT JOIN LivroAutor LA ON LA.IdAutor = A.IdAutor
LEFT JOIN Livro L ON L.IdLivro = LA.IdLivro
ORDER BY L.DataPub DESC;


-- 22. Liste o nome do livro e o nome da editora, ordenando pelo nome da editora.
-- 23. Mostre o nome do livro, número de páginas e o nome do autor.
-- 24. Liste os livros com mais de 300 páginas e seus respectivos autores.
-- 25. Exiba o nome da editora e os assuntos dos livros que ela publica.
-- 26. Mostre o nome do livro, autor e assunto para livros de uma editora específica.
-- 27. Liste o nome do livro, nome do autor e o ISBN13.
-- 28. Exiba os autores que publicaram livros em mais de uma editora (sem agregação).
-- 29. Liste o nome do livro, autor e preço, apenas para livros com preço inferior a 100.
-- 30. Mostre o nome da editora e os livros publicados em 2024.

-- 31. Exiba o nome do livro, nome da editora e a data de publicação.
-- 32. Liste o nome do livro, autor e o assunto, ordenados pelo nome do livro.
-- 33. Mostre o nome do livro e o sobrenome do autor.
-- 34. Liste os autores que possuem livros em um assunto específico.
-- 35. Exiba o nome do livro e o nome do assunto, apenas para livros com ISBN13 não nulo.
-- 36. Mostre o nome do livro, número de páginas e o nome da editora.
-- 37. Liste o nome da editora e o total de livros que ela publicou (sem usar agregação).
-- 38. Exiba os autores e os assuntos de seus livros.
-- 39. Liste o nome do livro, o assunto e o autor.
-- 40. Mostre o nome da editora e os livros publicados antes de 2010.

-- 41. Exiba o nome do livro e o nome completo do autor.
-- 42. Liste o nome do autor e o nome da editora onde publicou.
-- 43. Mostre o nome do livro, o preço e o nome da editora.
-- 44. Liste os autores e os assuntos de livros que escreveram.
-- 45. Exiba os livros e o nome da editora, apenas para livros com mais de 500 páginas.
-- 46. Mostre o nome do autor, sobrenome e os livros escritos por ele.
-- 47. Liste os livros e as editoras, apenas para assuntos de tecnologia.
-- 48. Exiba o nome do livro, autor e assunto de todos os livros cadastrados.
-- 49. Liste o nome da editora e o nome dos autores que publicaram por ela.
-- 50. Mostre o nome do livro, autor e data de publicação.

-- 51. Exiba o nome do autor e o nome dos livros ordenados por data de publicação.
-- 52. Liste o nome do livro, assunto e editora.
-- 53. Mostre o nome do livro, número de páginas e o assunto.
-- 54. Liste o nome do livro e o nome da editora, apenas para editoras com nome iniciado em 'A'.
-- 55. Exiba os livros e seus respectivos autores e editoras.
-- 56. Mostre o nome do livro e o nome do autor, apenas para livros de um determinado assunto.
-- 57. Liste os autores e os livros de um determinado ano de publicação.
-- 58. Exiba o nome do livro, o nome do autor e o assunto, apenas para livros com mais de 200 páginas.
-- 59. Mostre o nome da editora e os autores que publicaram livros de um mesmo assunto.
-- 60. Liste o nome do livro e a editora, apenas para livros com preço entre 100 e 200.

-- 61. Exiba o nome do livro, o autor e o número de páginas.
-- 62. Liste o nome do livro, a editora e o assunto, apenas para livros com ISBN13 iniciado em '978'.
-- 63. Mostre o nome do livro, autor e data de publicação em ordem decrescente.
-- 64. Liste o nome da editora e o nome do livro publicado por ela em 2023.
-- 65. Exiba o nome do livro, o assunto e o preço.
-- 66. Mostre o nome do autor, o livro e a editora correspondente.
-- 67. Liste o nome do livro e o assunto, apenas para livros de preço igual a 0.
-- 68. Exiba o nome do livro, a editora e o autor, apenas para livros com mais de um autor.
-- 69. Mostre o nome do autor e o nome dos livros de um determinado assunto.
-- 70. Liste o nome do livro, o assunto e a data de publicação.

-- 71. Exiba o nome do autor e todos os livros que ele escreveu com o nome da editora.
-- 72. Liste o nome do livro e o nome do autor, apenas para livros de um assunto específico.
-- 73. Mostre o nome da editora e o nome do livro, apenas para editoras que publicaram livros após 2015.
-- 74. Liste o nome do livro e o nome do assunto, apenas para assuntos relacionados à “Ciência”.
-- 75. Exiba o nome do autor e o nome dos livros com mais de 600 páginas.
-- 76. Mostre o nome do livro, a editora e o preço, apenas para livros com preço superior a 500.
-- 77. Liste o nome do livro e o nome do autor, ordenados por sobrenome do autor.
-- 78. Exiba o nome da editora e o nome dos assuntos de seus livros.
-- 79. Liste o nome do livro e o nome do autor, apenas para livros publicados em 2022.
-- 80. Mostre o nome do autor, o livro e o assunto, apenas para livros de preço abaixo de 100.

-- 81. Exiba o nome do livro e o nome da editora, apenas para livros com ISBN13 contendo “123”.
-- 82. Liste o nome do autor e o nome da editora, apenas para editoras com mais de um autor.
-- 83. Mostre o nome do livro e o nome do autor, apenas para autores com sobrenome “Silva”.
-- 84. Liste o nome do livro e o assunto, apenas para assuntos que começam com a letra “H”.
-- 85. Exiba o nome do autor, o livro e o assunto, apenas para livros com mais de 100 páginas.
-- 86. Mostre o nome do livro, o nome do autor e o preço, apenas para livros com autores diferentes.
-- 87. Liste o nome da editora e os livros com preço igual ao maior preço da tabela.
-- 88. Exiba o nome do livro, o nome da editora e o assunto, apenas para editoras com nome contendo “Editora”.
-- 89. Liste o nome do autor e o nome do livro, apenas para livros publicados entre 2010 e 2020.
-- 90. Mostre o nome do livro, o autor e o assunto, apenas para livros com título contendo “SQL”.

-- 91. Exiba o nome do livro e o nome do autor, apenas para livros com mais de 2 autores (use INNER JOIN).
-- 92. Liste o nome do livro e o nome da editora, apenas para livros cujo assunto é “Programação”.
-- 93. Mostre o nome do livro, o autor e o preço, ordenados por preço decrescente.
-- 94. Liste o nome do livro e o assunto, apenas para livros publicados no mês de janeiro.
-- 95. Exiba o nome do autor, o nome do livro e o número de páginas.
-- 96. Mostre o nome do livro, o assunto e o autor, apenas para livros publicados antes de 2000.
-- 97. Liste o nome da editora e os livros de autores com sobrenome iniciando por “A”.
-- 98. Exiba o nome do livro, o autor e o assunto, apenas para livros cujo nome do assunto contenha “Dados”.
-- 99. Liste o nome do livro e o nome do autor, apenas para livros sem ISBN13 nulo.
-- 100. Mostre o nome do livro, a editora e o assunto, apenas para livros de preço entre 10 e 50.
