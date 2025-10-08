--  INSERIR DADOS
USE Biblioteca;

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

/*INSERT INTO Livro (NomeLivro, ISBN13, DataPub, PrecoLivro,
NumeroPaginas, IdAssunto, IdEditora)
VALUES ('A Arte da Eletrônica','9788582604342',
'20170308', 300.74, 1160, 3, 24);*/

SELECT * FROM Livro;


INSERT INTO Livro (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdAssunto, IdEditora) VALUES
('Linux Pocket Guide', '9780000000001', '20040301', 95.50, 192, 2, 10), -- Daniel Barrett
('LDAP System Administration', '9780000000002', '20030701', 84.90, 312, 3, 12), -- Gerald Carter
('The Invisible Gorilla', '9780000000003', '20100601', 72.30, 320, 4, 8), -- Mark Sobel
('Windows Server 2012 Inside Out', '9780000000004', '20130201', 110.00, 1584, 3, 9), -- William Stanek
('Linux Essentials', '9780000000005', '20120301', 89.90, 400, 2, 6), -- Christine Bresnahan
('Neuromancer', '9780000000006', '19840701', 74.99, 271, 5, 5), -- William Gibson
('Ulysses', '9780000000007', '19220701', 68.50, 730, 1, 7), -- James Joyce
('Molecules at an Exhibition', '9780000000008', '19980901', 77.00, 288, 4, 10), -- John Emsley
('Ensaio sobre a cegueira', '9780000000009', '19950425', 92.70, 312, 1, 3), -- José Saramago
('Git Pocket Guide', '9780000000010', '20130801', 99.99, 234, 3, 11), -- Richard Silverman
('The Russian Century', '9780000000011', '20010601', 82.40, 320, 6, 13), -- Robert Byrnes
('MySQL and JSP Web Applications', '9780000000012', '20030201', 69.80, 500, 7, 14), -- Jay Ts
('Java Swing', '9780000000013', '20021101', 88.60, 1248, 3, 15), -- Robert Eckstein
('The Art of Electronics', '9780000000014', '20150301', 300.74, 1225, 3, 24), -- Paul Horowitz
('The Art of Electronics', '9780000000015', '20150301', 300.74, 1225, 3, 24), -- Winfield Hill
('Murach`s Java Programming', '9780000000016', '20150801', 92.30, 800, 3, 20), -- Joel Murach
('Practical Electronics for Inventors', '9780000000017', '20130801', 106.20, 1056, 3, 18), -- Paul Scherz
('Make: Electronics', '9780000000018', '20151001', 83.90, 352, 3, 16), -- Simon Monk
('1984', '9780000000019', '19490608', 60.00, 328, 1, 1), -- George Orwell
('Se um viajante numa noite de inverno', '9780000000020', '19790101', 72.50, 296, 1, 2), -- Ítalo Calvino
('Dom Casmurro', '9780000000021', '18990101', 55.00, 256, 1, 3), -- Machado de Assis
('O homem que confundiu sua mulher com um chapéu', '9780000000022', '19850101', 89.70, 240, 2, 4), -- Oliver Sacks
('Fahrenheit 451', '9780000000023', '19531019', 78.00, 194, 1, 5), -- Ray Bradbury
('Steve Jobs', '9780000000024', '20111024', 123.45, 656, 6, 6), -- Walter Isaacson
('The Intelligent Investor', '9780000000025', '19490712', 98.00, 640, 7, 7), -- Benjamin Graham
('Vinte Mil Léguas Submarinas', '9780000000026', '18700101', 65.00, 392, 1, 8), -- Júlio Verne
('A dança do universo', '9780000000027', '20010701', 91.00, 352, 4, 9), -- Marcelo Gleiser
('Plantas do Brasil', '9780000000028', '20020301', 79.90, 464, 8, 10), -- Harri Lorenzi
('J.R.R. Tolkien: A Biography', '9780000000029', '19770101', 86.00, 368, 6, 11), -- Humphrey Carpenter
('Fundação', '9780000000030', '19510101', 95.00, 296, 5, 12), -- Isaac Asimov
('Admirável Mundo Novo', '9780000000031', '19320901', 70.00, 288, 1, 13), -- Aldous Huxley
('Um Estudo em Vermelho', '9780000000032', '18870101', 60.00, 188, 1, 14), -- Arthur Conan Doyle
('Pensées', '9780000000033', '16700101', 100.00, 416, 9, 15), -- Blaise Pascal
('O Mundo de Sofia', '9780000000034', '19910501', 88.80, 560, 1, 16), -- Jostein Gaarder
('Uma Breve História do Tempo', '9780000000035', '19880301', 110.00, 256, 4, 17), -- Stephen Hawking
('The Mismeasure of Man', '9780000000036', '19810601', 93.00, 448, 4, 18), -- Stephen Jay Gould
('Astrofísica para Apressados', '9780000000037', '20170501', 102.00, 192, 4, 19), -- Neil DeGrasse Tyson
('A Origem das Espécies', '9780000000038', '18591124', 120.00, 502, 4, 20), -- Charles Darwin
('Computing Machinery and Intelligence', '9780000000039', '19501101', 130.00, 50, 3, 21), -- Alan Turing
('2001: Uma Odisseia no Espaço', '9780000000040', '19680101', 90.00, 320, 5, 22); -- Arthur C. Clarke

-- Tabela LivroAutor
SELECT * FROM LivroAutor;

INSERT INTO LivroAutor(IdLivro, IdAutor) VALUES
(100, 1),
(101, 2),
(102, 3),
(103, 4),
(104, 5),
(105, 6),
(106, 7),
(107, 8),
(108, 9),
(109, 10),
(110, 11),
(111, 12),
(112, 13),
(113, 14),
(114, 15),
(115, 16),
(116, 17),
(117, 18),
(118, 19),
(119, 20),
(120, 21),
(121, 22),
(122, 23),
(123, 24),
(124, 25),
(125, 26),
(126, 27),
(127, 28),
(128, 29),
(129, 30),
(130, 31),
(131, 32),
(132, 33),
(133, 34),
(134, 35),
(135, 36),
(136, 37),
(137, 38),
(138, 39),
(139, 40);

-- Consultando Livro e Autor

SELECT 
    NomeLivro,
    NomeAutor,
    SobrenomeAutor
FROM Livro 
INNER JOIN LivroAutor 
    ON LivroAutor.IdLivro = Livro.IdLivro
INNER JOIN Autor
    ON Autor.IdAutor = LivroAutor.IdAutor;