-- Algoritmo original
bolha [] = []
bolha lista = bolhaOrd lista (length lista)


bolhaOrd lista 0 = lista
bolhaOrd lista n = bolhaOrd (trocas lista) (n-1)

trocas :: Ord a => [a] -> [a]
trocas [x] = [x]
trocas (x:y:zs)
 | x > y = y : trocas (x:zs)
 | otherwise = x : trocas (y:zs)


-- Algoritmo com contador
bolha2 [] = ([],0)
bolha2 lista = bolhaOrd2 lista 0 (length lista)

bolhaOrd2 lista i 0 = (lista,i)
bolhaOrd2 lista i n = bolhaOrd2 lst j (n-1)
    where (lst,j) = trocas2 (lista,i)

trocas2 ([x],i) = ([x],i)
trocas2 ((x:y:zs),i)
 | x > y = ((y:lst1),j1)
 | otherwise = ((x:lst2),j2)
     where  (lst1,j1) = trocas2((x:zs),(i+1))   -- como inverte x com y soma 1 no contador
            (lst2,j2) = trocas2((y:zs),(i))     -- como não inverte x com y mantem o valor


-- Variação do algoritmo com parada antecipada
bolha3 [] = ([],0)
bolha3 lista = bolhaOrd3 lista 0 (length lista)

bolhaOrd3 lista i 0 = (lista,i)
bolhaOrd3 lista i n
  | i == j = (lista, j)
  | otherwise = bolhaOrd3 lst j (n-1)
    where (lst,j) = trocas3 (lista,i)

trocas3 ([x],i) = ([x],i)
trocas3 ((x:y:zs),i)
 | x > y = ((y:lst1),j1)
 | otherwise = ((x:lst2),j2)
     where  (lst1,j1) = trocas3((x:zs),(i+1))   -- como inverte x com y soma 1 no contador
            (lst2,j2) = trocas3((y:zs),(i))     -- como não inverte x com y mantem o valor


-- Variação do algoritmo com parada antecipada e desconsideração do último fixado
bolha4 :: Ord a => [a] -> ([a], Int)
bolha4 [] = ([],0)
bolha4 lista = bolhaOrd4 lista 0 (length lista)

bolhaOrd4 :: Ord a => [a] -> Int -> Int -> ([a], Int)
bolhaOrd4 lista i 0 = (lista,i)
bolhaOrd4 lista i n
  | i == j = (lista, j)
  | otherwise = let tupla = bolhaOrd4 (take (n-1) lst) j (n-1) in (fst tupla ++ [last lst], snd tupla) 
    where (lst,j) = trocas4 (lista,i)

trocas4 ([x],i) = ([x],i)
trocas4 ((x:y:zs),i)
 | x > y = ((y:lst1),j1)
 | otherwise = ((x:lst2),j2)
     where  (lst1,j1) = trocas4((x:zs),(i+1))   -- como inverte x com y soma 1 no contador
            (lst2,j2) = trocas4((y:zs),(i))     -- como não inverte x com y mantem o valor