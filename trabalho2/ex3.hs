-- Insertion Sort com contador
insercao:: Ord a => [a] -> ([a], Integer)
insercao [] = ([], 0)
insercao (x:xs) = (ordenada, cont+contResto)
    where 
        (ordenada, cont) = insere_ord x (res)
        (res, contResto) = insercao xs

insere_ord:: Ord a => a -> [a] -> ([a], Integer)
insere_ord x [] = ([x], 0)
insere_ord x (y:l)
  | x > y = (y:(resto), contResto + 1)
  | otherwise = ((x:y:l), 1)
  where
      (resto, contResto) = insere_ord x l

-- Variação 1: usando foldr ou foldr1
insercao2:: Ord a => [a] -> ([a], Integer)
insercao2 = foldr (\elem -> \(res, contResto) -> let (ordenada, cont) = insere_ord elem (res) in (ordenada, contResto + cont)) ([], 0)