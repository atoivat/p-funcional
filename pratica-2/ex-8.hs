type Data = (Int, Int, Int)

-- Livro: código, título, autor, editora, ano
type Livro = (String, String, String, String, Int)

-- Aluno = código, nome, email, telefone
type Aluno = (String, String, String, String)

-- Empréstimo = códigoLivro, códigoAluno, dataEmpres, dataDev, status
type Emprestimo = (String, String, Data, Data, String)
