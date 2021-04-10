serie :: Double -> Integer -> Double
serie x 0 = 0
serie x n
  | mod n 2 == 0 = x/(fromIntegral n) + serie x (n-1) -- posicao par
  | otherwise = (fromIntegral n)/x + serie x (n-1) -- posicao impar