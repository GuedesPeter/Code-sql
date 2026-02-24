/*
===========================================================
EXERCÍCIOS – CRIAÇÃO DE STORED PROCEDURES
Baseado nas tabelas: Autor, Editora, Assunto, Livro e LivroAutor
===========================================================

1) Criar uma procedure chamada sp_InserirAutor que:
   - Receba NomeAutor e SobrenomeAutor.
   - Insira um novo registro na tabela Autor.

2) Criar uma procedure chamada sp_InserirEditora que:
   - Receba NomeEditora.
   - Insira um novo registro na tabela Editora.

3) Criar uma procedure chamada sp_InserirAssunto que:
   - Receba NomeAssunto.
   - Insira um novo registro na tabela Assunto.

4) Criar uma procedure chamada sp_InserirLivro que:
   - Receba NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas,
     IdEditora e IdAssunto.
   - Insira um novo registro na tabela Livro.

5) Criar uma procedure chamada sp_VincularLivroAutor que:
   - Receba IdLivro e IdAutor.
   - Insira o relacionamento na tabela LivroAutor.

6) Criar uma procedure chamada sp_ListarAutores que:
   - Liste todos os autores.
   - Ordene pelo SobrenomeAutor.

7) Criar uma procedure chamada sp_ListarLivrosPorEditora que:
   - Receba IdEditora.
   - Liste todos os livros dessa editora.

8) Criar uma procedure chamada sp_ListarLivrosPorAssunto que:
   - Receba IdAssunto.
   - Liste todos os livros relacionados ao assunto informado.

9) Criar uma procedure chamada sp_ListarLivrosComAutores que:
   - Liste NomeLivro, NomeAutor e SobrenomeAutor.
   - Utilize JOIN entre Livro, LivroAutor e Autor.

10) Criar uma procedure chamada sp_BuscarLivroPorISBN que:
    - Receba ISBN13.
    - Retorne todos os dados do livro correspondente.

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

===========================================================
FIM DOS EXERCÍCIOS
===========================================================
*/