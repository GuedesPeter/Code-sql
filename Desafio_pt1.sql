USE Biblioteca;


-- ============================================================
-- 🧩 DESAFIO 1 JOINs — INNER JOIN
-- Base: Tabelas Livros, Autores, Editoras, Assuntos e LivroAutores
-- ============================================================



-- 1. Liste o nome do autor, o total de livros que ele escreveu e o nome das editoras onde publicou,
--    exibindo apenas autores que publicaram em mais de uma editora (use INNER JOIN entre todas as tabelas necessárias).

-- 2. Mostre o nome do livro, a editora, o assunto e todos os autores relacionados,
--    agrupando por livro e concatenando os nomes dos autores em uma única linha (use STRING_AGG ou equivalente).

-- 3. Exiba o nome do autor, o número total de páginas somadas de todos os seus livros e o nome do assunto mais recorrente,
--    utilizando INNER JOIN entre as tabelas e funções de agregação.

-- 4. Liste os livros que possuem mais de um autor, mostrando o nome do livro, a editora e a quantidade de autores associados.

-- 5. Mostre o nome da editora, o total de livros publicados por assunto e o preço médio desses livros,
--    usando INNER JOIN entre Livros, Editoras e Assuntos e aplicando GROUP BY com múltiplos campos.

-- 6. Exiba o nome do autor e o livro mais caro que ele escreveu, incluindo o nome da editora e o assunto do livro.
--    (Use INNER JOIN e uma subconsulta ou CTE para identificar o livro mais caro de cada autor.)

-- 7. Liste os assuntos e as editoras que publicaram livros nesses assuntos,
--    mas somente para assuntos em que o preço médio dos livros seja superior a 200.

-- 8. Mostre os 5 autores com maior número de páginas publicadas (soma das páginas de todos os livros),
--    junto com o nome da editora e do assunto do livro mais extenso que publicaram.

-- 9. Exiba o nome do livro, o autor e o assunto, apenas para livros em que o preço seja superior à média de preço
--    dos livros da mesma editora (use INNER JOIN e subconsulta correlacionada).

-- 10. Liste o nome do autor, o nome da editora e o total de livros publicados entre 2020 e 2025,
--     exibindo apenas combinações autor/editora que tenham ao menos 3 livros no período.
