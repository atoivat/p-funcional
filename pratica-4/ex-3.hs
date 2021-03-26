-- Letra a
intervalo :: (Integer, Integer) -> [Integer]
intervalo (a, b) = [a..b]

-- Letra B
paresInterv :: (Integer, Integer) -> [Integer]
paresInterv (a, b)
  | mod a 2 == 0 = [a, (a+2)..b]
  | otherwise = [(a+1), (a+3)..b]