USE Biblioteca;

-- PROCEDIMENTOS ARMAZENADOS (Stored Procedures)

/*
Definição:
- São lotes de declarações SQL executadas como uma subrotina;
- Permitem centralizar a lógica de acesso aos dados em um único local,
facilitando a manutenção e otimização do c[odigo;
- Usadas para validação de dados, controle de acesso,
execução de declarações complexas ou outras execuções;
- Possibilita o ajuste de permissões de acesso aos usuários,
definindo quem pode (ou Não) executá-las.

Sintaxe:

CREATE PROCEDURE nome_procedimento
(
    @Parâmetro Tipo_dados, ...
)
AS
[BEGIN]
    Bloco de códigos
[END]
GO

*/

-- EXECUÇÃO

/*
Para executar o Stored Procedure utilizamos a palavra-chave EXECUTE ou EXEC

Exemplo:

EXEC sp_teste @NomeAutor = 'John';

Obs: É recomendado utilizar o prefixo [sp] para auxiliar na identificação da Stored Procedure.
*/

-------------------------------------------------------------
-- Ex1.:

-- Criação

CREATE PROCEDURE sp_teste
AS
SELECT 'Criando Stored Procedure [SP]' AS Nome;

-- Execução

EXEC sp_teste;


-------------------------------------------------------------
--Ex2.:
-- Realiza uma consulta que traz o Nome e preço da tabela de Livros.

-- Criação

CREATE PROCEDURE sp_LivroValor
AS
BEGIN
    SELECT NomeLivro AS Titulo,
    PrecoLivro AS Valor
    FROM Livro;
END
GO

-- Execução

EXEC sp_LivroValor;

-------------------------------------------------------------
-- Ex3.:
-- ALTERANDO A Stored Procedure

ALTER PROCEDURE sp_LivroValor
AS
BEGIN
    SELECT 
    NomeLivro AS Titulo,
    PrecoLivro AS Valor
    FROM Livro
    WHERE PrecoLivro >= 150.00;
END
GO


EXEC sp_LivroValor;
-------------------------------------------------------------

-- VISUALIZANDO CONTEUDO DO Stored Procedure

EXEC sp_helptext sp_LivroValor;
-------------------------------------------------------------
-- OCULTANDO CONTEUDO DO Stored Procedure

CREATE PROCEDURE sp_LivroISBN13
WITH ENCRYPTION -- Criptografa o conteúdo do [SP]
AS
BEGIN
    SELECT 
    NomeLivro AS Titulo,
    ISBN13
    FROM Livro;
END
GO

-- Execução
EXEC sp_LivroISBN13;

-- Validação da visualização do conteúdo do [SP]
EXEC sp_helptext sp_LivroISBN13;
-------------------------------------------------------------

-- RENOMEANDO Stored Procedure [NÃO RECOMENDADO UTILIZAR]
-- IDEAL É EXCLUIR E CRIAR UM NOVO [SP]

EXEC sp_rename 'NOME_ATUAL', 'NOVO_NOME';
-------------------------------------------------------------

-- PARÂMETROS DE ENTRADA

ALTER PROCEDURE sp_teste (@param1 AS INT)
AS
SELECT CONCAT('Valor: ',@param1) AS Valor;

--
EXEC sp_teste 100;

-------

ALTER PROCEDURE sp_LivroValor (
    @ID SMALLINT
)
AS
BEGIN
    SELECT 
    NomeLivro AS Titulo,
    PrecoLivro AS Valor
    FROM LIVRO
    WHERE IdLivro = @ID;
END
GO

--
EXEC sp_LivroValor 105;

-- Multiplos parametros
-- [Respeitar sempre a ordem dos parametros]

ALTER PROCEDURE sp_teste(
    @param1 AS VARCHAR(70),
    @param2 AS INT,
    @param3 AS VARCHAR(20)
)
AS
SELECT @param1 AS 'Endereço',
@param2 AS 'Número',
@param3 AS 'Complemento';

--
EXEC sp_teste 'Rua Nadir Gomes Guedes',230, 'Casa';