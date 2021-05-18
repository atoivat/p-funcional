-- Original com contador
quicksort :: Ord a => [a] -> ([a], Int)
quicksort [] = ([], 0)
quicksort (p:xs) = (firstOrd ++ [p] ++ secndOrd , firstCont + secndCont + (2 * length xs))
    where
        (firstOrd, firstCont) = quicksort [x | x <- xs, x < p]
        (secndOrd, secndCont) = quicksort [x | x <- xs, x >= p]


-- Variação 1: divide a lista percorrendo uma só vez
divide :: Ord a => a -> [a] -> ([a], [a])
divide  _ [] = ([], [])
divide p (x:xs)
  | p > x = ([x] ++ first, secnd)
  | otherwise = (first, [x] ++ secnd)
    where
        (first, secnd) = divide p xs

quicksortV1 :: Ord a => [a] -> ([a], Int)
quicksortV1 [] = ([], 0)
quicksortV1 (p:xs) = (firstOrd ++ [p] ++ secndOrd , firstCont + secndCont + (length xs))
    where
        (first, secnd) = divide p xs
        (firstOrd, firstCont) = quicksortV1 first
        (secndOrd, secndCont) = quicksortV1 secnd


-- Variação 2: escolhe o "intermediário" dos três primeiros como pivô
intermediario :: Ord a => a -> a -> a -> (a, Int, a, a)
intermediario x y z = 
    if x < y then
        if x < z then
            if y < z then (y, 3, x, z)
            else (z, 3, x, y)
        else (x, 2, y, z)
    else
        if y < z then
            if x < z then (x, 3, y, z)
            else (z, 3, x, y)
        else (y, 2, x, z)



quicksortV2 :: Ord a => [a] -> ([a], Int)
quicksortV2 [] = ([], 0)
quicksortV2 (p1:p2:p3:xs) = (firstOrd ++ [pivo] ++ secndOrd , firstCont + secndCont + (length (r1:r2:xs)) + pivoCont)
    where
        (pivo, pivoCont, r1, r2) = intermediario p1 p2 p3
        (first, secnd) = divide pivo (r1:r2:xs)
        (firstOrd, firstCont) = quicksortV2 first
        (secndOrd, secndCont) = quicksortV2 secnd
quicksortV2 (p:xs) = (firstOrd ++ [p] ++ secndOrd , firstCont + secndCont + (length xs))
    where
        (first, secnd) = divide p xs
        (firstOrd, firstCont) = quicksortV2 first
        (secndOrd, secndCont) = quicksortV2 secnd