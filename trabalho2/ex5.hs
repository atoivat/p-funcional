merge :: Ord a => [a] -> [a] -> Int -> ([a], Int)
merge xs [] c = (xs, c)
merge [] ys c = (ys, c)
merge (x:xs) (y:ys) c
  | (x <= y) = (x:caso1ord, c1+1)
  | otherwise = (y:caso2ord, c2+1)
    where
        (caso1ord, c1) = merge xs (y:ys) c
        (caso2ord, c2) = merge (x:xs) ys c


mergesort :: Ord a => [a] -> ([a], Int)
mergesort [] = ([], 0)
mergesort [x] = ([x], 0)
mergesort xs = merge (first) (secnd) (c1+c2)
    where
        (first, c1) = mergesort (fsthalf)
        (secnd, c2) = mergesort (sndhalf)
        fsthalf = take (length xs `div` 2) xs
        sndhalf = drop (length xs `div` 2) xs


-- [2, 5] [4, 7] 0
-- 2:(merge [5] [4, 7]) 0+1

-- merge [5] [4, 7] 1
-- 4:(merge [5] [7]) 1+1

-- merge [5] [7] 2
-- [5, 7] 2+1

-- 4:([5, 7]) 3
-- 2:(4:([5, 7] ) ) 3 

-- merge (first) (secnd) (c1+c2), onde c1 é a quantidade de comparações pra chegar em first e 
--                                     c2 é a quantidade de comparações pra chegar em secnd