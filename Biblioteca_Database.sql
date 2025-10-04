-- CRIANDO A BASE DE DADOS 
/*
    REQUISITOS:
    - Nome dos Livros
    - Nomes e Sobrenomes dos Autores
    - Nomes de Editoras
    - Categorias de Assuntos
    - Preços e Datas de Publicação dos Livros
    - Número ISBN 13 de cada obra
    - Quantidade de páginas de cada livro

    REGRAS:
    - Todo Livro terá um Nome e um ISBN cadastrados
    - Todo Autor terá um Nome e Sobrenome cadastrados
    - Os Livros podem ter mais de um Autor
    - Códigos de ID dos Livros iniciam a partir de 100
    - Toda Editora terá um nome cadastrado
    - Todo Livro pertencerá a um único assunto [Principal]
    - Todo Livro terá Preço, mas não é obrigatória a data de publicação
    - O nº de páginas de cada livro é obrigatório

    TABELAS [Modelagem]:
    O Banco Biblioteca será construído por cinco tabelas relacionadas - Quatro principais e uma associativa

    - Tabela Livros
        IdLivro
        NomeLivro
        ISBN13
        DataPub
        PrecoLivro
        NumeroPaginas
        IdEditora
        IdAssunto

    - Tabela Autores
        IdAutor
        NomeAutor
        SobrenomeAutor

    - Tabela Editoras
        IdEditora
        NomeEditora

    - Tabela Assuntos
        IdAssunto
        NomeAssunto

    - Tabela LivroAutores [Associativa]
        IdLivro
        IdAutor
*/

CREATE DATABASE Biblioteca;

USE Biblioteca;

-- Obs: Criar inicialmente as tabelas que não possuem chave estrangeira (FK)

CREATE TABLE Autor(
    IdAutor SMALLINT IDENTITY, -- (Auto Incremento)
    NomeAutor VARCHAR(50) NOT NULL,
    SobrenomeAutor VARCHAR (60) NOT NULL,

    CONSTRAINT pk_id_autor PRIMARY KEY (IdAutor)
);

sp_help Autor; -- Infos Gerais da Tabela Autor

CREATE TABLE Editora(
    IdEditora SMALLINT PRIMARY KEY IDENTITY,
    NomeEditora VARCHAR(50) NOT NULL

);

sp_help Editora; -- Infos Gerais da Tabela Editora

CREATE TABLE Assunto(
    IdAssunto TINYINT PRIMARY KEY IDENTITY,
    NomeAssunto VARCHAR(25) NOT NULL
);

sp_help Assunto; -- Infos Gerais da Tabela Assunto

CREATE TABLE Livro(
    IdLivro SMALLINT PRIMARY KEY IDENTITY(100,1), -- Iniciam em 100 adicionando de 1 em 1
    NomeLivro VARCHAR(70) NOT NULL,
    ISBN13 CHAR(13) NOT NULL UNIQUE, -- Sem repetições
    DataPub DATE,
    PrecoLivro MONEY NOT NULL,
    NumeroPaginas SMALLINT NOT NULL,
    IdEditora SMALLINT NOT NULL,
    IdAssunto TINYINT NOT NULL,

    CONSTRAINT fk_id_editora FOREIGN KEY(IdEditora) REFERENCES Editora(IdEditora) ON DELETE CASCADE,
    CONSTRAINT fk_id_assunto FOREIGN KEY(IdAssunto) REFERENCES Assunto(IdAssunto) ON DELETE CASCADE,
    CONSTRAINT verifica_preco CHECK(PrecoLivro >= 0)
);

sp_help Livro; -- Infos Gerais da Tabela Livro

CREATE TABLE LivroAutor(
    IdLivro SMALLINT NOT NULL,
    IdAutor SMALLINT NOT NULL,

    CONSTRAINT fk_id_livros FOREIGN KEY (IdLivro) REFERENCES Livro(IdLivro),
    CONSTRAINT fk_id_autores FOREIGN KEY (IdAutor) REFERENCES Autor(IdAutor),

    -- PK COMPOSTA
    CONSTRAINT pk_livro_autor PRIMARY KEY(IdLivro, IdAutor)
);

sp_help Livro; -- Infos Gerais da Tabela LivroAutor

-- LISTA AS TABELAS CRIADAS
SELECT name FROM Biblioteca.sys.tables;

