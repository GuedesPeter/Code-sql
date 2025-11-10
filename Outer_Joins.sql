USE Biblioteca;

/*
=============================================================
🔍 EXPLICAÇÃO SOBRE OUTER JOINS EM SQL
=============================================================

Um OUTER JOIN é usado para combinar registros de duas tabelas
e também incluir as linhas que **não possuem correspondência**
na outra tabela.

Existem três tipos principais de OUTER JOIN:

-------------------------------------------------------------
1️⃣ LEFT OUTER JOIN (ou apenas LEFT JOIN)
-------------------------------------------------------------
- Retorna **todas as linhas da tabela à esquerda (LEFT)**,
  e as correspondentes da tabela à direita (RIGHT).
- Se não houver correspondência, os valores da tabela à
  direita aparecem como NULL.

📘 Exemplo:
SELECT *
FROM clientes AS c
LEFT JOIN pedidos AS p
  ON c.id_cliente = p.id_cliente;

-- 🔸 Mostra todos os clientes, mesmo os que não têm pedidos.

-------------------------------------------------------------
2️⃣ RIGHT OUTER JOIN (ou apenas RIGHT JOIN)
-------------------------------------------------------------
- Retorna **todas as linhas da tabela à direita (RIGHT)**,
  e as correspondentes da tabela à esquerda (LEFT).
- Se não houver correspondência, os valores da tabela à
  esquerda aparecem como NULL.

📘 Exemplo:
SELECT *
FROM clientes AS c
RIGHT JOIN pedidos AS p
  ON c.id_cliente = p.id_cliente;

-- 🔸 Mostra todos os pedidos, mesmo que não haja cliente
--    correspondente (situação rara, mas possível em dados ruins).

-------------------------------------------------------------
3️⃣ FULL OUTER JOIN
-------------------------------------------------------------
- Retorna **todas as linhas de ambas as tabelas**,
  com correspondências quando houver.
- Onde não há correspondência, os valores da tabela oposta
  aparecem como NULL.

📘 Exemplo:
SELECT *
FROM clientes AS c
FULL OUTER JOIN pedidos AS p
  ON c.id_cliente = p.id_cliente;

-- 🔸 Mostra todos os clientes e todos os pedidos,
--    combinando quando possível e preenchendo com NULLs
--    quando não houver correspondência.

-------------------------------------------------------------
📊 RESUMO VISUAL:

 LEFT JOIN:   [TABELA ESQUERDA] + correspondências + NULLs à direita
 RIGHT JOIN:  [TABELA DIREITA]  + correspondências + NULLs à esquerda
 FULL JOIN:   [AMBAS AS TABELAS] + todos os dados + NULLs onde faltar

=============================================================
*/


-- Ex.:

SELECT *
FROM Livro L -- TABELA DA ESQUERDA
LEFT JOIN Editora E -- TABELA DA DIREITA
ON E.IdEditora = L.IdEditora;


SELECT *
FROM Editora E -- TABELA DA ESQUERDA
LEFT JOIN Livro L -- TABELA DA DIREITA
ON E.IdEditora = L.IdEditora;


SELECT *
FROM Livro L -- TABELA DA ESQUERDA
RIGHT JOIN Editora E -- TABELA DA DIREITA
ON E.IdEditora = L.IdEditora;


SELECT *
FROM Editora E -- TABELA DA ESQUERDA
RIGHT JOIN Livro L -- TABELA DA DIREITA
ON E.IdEditora = L.IdEditora;



SELECT *
FROM Livro L -- TABELA DA ESQUERDA
FULL JOIN Editora E -- TABELA DA DIREITA
ON E.IdEditora = L.IdEditora;


SELECT *
FROM Editora E -- TABELA DA ESQUERDA
FULL JOIN Livro L -- TABELA DA DIREITA
ON E.IdEditora = L.IdEditora;


