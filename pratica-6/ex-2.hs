-- A
type Data = (Int, Int, Int)

valida::Data->Bool
valida (d,m,a) =
    let
        multiplo400 n = (mod n 400 == 0)
        multiplo4 n = (mod n 4 == 0)
        naomultiplo100 n = (mod n 100 /= 0)
        bissexto n = (multiplo400 n ||  multiplo4 n  && naomultiplo100 n)
        mes31dias = (m == 1 || m == 3 || m == 5 ||m == 7 || m == 8 || m == 10 || m == 12)
        mes30dias = (m == 4 || m == 6 || m == 9 ||m == 11)
        fev28dias = m == 2 && not (bissexto a)
        fev29dias = m == 2 && (bissexto a)
    in 
        case() of
        _ | d >= 1 && d <= 31 && mes31dias -> True
          | d >= 1 && d <= 30 && mes30dias -> True
          | d >= 1 && d <= 28 && fev28dias -> True
          | d >= 1 && d <= 29 && fev29dias -> True
          | otherwise                      -> False


-- B
bissextos :: [Integer] -> [Integer]
bissextos x = 
    let
        multiplo400 n = (mod n 400 == 0)
        multiplo4 n = (mod n 4 == 0)
        naomultiplo100 n = (mod n 100 /= 0)
        bissexto n = (multiplo400 n ||  multiplo4 n  && naomultiplo100 n)
    in
        [ n | n <- x, bissexto n]


-- C
type Emprestimo = (String, String, Data, Data, String)
type Emprestimos = [Emprestimo]

atrasados :: Emprestimos -> Data -> Emprestimos
atrasados lista hoje = 
    let
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
    in
        [ x | x <- lista, not(emDia x hoje) ]


-- D
fibo2 :: Integer -> (Integer, Integer)
fibo2 1 = (1, 1)
fibo2 x = 
    let
        passo :: (Integer, Integer) -> (Integer, Integer)
        passo(x, y) = (y, x+y)
    in 
        passo(fibo2(x-1))

-- E
fatorial:: Integer -> Integer
fatorial x = 
    let
        prodIntervalo:: (Integer, Integer) -> Integer
        prodIntervalo(x, y)
          | x == y = x
          | otherwise = x * prodIntervalo(x+1, y)
    in
        prodIntervalo(1, x)