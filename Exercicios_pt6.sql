USE Biblioteca;

/* ===========================================================
   🧩 EXERCÍCIOS DE SQL SERVER – LIKE e NOT LIKE
   Base de dados: Livros, Autores, Editoras, Assuntos, LivroAutores
   =========================================================== */

/* 1. Liste todos os livros cujo nome comece com a letra 'A'. */

SELECT
   NomeLivro
FROM Livro
WHERE NomeLivro LIKE 'A%';

/* 2. Mostre os livros cujo nome contenha a palavra 'História'. */

SELECT
   NomeLivro
FROM Livro
WHERE NomeLivro LIKE '%História%';

/* 3. Encontre os livros cujo nome termine com a palavra 'Brasil'. */

SELECT 
   NomeLivro
FROM Livro
WHERE NomeLivro LIKE '%Brasil';


/* 4. Liste os livros cujo ISBN13 Termine com '978-05'. */

SELECT
   NomeLivro,
   ISBN13
FROM Livro
WHERE ISBN13 LIKE '%05';

/* 5. Exiba os livros cujo nome tenha exatamente 5 caracteres. */

SELECT
    NomeLivro
FROM Livro
WHERE LEN(NomeLivro) = 5;


/* 6. Mostre os autores cujo sobrenome comece com a letra 'S'. */

SELECT
   CONCAT(NomeAutor,' ',SobrenomeAutor)
FROM Autor
WHERE SobrenomeAutor LIKE 'S%';

/* 7. Liste os autores cujo nome contenha a sequência 'mar'. */

SELECT
   CONCAT(NomeAutor,' ',SobrenomeAutor) AS AUTOR
FROM Autor
WHERE NomeAutor LIKE '%MAR%';

/* 8. Selecione os autores cujo sobrenome termine com 'son'. */

SELECT
   CONCAT(NomeAutor,' ',SobrenomeAutor) AS AUTOR
FROM Autor
WHERE NomeAutor LIKE '%SON';

/* 9. Mostre as editoras cujo nome contenha a palavra 'Editora'. */

SELECT
   NomeEditora
FROM Editora
WHERE NomeEditora LIKE '%Editora%';

/* 10. Liste as editoras cujo nome comece com as letras entre 'A' e 'C'. */

SELECT
   NomeEditora
FROM Editora
WHERE NomeEditora LIKE 'B%';

/* 11. Exiba os assuntos cujo nome termine com 'logia'. */

SELECT
   NomeAssunto
FROM Assunto
WHERE NomeAssunto LIKE '%LOGIA';

/* 12. Liste os assuntos cujo nome comece com a letra 'F'. */

SELECT
   NomeAssunto
FROM Assunto
WHERE NomeAssunto LIKE 'F%';

/* 13. Mostre os livros cujo nome contenha um hífen '-'. */

SELECT
   NomeLivro
FROM Livro
WHERE NomeLivro LIKE '%-%';

/* 14. Encontre os livros cujo nome não comece com a letra 'O'. */

SELECT
   NomeLivro
FROM Livro
WHERE NomeLivro NOT LIKE 'O%';

/* 15. Liste os autores cujo nome tenha a letra 'a' na segunda posição. */

SELECT
   CONCAT(NomeAutor,' ',SobrenomeAutor) AS AUTOR
FROM Autor
WHERE NomeAutor LIKE '_A%';

/* 16. Mostre os livros cujo nome contenha dois espaços (ex: títulos compostos). */

/* 17. Encontre os livros cujo nome tenha a palavra 'Introdução' em qualquer posição. */

/* 18. Liste as editoras cujo nome não contenha a palavra 'Gráfica'. */

/* 19. Mostre os assuntos cujo nome contenha as letras 'ar' consecutivas. */

/* 20. Liste os livros cujo nome comece com 'O ' e termine com ' de'. */

/* 21. Encontre os autores cujo sobrenome não comece com as letras entre 'M' e 'Z'. */

/* 22. Mostre os livros cujo ISBN13 contenha o número '2025'. */

/* 23. Liste as editoras cujo nome tenha o caractere '&' (e comercial). */

/* 24. Exiba os livros cujo nome contenha pelo menos um número. */

/* 25. Mostre os livros cujo nome termine com um ponto de interrogação '?'. */
