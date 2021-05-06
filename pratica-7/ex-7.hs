maior :: [Integer] -> Integer
maior lst = foldr1 (max) lst