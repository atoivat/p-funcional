npares:: [Integer] -> Integer
npares [] = 0
npares (h:t)
  | mod h 2 == 0 = 1 + npares t 
  | otherwise = npares t