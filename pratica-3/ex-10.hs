binomial :: (Integer, Integer) -> Integer
binomial(n, 0) = 1
binomial(n, k) = 
  if n == k then 1
  else binomial(n-1, k) + binomial(n-1, k-1)

binomial2 :: (Integer, Integer) -> Integer
binomial2(n, k)
  | k == 0 = 1
  | n == k = 1
  | otherwise = binomial2(n-1, k) + binomial2(n-1, k-1)