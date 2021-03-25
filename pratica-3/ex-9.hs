mdc :: (Integer, Integer) -> Integer
mdc(m, 0) = m
mdc(m, n) = mdc(n, mod m n)


mdc2 :: (Integer, Integer) -> Integer
mdc2(m, n)
  | n == 0 = m
  | otherwise = mdc2(n, mod m n)