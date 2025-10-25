USE Biblioteca;

-- ============================================================
-- 🧩 EXERCÍCIOS DE PRÁTICA — CLAÚSULA UNION (SQL SERVER)
-- Base: Tabelas Livros, Autores, Editoras, Assuntos e LivroAutores
-- ============================================================

/* 1. Liste todos os nomes de autores e nomes de editoras juntos. */

SELECT  
    CONCAT(NomeAutor,' ',SobrenomeAutor ) AS Nome, 'Autor' AS Tipo FROM Autor
UNION
SELECT 
    NomeEditora AS Nome, 'Editora' AS Tipo FROM Editora;

/* 2. Crie uma lista combinada com nomes de autores e nomes de livros. */

SELECT 
    CONCAT(NomeAutor,' ',SobrenomeAutor ), 'Autor' AS Tipo FROM Autor
UNION
SELECT
    NomeLivro AS Nome, 'Livro' AS Tipo FROM Livro;

/* 3. Mostre todos os nomes de editoras e nomes de assuntos em uma mesma lista. */

SELECT
    NomeEditora AS Nome, 'Editora' AS Tipo FROM Editora
UNION
SELECT
    NomeAssunto AS Nome, 'Assunto' AS Tipo FROM Assunto;

/* 4. Exiba os nomes de autores, editoras e livros em um único conjunto de resultados. */

SELECT 
    NomeAutor AS Nome, 'Autor' AS Tipo FROM Autor
UNION
SELECT
    NomeEditora AS Nome, 'Editora' AS Tipo FROM Editora
UNION
SELECT
    NomeLivro AS Nome, 'Livro' AS Tipo FROM Livro;

/* 5. Exiba o nome e o tipo de origem (Autor ou Editora) em colunas separadas. */

SELECT 
    CONCAT(NomeAutor, ' ', SobrenomeAutor) AS Nome, 
    'Autor' AS Tipo
FROM Autor

UNION

SELECT 
    NomeEditora AS Nome, 
    'Editora' AS Tipo
FROM Editora;


/* 6. Combine nomes de autores, editoras e livros, adicionando uma coluna “Tipo”. */

SELECT 
    CONCAT(NomeAutor, ' ', SobrenomeAutor) AS Nome, 
    'Autor' AS Tipo
FROM Autor

UNION

SELECT 
    NomeEditora AS Nome, 
    'Editora' AS Tipo
FROM Editora

UNION

SELECT 
    NomeLivro AS Nome, 
    'Livro' AS Tipo
FROM Livro;

/* 7. Liste autores e editoras, mas mantenha todas as duplicatas (use UNION ALL). */

SELECT
    CONCAT(NomeAutor, ' ',SobrenomeAutor) AS Nome,
    'Autor' AS Tipo
FROM Autor

UNION ALL

SELECT
    NomeEditora AS Nome,
    'Editora' AS Tipo
FROM Editora;

/* 8. Crie uma lista única com nomes de autores, editoras, livros e assuntos. */

SELECT
    NomeLivro AS NOME,
    'Livro' AS Tipo
FROM Livro

UNION

SELECT
    NomeAutor AS NOME,
    'Autor' AS Tipo
FROM Autor

UNION

SELECT
    NomeEditora AS NOME,
    'Editora' AS Tipo
FROM Editora

UNION

SELECT
    NomeAssunto AS NOME,
    'Assunto' AS Tipo
FROM Assunto;

/* 9. Mostre apenas autores e editoras cujo nome começa com a letra “A”. */

SELECT
    CONCAT(NomeAutor,' ',SobrenomeAutor)AS Nome,
    'Autor' AS Tipo
FROM Autor
WHERE NomeAutor LIKE 'A%'

UNION

SELECT
    NomeEditora AS Nome,
    'Editora' AS Tipo
FROM Editora
WHERE NomeEditora LIKE 'A%';

/* 10. Liste os 10 primeiros autores e os 10 primeiros livros em um único conjunto. */

SELECT TOP 10
    CONCAT(NomeAutor,' ',SobrenomeAutor) AS NOME,
    'Autor' AS Tipo
FROM Autor

UNION

SELECT TOP 10
    NomeLivro AS NOME,
    'Livro' AS Tipo
FROM Livro;

/* 11. Crie uma nova tabela chamada DataSet contendo nomes e tipos (Autor/Editora). */

SELECT
    CONCAT(NomeAutor,' ',SobrenomeAutor) AS NOME,
    'Autor' AS Tipo
INTO DataSet
FROM Autor

UNION

SELECT
    NomeEditora AS NOME,
    'Editora' AS Tipo
FROM Editora;

SELECT * FROM DataSet; -- Visualiza a Tabela criada [DataSet]
DROP TABLE DataSet; -- Apaga a Tabela criada [DataSet]

/* 12. Liste autores e editoras cujos nomes contenham a palavra “Edit”. */

SELECT 
    CONCAT(NomeAutor,' ',SobrenomeAutor) AS NOME,
    'Autor' AS Tipo
FROM Autor
WHERE NomeAutor LIKE '%Edit%'

UNION 

SELECT
    NomeEditora AS NOME,
    'Editora' AS Tipo
FROM Editora
WHERE NomeEditora LIKE '%Edit%';

/* 13. Combine nomes de autores e editoras e ordene o resultado alfabeticamente. */

SELECT 
    CONCAT(NomeAutor,' ',SobrenomeAutor) AS NOME,
    'Autor' AS Tipo
FROM Autor

UNION 

SELECT
    NomeEditora AS NOME,
    'Editora' AS Tipo
FROM Editora

ORDER BY NOME ASC; -- Uilizar o alias comum entre as consultas para realizar a ordenação.


/* 14. Exiba nomes e tipos de autores e editoras utilizando UNION ALL. */

SELECT
    CONCAT(NomeAutor,' ', SobrenomeAutor) AS NOME,
    'Autor' AS Tipo
FROM Autor

UNION ALL

SELECT 
    NomeEditora AS NOME,
    'Editora' AS Tipo
FROM Editora;

/* 15. Combine nomes de autores e livros concatenando o tipo no nome. */

SELECT
    CONCAT(NomeAutor,' ',SobrenomeAutor,' - Autor') AS NOME
FROM Autor

UNION

SELECT
    CONCAT(NomeLivro,' - ', 'Livro') AS NOME
FROM Livro;

/* 16. Liste todos os nomes distintos de autores, editoras, livros e assuntos. */
SELECT DISTINCT
    NomeLivro AS NOME,
    'Livro' AS Tipo
FROM Livro

UNION

SELECT DISTINCT
    NomeAutor AS NOME,
    'Autor' AS Tipo
FROM Autor

UNION

SELECT DISTINCT
    NomeEditora AS NOME,
    'Editora' AS Tipo
FROM Editora

UNION

SELECT DISTINCT
    NomeAssunto AS NOME,
    'Assunto' AS Tipo
FROM Assunto;


/* 17. Combine autores e editoras garantindo que as colunas possuam o mesmo nome. */

SELECT
    CONCAT(NomeAutor,' ',SobrenomeAutor) AS NOME,
    'Autor' AS NOME
FROM Autor
    
UNION

SELECT
    NomeEditora AS Editora,
    'Editora' AS NOME
FROM Editora;

/* 18. Liste nomes de livros e assuntos em uma única coluna chamada “Nome”. */

SELECT
    CONCAT(NomeLivro,' (Livro)') AS NOME
FROM Livro

UNION

SELECT 
    CONCAT(NomeAssunto, ' (Assunto)') AS NOME
FROM Assunto;

/* 19. Mostre os cinco primeiros autores e as cinco primeiras editoras em conjunto. */

SELECT TOP 5
    CONCAT(NomeAutor,' ',SobrenomeAutor, ' (Autor)') AS NOME
FROM Autor

UNION

SELECT TOP 5
    CONCAT(NomeEditora, ' (Editora)') AS NOME
FROM Editora;

/* 20. Combine todas as tabelas (Autores, Editoras, Livros e Assuntos),
       exibindo o nome e o tipo de origem para cada registro. */

SELECT
    NomeLivro AS NOME,
    'Livro' AS Tipo
FROM Livro

UNION

SELECT
    NomeAutor AS NOME,
    'Autor' AS Tipo
FROM Autor

UNION

SELECT
    NomeEditora AS NOME,
    'Editora' AS Tipo
FROM Editora

UNION

SELECT
    NomeAssunto AS NOME,
    'Assunto' AS Tipo
FROM Assunto;
