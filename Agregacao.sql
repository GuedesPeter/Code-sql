USE Biblioteca;


-- FUNÇÕES DE AGREGAÇÃO [MIN - MAX - AVG - SUM - COUNT]

-- É uma função SQL que opera em um conjunto de valores para retornar um valor único

-- Ex.:

-- Contar a qtde de Autores

SELECT
    COUNT(*) AS TOTAL-- Conta o total de linhas
FROM Autor;

-- Obter o valor mais alto na tabela de Livros

SELECT
    MAX(PrecoLivro) AS Mais_Caro
FROM Livro;

-- Obter o menor número de páginas

SELECT
    MIN(NumeroPaginas) AS Menos_peginas
FROM Livro;

-- Obter a média de valor dos Livros
-- [ROUND - retorna apenas 2 casas decimais após a ',']
SELECT
    ROUND(AVG(PrecoLivro),2) AS Media_Preco
FROM Livro;

-- Obter a soma total do valor dos Livros

SELECT
    ROUND(SUM(PrecoLivro),2) AS Valor_Total
FROM Livro;

-- Aplicando Filtros

SELECT
    COUNT(*) AS TOTAL
FROM Livro
WHERE IdAssunto = 1;

-- Cálculo

SELECT
    ROUND(SUM(PrecoLivro) / COUNT(*),2) AS Preco_Medio
FROM Livro;

-- Retornando mais informações [SubQuery]

SELECT DISTINCT
    NomeLivro,
    PrecoLivro
FROM Livro
WHERE PrecoLivro = (
    SELECT 
    MAX(PrecoLivro)
    FROM Livro
);