USE Biblioteca;
-- Exercícios sobre WHERE

/* 
Tabela: Livros
*/
--1.Selecione todos os livros com preço maior que R$ 50,00.
SELECT
    NomeLivro,
    PrecoLivro
FROM Livro
WHERE PrecoLivro > 50.00;

-- 2.Liste os livros que possuem mais de 300 páginas.
SELECT
    NomeLivro,
    NumeroPaginas
FROM Livro
WHERE NumeroPaginas > 300;

-- 3.Mostre os livros publicados após o ano de 2000.
SELECT
    NomeLivro,
    DataPub
FROM Livro
WHERE YEAR(DataPub) > 2000; -- [YEAR - Função que captura somente o ano da data]

-- 4.Mostre os livros publicados antes do ano de 2020.
SELECT
    NomeLivro,
    DataPub
FROM Livro
WHERE YEAR(DataPub) < '2020';

-- 5.Selecione os livros cujo nome contenha a palavra "SQL".
SELECT
    NomeLivro
FROM Livro
WHERE NomeLivro LIKE '%SQL%';

-- 6.Liste os livros com número de páginas entre 100 e 200.
SELECT
    NomeLivro,
    NumeroPaginas
FROM Livro
WHERE NumeroPaginas BETWEEN '100' AND '200';

-- 7.Mostre os livros que foram publicados após 01/01/2004 e custam menos de R$ 100,00.
SELECT
    NomeLivro,
    DataPub,
    PrecoLivro
FROM Livro
WHERE DataPub > '2004-01-01'
AND PrecoLivro < 100.00;

-- 8.Selecione os livros onde o campo DataPub está nulo.
SELECT
    NomeLivro,
    DataPub
FROM Livro
WHERE DataPub IS NULL;

-- 9.Mostre os livros com PrecoLivro igual ou menor a 100.
SELECT
    NomeLivro,
    PrecoLivro
FROM Livro
WHERE PrecoLivro <= 100.00;

-- 10.Liste os livros que não pertencem ao assunto de IdAssunto igual a 3.
SELECT
    NomeLivro,
    IdAssunto
FROM Livro
WHERE IdAssunto <> 3;

-- 11.Exiba os livros com o ISBN13 terminando em '31'.
SELECT
    NomeLivro,
    ISBN13
FROM Livro
WHERE ISBN13 LIKE '%31';


/* 
Tabela: Autores
*/

-- 1. Selecione todos os autores com o sobrenome "Carter".
SELECT
    NomeAutor,
    SobrenomeAutor
FROM Autor
WHERE SobrenomeAutor LIKE 'Carter';

-- 2.Mostre os autores cujo nome começa com a letra "J".
SELECT
    NomeAutor,
    SobrenomeAutor
FROM Autor
WHERE NomeAutor LIKE 'J%';

-- 3.Liste os autores que não possuem "a" no nome.
SELECT 
    NomeAutor,
    SobrenomeAutor
FROM Autor
WHERE NomeAutor NOT LIKE '%a%';

-- 4.Exiba os autores com nome contendo 5 letras exatas.
SELECT
    NomeAutor
FROM Autor
WHERE LEN(NomeAutor) = 5;

-- 5.Filtre os autores com IdAutor maior que 10.
SELECT
    *
FROM Autor
WHERE IdAutor > 10;


/* 
Tabela: Editoras */

-- 1.Mostre todas as editoras com nome contendo a palavra "Novatec".
SELECT
    NomeEditora
FROM Editora
WHERE NomeEditora like '%Novatec%';

-- 2. Liste as editoras que não possuem a letra "A" no nome. 
SELECT
    NomeEditora
FROM Editora
WHERE NomeEditora NOT LIKE '%A%';

-- 3.Selecione as editoras cujo IdEditora está entre 5 e 10.
SELECT
    IdEditora,
    NomeEditora
FROM Editora
WHERE IdEditora > 5 AND IdEditora < 10;

-- 4. Mostre as editoras com nome começando com "PRENTICE".
SELECT 
* 
FROM Editora
WHERE NomeEditora LIKE '%PRENTICE%';

-- 5. Liste as editoras com NomeEditora diferente de "Prentice Hall".
SELECT
    NomeEditora
FROM Editora
WHERE NomeEditora != 'Prentice Hall'; -- <>


/* 
Tabela: Assuntos*/

-- 1. Exiba os assuntos com NomeAssunto igual a "Matemática".
SELECT
    *
FROM Assunto
WHERE NomeAssunto LIKE '%Matemática%';

-- 2.Liste todos os assuntos com nomes terminando com a letra "s".
SELECT
    NomeAssunto
FROM Assunto
WHERE NomeAssunto LIKE '%S';

-- 3.Filtre os assuntos cujo nome contém exatamente 10 caracteres.
SELECT 
    NomeAssunto
FROM Assunto
WHERE len(NomeAssunto) = 10;

-- 4.Mostre os assuntos com IdAssunto menor ou igual a 3.
SELECT
    IdAssunto,
    NomeAssunto
FROM Assunto
WHERE IdAssunto <= 3;

-- 5 .Liste os assuntos cujo nome não é "Científica".
SELECT
    NomeAssunto
FROM Assunto
WHERE NomeAssunto LIKE '%Científica%';

/* 
Tabela: LivroAutores
*/

-- 1.Selecione os registros da tabela associativa onde o IdAutor é igual a 10.
SELECT
    LA.IdAutor,
    A.NomeAutor,
    L.NomeLivro
FROM LivroAutor LA
INNER JOIN Livro L 
ON L.IdLivro = LA.IdLivro
INNER JOIN Autor A
ON A.IdAutor = LA.IdAutor
WHERE LA.IdAutor = 10;

-- 2.Mostre os registros com IdLivro maior que 20.
SELECT
    LA.IdAutor,
    A.NomeAutor,
    L.NomeLivro
FROM LivroAutor LA
INNER JOIN Livro L 
ON L.IdLivro = LA.IdLivro
INNER JOIN Autor A
ON A.IdAutor = LA.IdAutor
WHERE LA.IdLivro > 20;

-- 3.Liste todos os pares de livro e autor com IdAutor diferente de 5.
SELECT
    LA.IdAutor,
    A.NomeAutor,
    L.NomeLivro
FROM LivroAutor LA
INNER JOIN Livro L 
ON L.IdLivro = LA.IdLivro
INNER JOIN Autor A
ON A.IdAutor = LA.IdAutor
WHERE LA.IdAutor != 5;

-- 4.Filtre os registros onde o IdLivro esteja entre 110 e 115.
SELECT
    LA.IdLivro,
    A.NomeAutor,
    L.NomeLivro
FROM LivroAutor LA
INNER JOIN Livro L 
ON L.IdLivro = LA.IdLivro
INNER JOIN Autor A
ON A.IdAutor = LA.IdAutor
WHERE LA.IdLivro BETWEEN 110 AND 115;

-- 5. Mostre os registros da tabela LivroAutores onde IdAutor não está entre 103 e 108.
SELECT
    LA.IdLivro,
    A.NomeAutor,
    L.NomeLivro
FROM LivroAutor LA
INNER JOIN Livro L 
    ON L.IdLivro = LA.IdLivro
INNER JOIN Autor A
    ON A.IdAutor = LA.IdAutor
WHERE LA.IdLivro NOT BETWEEN 103 AND 108;
