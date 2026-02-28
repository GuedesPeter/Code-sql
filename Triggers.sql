USE Biblioteca;

 -- TRIGGERS [GATILHOS]

 /*
 
 Um Trigger é um tipo de procedimento armazenado [Stored Procedure] executado automaticamente
 quando um ususário realiza uma operaão de modificação de dados em uma tabela ou
 view especificada.

 As operações que podem disparar um Trigger são:

 - INSERT
 - UPDATE
 - DELETE


 TIPOS DE TRIGGERS:

 - DML Triggers (Data Manipulation Language)
 Disparados por eventos DML como INSERT, UPDATE ou DELETE.

 - DDL Triggers (Data Definition Language)
 Disparados por eventos DDL como CREATE, ALTER ou DROP.

 - LOGON Triggers
 Disparados em resposta a eventos de logon no servidor.


 MODOS DE DISPARO DE UM TRIGGER
Um Trigger no SQL Server pode ser disparado de dois modos:

- AFTER
O código presente no Trigger é executado após todas as ações
terem sido completadas na tabela especificada.

- INSTEAD OF (Ao Invés De)
O código presente no Trigger é executado no lugar da operação que causou o disparo.


 */

/*

FLUXO DE TRANSAÇÕES

1. Verificação de IDENTITY INSERT
2. Restrição (Constraints) de Nulos (NULL)
3. Checagem de tipos de dados
4. Execução de Trigger INSTEAD OF (a execução  do DML para aqui; esse Trigger não é recursivo)
5. Restrição de Chave Primária
6. Restrição CHECK
7. Restrição de Chave Estrangeira
8. Execução do DML e atualizar o Log de transações
9. Execução do Trigger AFTER
10. Commit da Transação (Confirmação)

*/

-- SINTAXE Geral de um TRIGGER

/*

CREATE [OR ALTER] TRIGGER nome_trigger
ON Tabela | VIEW
[WITH ENCRYPTION]
    AFTER | INSTEAD OF [INSERT, UPDATE, DELETE]
AS
BEGIN
    Código do TRIGGER
END;
GO

*/

-- Exemplo 1 [AFTER]: ----------------------------------------------------------

CREATE OR ALTER TRIGGER tg_editora_cadastrada
ON Editora
AFTER INSERT
AS
BEGIN
    SELECT CONCAT('Trigger disparada! Há ', COUNT(*), ' editoras cadastradas.') AS Cadastros
    FROM Editora;
END
GO

-- Teste da Trigger criada
INSERT INTO Editora VALUES('Editora - Teste Trigger');

-- Exemplo 2 [INSTEAD OF]: ----------------------------------------------------------

CREATE OR ALTER TRIGGER tg_bloqueia_autor
ON Autor 
INSTEAD OF INSERT -- [Ao invés de realizar o INSERT, exiba BEGIN ... END GO]
AS
BEGIN
    PRINT 'Cadastro de Autor Não permitido no momento!';
END
GO

-- Teste da Trigger criada
INSERT INTO Autor VALUES('Autor - Trigger', 'Teste');
SELECT * FROM Autor; 

-- Para que um novo Autor seja inserido novamente, o Trigger (tg_bloqueia_autor) deve ser desabilitado ou excluído

-- PARA DESABILITAR A TRIGGER
ALTER TABLE Autor
DISABLE TRIGGER tg_bloqueia_autor; -- DESABILITA A TRIGGER

-- PARA HABILITAR A TRIGGER NOVAMENTE
ALTER TABLE Autor
ENABLE TRIGGER tg_bloqueia_autor; -- HABILITA A TRIGGER


-- PARA EXCLUIR UM TRIGGER

DROP TRIGGER tg_bloqueia_autor;
-- Status Atual: A TRIGGER tg_bloqueia_autor ESTÁ APENAS DESABILITADA NO MOMENTO

-- VISUALIZAR OS TRIGGERS EXISTENTES -------------------------------------------

-- EM TABELAS
  EXEC sp_helptrigger @tabname=Editora;

-- NA BASE DE DADOS
SELECT * FROM sys.triggers
WHERE is_disabled = 0 OR is_disabled = 1; -- 0 [Desabilitado] | 1 [Habilitado]


-- Exemplo 3 [TRIGGER + Stored Procedure]: ----------------------------------------------------------
-- Ao disparar a Tigger executa um procedimento armazenado

-- Stored Procedure
CREATE PROCEDURE sp_consulta_autores
AS
BEGIN
    SELECT NomeAutor, SobrenomeAutor FROM Autor
    ORDER BY NomeAutor;
END 
GO

EXEC sp_consulta_autores;

-- Trigger (Será disparada após um INSERT acionando a SP que lista todos os Autores cadastrados na tabela Autor)
CREATE OR ALTER TRIGGER tg_insere_autor
ON Autor
AFTER INSERT -- Após a inserção de um novo Autor
AS
BEGIN
    EXEC sp_consulta_autores;
END
GO

-- Testando Trigger + SP
INSERT INTO Autor VALUES('Autor - ', 'Trigger + SP');