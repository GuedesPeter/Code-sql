--  INSERIR DADOS

/*
Sintaxe:

    INSERT INTO Tabela (Coluna1, Coluna2, ...)
    VALUES (Valor1, Valor2, ...);
*/

-- Tabela de Assunto
INSERT INTO Assunto (NomeAssunto)
VALUES 
('Ficção Científica'),('Botânica'), -- Cada ('') representa uma linha inserindo 1 dado por linha
('Eletrônica'),('Matemática'),
('Aventura'),('Romance'),
('Finanças'),('Gastronomia'),
('Terror'),('Administração'),
('Informática'),('Suspense');

SELECT * FROM Assunto;

-- Tabela de Editora
INSERT INTO Editora (NomeEditora)
VALUES
('Prentice Hall'), -- Cada ('') representa uma linha inserindo 1 dado por linha
('O`Reilly');

SELECT * FROM Editora;

INSERT INTO Editora (NomeEditora)
VALUES
('Aleph'), ('Microsoft Press'), -- Cada ('') representa uma linha inserindo 1 dado por linha
('Wiley'), ('HarperCollins'),
('Érica'), ('Novatec'),
('McGraw-Hill'), ('Apress'),
('Francisco Alves'), ('Sybex'),
('Globo'), ('Companhia das Letras'),
('Morro Branco'), ('Penguin Books'), ('Martin Claret'),
('Record'), ('Springer'), ('Melhoramentos'),
('Oxford'), ('Taschen'), ('Ediouro'),('Bookman');

SELECT * FROM Editora;

-- Tabela de Autores
INSERT INTO Autor(NomeAutor, SobrenomeAutor)
VALUES ('Umberto','Eco');

SELECT * FROM Autor;

INSERT INTO Autor(NomeAutor, SobrenomeAutor)
VALUES
('Daniel','Barret'),('Gerald','Carter'),('Mark','Sobel'), -- Cada () possui um conjunto de dados Nome e Sobrenome
('William','Stanek'),('Christine','Bresnahan'),('William','Gibson'),
('James','Joyce'),('John','Emsley'),('José','Saramago'),
('Richard','Silverman'),('Robert','Byrnes'),('Jay','Ts'),
('Robert','Eckstein'),('Paul','Horowitz'),('Winfield','Hill'),
('Joel','Murach'),('Paul','Scherz'),('Simon','Monk'),
('George','Orwell'),('Ítalo','Calvino'),('Machado','de Assis'),
('Oliver','Sacks'),('Ray','Bradbury'),('Walter','Isaacson'),
('Benjamin','Graham'),('Júlio','Verne'),('Marcelo','Gleiser'),
('Harri','Lorenzi'),('Humphrey','Carpenter'),('Isaac','Asimov'),
('Aldous','Huxley'),('Arthur','Conan Doyle'),('Blayse','Pascal'),
('Jostein','Gaarder'),('Stephen','Hawking'),('Stephen','Jay Gould'),
('Neil','De Grasse Tyson'),('Charles','Darwin'),('Alan','Turing'),
('Arthur','C. Clarke');

SELECT * FROM Autor;

-- Tabela de Livros

INSERT INTO Livro (NomeLivro, ISBN13, DataPub, PrecoLivro,
NumeroPaginas, IdAssunto, IdEditora)
VALUES ('A Arte da Eletrônica','9788582604342',
'20170308', 300.74, 1160, 3, 24);

SELECT * FROM Livro;

