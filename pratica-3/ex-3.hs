-- Fatorial com guardas
fatorial :: Integer -> Integer
fatorial x
  | (x == 1) = 1
  | otherwise = x * fatorial(x-1)

-- Fatorial com casamento de padrões
fatorial2 :: Integer -> Integer
fatorial2 1 = 1
fatorial2 x = x * fatorial(x-1)