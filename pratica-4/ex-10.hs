type Data = (Int, Int, Int)
type Emprestimo = (String, String, Data, Data, String)
type Emprestimos = [Emprestimo]

bdEmprestimo::Emprestimos

bdEmprestimo = [("H123C9","BSI945",(12,9,2009),(20,09,2009),"aberto"), ("L433C5","BCC021",(01,9,2009),(10,09,2009),"encerrado"), ("M654C3","BCC008",(04,9,2009),(15,09,2009),"aberto")]

precede:: Data -> Data -> Bool
precede (d1, m1, a1) (d2, m2, a2) 
  | a1 < a2 = True
  | (a1 == a2) && (m1 < m2) = True
  | (a1 == a2) && (m1 == m2) && (d1 < d2) = True
  | otherwise = False

emDia:: Emprestimo -> Data -> Bool
emDia (codigoLivro, codigoAluno, dataEmpres, (dDev, mDev, aDev), status) (d, m, a)
  | precede (d, m, a) (dDev, mDev,aDev) = True -- Hoje está antes do dia de devolução
  | (dDev == d) && (mDev == m) && (aDev == a) = True -- Hoje é o dia da devolução
  | otherwise = False -- A devolução já passou

atrasados :: Emprestimos -> Data -> Emprestimos
atrasados lista hoje = [ x | x <- lista, not(emDia x hoje) ]