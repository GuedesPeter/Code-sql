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



