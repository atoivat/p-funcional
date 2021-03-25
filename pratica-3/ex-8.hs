resto_div :: (Integer, Integer) -> Integer
resto_div (x, y)
  | x < y = x
  | x - y < y = x-y
  | otherwise = resto_div(x-y, y)


div_inteira :: (Integer, Integer) -> Integer
div_inteira (x, y)
  | x < y = 0
  | x - y < y = 1
  | otherwise = 1 + div_inteira(x-y, y)