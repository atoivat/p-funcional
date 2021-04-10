insere_ord:: Ord a => a -> [a] -> [a]
insere_ord x [] = [x]
insere_ord x [y]
  | x > y = [y, x]
  | otherwise = [x, y]
insere_ord x (y:l)
  | x > y = (y:(insere_ord x l))
  | otherwise = (x:y:l)