-- Algoritmo original (sem contador)
selecao:: Ord a => [a] -> [a]
selecao [] = []
selecao xs = [x] ++ selecao (remove x xs)
  where x = minimo xs

remove:: Ord a => a -> [a] -> [a]
remove a [] = []
remove a (x:xs)
  | a == x = xs
  | otherwise = x:(remove a xs)

minimo:: Ord a => [a] -> a
minimo [] = undefined
minimo [x] = x
minimo (x:xs)
  | x <= (minimo xs) = x
  | otherwise = minimo xs


-- Algoritmo original com contador de trocas
selecao2:: Ord a => [a] -> ([a], Integer)
selecao2 lista = selecao2aux (lista, 0)

selecao2aux:: Ord a => ([a], Integer) -> ([a], Integer)
selecao2aux ([], c) = ([], c)
selecao2aux (xs, c) = ([x] ++ lst, nextC + (if (x == head xs) then 0 else 1))
  where x = minimo2 xs
        (lst, nextC) = selecao2aux ((remove2 x xs), c)

remove2:: Ord a => a -> [a] -> [a]
remove2 a [] = []
remove2 a (x:xs)
  | a == x = xs
  | otherwise = x:(remove2 a xs)

minimo2:: Ord a => [a] -> a
minimo2 [] = undefined
minimo2 [x] = x
minimo2 (x:xs)
  | x <= (minimo2 xs) = x
  | otherwise = minimo2 xs


-- Algoritmo com contador de trocas e removeMenor (Variação 1)
removeMenor :: Ord a => [a] -> ([a], a)
removeMenor [x] = ([], x)
removeMenor (x:xs)
  | x < menorResto = (menorResto:resto, x)
  | otherwise = (x:resto, menorResto)
  where
    (resto, menorResto) = removeMenor xs

selecao3:: Ord a => [a] -> ([a], Integer)
selecao3 lista = selecao3aux (lista, 0)

selecao3aux:: Ord a => ([a], Integer) -> ([a], Integer)
selecao3aux ([], c) = ([], c)
selecao3aux (xs, c) = ([menor] ++ lst, nextC + (if (menor == head xs) then 0 else 1))
  where (lst, nextC) = selecao3aux (resto, c)
        (resto, menor) = (removeMenor xs)


-- Algoritmo com contador usando foldr ou foldr1
selecao4:: Ord a => [a] -> ([a], Integer)
selecao4 lista = selecao4aux (lista, 0)

selecao4aux:: Ord a => ([a], Integer) -> ([a], Integer)
selecao4aux ([], c) = ([], c)
selecao4aux (xs, c) = ([x] ++ lst, nextC + (if (x == head xs) then 0 else 1))
  where x = foldr1 (min) xs
        (lst, nextC) = selecao4aux ((remove4 x xs), c)

remove4:: Ord a => a -> [a] -> [a]
remove4 a [] = []
remove4 a (x:xs)
  | a == x = xs
  | otherwise = x:(remove4 a xs)