USE Biblioteca;

-- Exclusão de registros(Linhas): DELETE FROM
/*
Sintaxe:

    DELETE FROM Tabela
    WHERE coluna = valor;
*/

-- Obs: UTILIZAR SEMPRE A CLAUSULA WHERE EM OPERAÇÕES DESTE TIPO (DELETE)

-- Ex.:

SELECT * FROM Assunto;

INSERT INTO Assunto (NomeAssunto)
VALUES ('Infantil');


DELETE FROM Assunto
WHERE IdAssunto  = 23; -- Utilizar a PK para realizar a exclusão

