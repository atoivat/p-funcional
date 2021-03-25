-- Letra A
prodIntervalo:: (Integer, Integer) -> Integer
prodIntervalo(x, y)
  | x == y = x
  | otherwise = x * prodIntervalo(x+1, y)

-- Letra B
fatorial:: Integer -> Integer
fatorial x = prodIntervalo(1, x)