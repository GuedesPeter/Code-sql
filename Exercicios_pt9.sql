USE Biblioteca;

/*
===========================================================
EXERCÍCIOS – CRIAÇÃO DE STORED PROCEDURES
Baseado nas tabelas: Autor, Editora, Assunto, Livro e LivroAutor
===========================================================

11) Criar uma procedure chamada sp_AtualizarPrecoLivro que:
    - Receba IdLivro e NovoPreco.
    - Atualize o preço do livro.

12) Criar uma procedure chamada sp_AtualizarDataPublicacao que:
    - Receba IdLivro e NovaData.
    - Atualize a DataPub.

13) Criar uma procedure chamada sp_AtualizarNomeEditora que:
    - Receba IdEditora e NovoNome.
    - Atualize o nome da editora.

14) Criar uma procedure chamada sp_AtualizarNomeAutor que:
    - Receba IdAutor, NovoNome e NovoSobrenome.
    - Atualize os dados do autor.

15) Criar uma procedure chamada sp_ExcluirAutor que:
    - Receba IdAutor.
    - Exclua o autor.
    - Trate erro caso esteja vinculado a algum livro.

16) Criar uma procedure chamada sp_ExcluirLivro que:
    - Receba IdLivro.
    - Exclua o livro informado.

17) Criar uma procedure chamada sp_ExcluirEditora que:
    - Receba IdEditora.
    - Exclua a editora (considerando ON DELETE CASCADE).

18) Criar uma procedure chamada sp_InserirLivroComValidacao que:
    - Receba os dados do livro.
    - Verifique se o ISBN já existe.
    - Verifique se o preço é maior ou igual a zero.
    - Retorne mensagem de sucesso ou erro.

19) Criar uma procedure chamada sp_ListarLivrosPorFaixaDePreco que:
    - Receba PrecoMin e PrecoMax.
    - Liste os livros dentro da faixa informada.

20) Criar uma procedure chamada sp_RelatorioCompletoLivro que:
    - Receba IdLivro.
    - Retorne:
        * NomeLivro
        * ISBN13
        * NomeEditora
        * NomeAssunto
        * Nome e Sobrenome dos autores
        * PrecoLivro
        * NumeroPaginas
    - Utilize JOIN entre Livro, Editora, Assunto, LivroAutor e Autor.

*/

--1) Criar uma procedure chamada sp_InserirAutor que:
--  - Receba NomeAutor e SobrenomeAutor.
--  - Insira um novo registro na tabela Autor.

CREATE PROCEDURE sp_InserirAutor(
    @NomeAutor VARCHAR(50),
    @SobrenomeAutor VARCHAR(50)
)
AS
BEGIN
    INSERT INTO Autor(NomeAutor , SobrenomeAutor)
    VALUES (@NomeAutor,@SobrenomeAutor);
END
GO

EXEC sp_InserirAutor 'Ian', 'Goodfellow';

--2) Criar uma procedure chamada sp_InserirEditora que:
-- - Receba NomeEditora.
-- - Insira um novo registro na tabela Editora.

CREATE  PROCEDURE sp_InserirEditora(
    @NomeEditora VARCHAR(50)
)
AS
BEGIN
    INSERT INTO Editora (NomeEditora)
    VALUES (@NomeEditora);
END
GO

EXEC sp_InserirEditora 'MIT Press';

--3) Criar uma procedure chamada sp_InserirAssunto que:
--   - Receba NomeAssunto.
--  - Insira um novo registro na tabela Assunto.

ALTER PROCEDURE sp_InserirAssunto(
    @NomeAssunto VARCHAR(50)
)
AS
BEGIN
    INSERT INTO Assunto(NomeAssunto)
    VALUES (@NomeAssunto);
END
GO

EXEC sp_InserirAssunto 'Deep Learning';

--4) Criar uma procedure chamada sp_InserirLivro que:
--   - Receba NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas,
--   - IdEditora e IdAssunto.
--   - Insira um novo registro na tabela Livro.

CREATE PROCEDURE sp_InserirLivro(
    @NomeLivro VARCHAR(50),
    @ISBN13 VARCHAR(50),
    @DataPub DATE,
    @PrecoLivro MONEY,
    @NumeroPaginas SMALLINT,
    @IdEditora SMALLINT,
    @IdAssunto TINYINT
)
AS
BEGIN
    INSERT INTO Livro(NomeLivro,ISBN13,DataPub,PrecoLivro,NumeroPaginas,IdEditora,IdAssunto)
    VALUES (@NomeLivro,@ISBN13,@DataPub,@PrecoLivro,@NumeroPaginas,@IdEditora,@IdAssunto)
END
GO

EXEC sp_InserirLivro 'Deep Learning', '9780000000041','2016-01-01', 200.00, 450, 102, 32;

--5) Criar uma procedure chamada sp_VincularLivroAutor que:
--   - Receba IdLivro e IdAutor.
--   - Insira o relacionamento na tabela LivroAutor.

CREATE PROCEDURE sp_VincularLivroAutor(
    @IdLivro SMALLINT,
    @IdAutor SMALLINT
)
AS
BEGIN
    INSERT INTO LivroAutor(IdLivro,IdAutor)
    VALUES (@IdLivro,@IdAutor);
END
GO

EXEC sp_VincularLivroAutor 201, 102;

--6) Criar uma procedure chamada sp_ListarAutores que:
--   - Liste todos os autores.
--   - Ordene pelo SobrenomeAutor.

CREATE PROCEDURE sp_ListarAutores
AS
BEGIN
    SELECT * FROM Autor
    ORDER BY SobrenomeAutor;
END
GO

EXEC sp_ListarAutores;

--7) Criar uma procedure chamada sp_ListarLivrosPorEditora que:
--  - Receba IdEditora.
--  - Liste todos os livros dessa editora.

CREATE PROCEDURE sp_ListarLivrosPorEditora(
    @IdEditora SMALLINT
)
AS
BEGIN
    SELECT L.NomeLivro,E.NomeEditora FROM Livro L
    JOIN Editora E ON E.IdEditora = L.IdEditora
    WHERE L.IdEditora = @IdEditora;
END
GO

EXEC sp_ListarLivrosPorEditora 14;

--8) Criar uma procedure chamada sp_ListarLivrosPorAssunto que:
--   - Receba IdAssunto.
--   - Liste todos os livros relacionados ao assunto informado.

CREATE PROCEDURE sp_ListarLivrosPorAssunto(
    @IdAssunto TINYINT
)
AS
BEGIN
    SELECT L.NomeLivro,A.NomeAssunto FROM Livro L
    JOIN Assunto A ON A.IdAssunto = L.IdAssunto
    WHERE L.IdAssunto = @IdAssunto;
END
GO

EXEC sp_ListarLivrosPorAssunto 5;

--9) Criar uma procedure chamada sp_ListarLivrosComAutores que:
--  - Liste NomeLivro, NomeAutor e SobrenomeAutor.
--  - Utilize JOIN entre Livro, LivroAutor e Autor.

CREATE PROCEDURE sp_ListarLivrosComAutores(
    @IdLivro SMALLINT
)
AS
BEGIN
    SELECT L.NomeLivro, CONCAT(A.NomeAutor, ' ',A.SobrenomeAutor) AS Autor 
    FROM Livro L
    JOIN LivroAutor LA ON LA.IdLivro = L.IdLivro
    JOIN Autor A ON A.IdAutor = LA.IdAutor
    WHERE L.IdLivro = @IdLivro;
END
GO

EXEC sp_ListarLivrosComAutores 100;

--10) Criar uma procedure chamada sp_BuscarLivroPorISBN que:
--    - Receba ISBN13.
--    - Retorne todos os dados do livro correspondente.

CREATE PROCEDURE sp_BuscarLivroPorISBN(
    @ISBN13 VARCHAR(50)
)
AS
BEGIN
    SELECT * FROM Livro
    WHERE ISBN13 = @ISBN13;
END
GO

EXEC sp_BuscarLivroPorISBN '9780000000005';
