USE Biblioteca;


-- DESAFIO 1

/*
Escreva uma consulta que retorne o nome dos livros e seus respectivos
assuntos
*/

SELECT
    L.NomeLivro AS LIVRO,
    A.NomeAssunto AS ASSUNTO
FROM Livro L
INNER JOIN Assunto A 
    ON A.IdAssunto = L.IdAssunto;

-- DESAFIO 2

/*
Precisamos descobrir os nomes e sobrenomes doa autores, livros escritos por eles e
seus respectivos assuntos
*/

SELECT
    CONCAT(A.NomeAutor,' ',A.SobrenomeAutor) AS AUTOR,
    L.NomeLivro AS LIVRO,
    AA.NomeAssunto AS ASSUNTO
FROM Autor A
INNER JOIN LivroAutor LA 
    ON LA.IdAutor = A.IdAutor
INNER JOIN Livro L
    ON L.IdLivro = LA.IdLivro
INNER JOIN Assunto AA 
    ON AA.IdAssunto = L.IdAssunto;


-- DESAFIO 3

/*
Escreva uma consulta que retorne o nome dos livros, seus preços, a editora e
o assunto, em ordem alfabética de nome de livros
*/

SELECT
    L.NomeLivro AS Livro,
    CONCAT('R$ ', L.PrecoLivro) AS Vlr_Livro,
    E.NomeEditora AS Editora
FROM Livro L
INNER JOIN Editora E
    ON E.IdEditora = L.IdEditora
INNER JOIN Assunto A
    ON A.IdAssunto = L.IdAssunto
ORDER BY L.NomeLivro;

-- DESAFIO 4

/*
Retorne os nomes de livros e data de publicação dos livros cujo
sobrenome do autor se inicia com a letra B.
*/

SELECT
    L.NomeLivro AS LIVRO,
    L.DataPub AS DATA,
    CONCAT(A.NomeAutor,' ',SobrenomeAutor) AS AUTOR
FROM Livro L
INNER JOIN LivroAutor LA
    ON LA.IdLivro = L.IdLivro
INNER JOIN Autor A
    ON A.IdAutor = LA.IdAutor
WHERE A.SobrenomeAutor LIKE 'B%';

-- DESAFIO 5

/*
Retorne os assuntos e sobrenome de autores de livros que custam acima de R$ 80,00.
*/

SELECT
    AA.NomeAssunto AS Assunto,
    A.SobrenomeAutor AS SobrenomeAutor
FROM LIVRO L 
INNER JOIN LivroAutor LA 
    ON LA.IdLivro = L.IdLivro
INNER JOIN Autor A
    ON A.IdAutor = LA.IdAutor
INNER JOIN Assunto AA 
    ON AA.IdAssunto = L.IdAssunto
WHERE L.PrecoLivro > 80.00;

-- DESAFIO 6

/*
Consultas preços, assuntos e nomes dos livros que custam entre R$ 70,00 e R$ 170,00,
ordenando do mais caro para o mais barato.
*/

SELECT
    L.NomeLivro AS Livro,
    A.NomeAssunto AS Assunto,
    CONCAT('R$ ',L.PrecoLivro) AS Vlr_Livro
FROM Livro L 
INNER JOIN Assunto A
    ON L.IdAssunto = A.IdAssunto
WHERE L.PrecoLivro BETWEEN 70.00 AND 170.00
ORDER BY L.PrecoLivro DESC;

