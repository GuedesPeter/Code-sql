
-- CREATE DATABASE Teste;

-- Consultando os Bancos existentes
SELECT NAME FROM master.SYS.DATABASES
ORDER BY NAME;

EXEC sp_databases;

-- Selecionar o Banco de Dados desejado
USE Teste;

-- Obter informações sobre um Banco específico
EXEC sp_helpdb Teste;

-- Excluir o Database
DROP DATABASE Teste;
DROP DATABASE IF EXISTS Teste; -- Verifica se o Banco existe

-- Excluir Banco em USO
USE master
GO
ALTER DATABASE Teste SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE Teste;


