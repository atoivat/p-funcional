type Data = (Int, Int, Int)

precede:: Data -> Data -> Bool
precede (d1, m1, a1) (d2, m2, a2) 
  | a1 < a2 = True
  | (a1 == a2) && (m1 < m2) = True
  | (a1 == a2) && (m1 == m2) && (d1 < d2) = True
  | otherwise = False

-- Empréstimo = códigoLivro, códigoAluno, dataEmpres, dataDev, status
type Emprestimo = (String, String, Data, Data, String)

e1:: Emprestimo
e1 = ("H123C9", "BSI200945", (12, 9, 2009), (20, 9, 2009), "aberto")


emDia:: Emprestimo -> Data -> Bool
emDia (codigoLivro, codigoAluno, dataEmpres, (dDev, mDev, aDev), status) (d, m, a)
  | precede (d, m, a) (dDev, mDev,aDev) = True -- Hoje está antes do dia de devolução
  | (dDev == d) && (mDev == m) && (aDev == a) = True -- Hoje é o dia da devolução
  | status /= "aberto" = True -- A devolução já passou e o livro já foi devolvido
  | otherwise = False -- A devolução já passou e o livro não foi devolvido


