Use Biblioteca;

-- Gerenciando Tabelas [ALTER - DROP - RENAME]

-- ALTER TABLE NomeTabela
-- ADD / ALTER / DROP Objeto;

-- Adicionar coluna de teste na Tabela de Livros

ALTER TABLE Livro
ADD Edicao SMALLINT;

-- Altera o tipo de dado de uma coluna

ALTER TABLE Livro
ALTER COLUMN Edicao TINYINT;

-- Adiciona PRIMARY KEY

ALTER TABLE Livro
ADD PRIMARY KEY(Coluna);

-- Excluir a CONSTRAINT de uma Coluna

ALTER TABLE Livro
DROP CONSTRAINT NomeCONSTRAINT;

-- Verificar Nome das CONSTRAINTS

sp_help Livro; -- Coluna ConstraintName

-- Excluir uma Coluna de uma Tabela
ALTER TABLE Livro
DROP COLUMN Edicao;

-- EXCLUIR UMA TABELA

DROP TABLE NomeTabela;

-- RENOMEAR UMA TABELA

sp_rename 'Nome_Atual_da_TAbela', 'Novo_Nome_da_Tabela';

