-- Cláusula CONSTREINT
-- Regras aplicadas as tabelas para garantir a integridade dos dados
-- Podem ser especificadas no momento da criação da tabela [CREATE] ou quando ocorrer uma alteração na tabela [ALTER]
/*
NOT NULL - Impede que uma coluna aceite valores NULOS
    NomeProduto VARCHAR(50) NOT NULL
UNIQUE - Garante que todos os valores de uma coluna sejam diferentes [Evita valores ou colunas duplicadas]
    NomeProduto VARCHAR(50) NOT NULL UNIQUE
CHECK - Define um conjunto de valores válidos que podem ser inserifod em uma coluna
    PrecoProduto MONEY NOT NULL CHECK(PrecoProduto > 0)
PRIMARY KEY - Identifica de forma ÚNICA cada registro em uma tabela de banco de dados
    CodProduto SMALLINT PRIMARY KEY
FOREIGN KEY - Cria relacionamento entre as tabelas [Pai-Filho] Impõe integridade referencial às tabelas
DEFAULT - Fornece um valor padrão para a coluna quando nenhum valor for especificado
    CodProduto SMALLINT DEFAULT 1520
*/

-- Exemplo de CONSTRAITS

CREATE TABLE Produtos (
    CodProduto SMALLINT PRIMARY KEY,
    NomeProduto VARCHAR(50) NOT NULL UNIQUE,
    CodFornecedor SMALLINT DEFAULT 1520,
    Validade DATE NOT NULL,
    PrecoProduto MONEY NOT NULL CHECK(PrecoProduto > 0),

    CONSTRAINT fk_id_fornecedor FOREIGN KEY (CodFornecedor)
    REFERENCES fornecedores (CodFornecedor) ON DELETE CASCADE

);
