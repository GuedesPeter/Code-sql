
USE Biblioteca;

-- BACKUP E RESTAURAÇÃO DE DADOS

/*🔹 Resumo:
Os comandos BACKUP e RESTORE servem para salvar e recuperar os dados de um banco de dados.

* BACKUP DATABASE → cria uma cópia de segurança do banco e grava em um arquivo (`.bak`).
* RESTORE DATABASE → restaura o banco a partir desse arquivo de backup.

👉 `WITH FORMAT` recria o arquivo de backup do zero.
👉 `WITH REPLACE` permite sobrescrever um banco existente ao restaurar.

*/

/*

Sintaxe:

-- PARA BACKUP

    BACKUP DATABASE Nome_Banco
    TO DISK = 'Caminho do Backup/nome_do_banco.bak'
    [WHITH FORMAT];
    GO


-- PARA RESTUARAR

RESTORE DATABASE Nome_Banco
FROM DISK = 'Caminho do Backup/nome_do_banco.bak'
[WITH REPLACE];
GO

*/


-- BACKUP
-- /Users/paulopeter/Code-sql

BACKUP DATABASE Biblioteca
TO DISK = '/Users/paulopeter/Code-sql/db_Biblioteca.bak';
--[WHITH FORMAT] recria o arquivo de backup do zero.
GO


-- RESTORE

-- Excluindo o db atual [Biblioteca]

-- Troca o banco de dados atual
USE master; 
GO
-- Garante que todas as conexões ao db.Biblioteca estejam fechadas deixando um único usuário com conexão a ele
ALTER DATABASE Biblioteca 
SET single_user WITH ROLLBACK IMMEDIAT; 
GO
-- Apaga o db.Biblioteca
DROP DATABASE Biblioteca; 
GO

-- Restaurando o db.Biblioteca

RESTORE DATABASE Biblioteca
FROM DISK = '/Users/paulopeter/Code-sql/db_Biblioteca.bak';
--[WHITH REPLACE] permite sobrescrever um banco existente ao restaurar.
GO


-- Verificando os processos executados acima
USE Biblioteca;

SELECT
*
FROM Livro;

