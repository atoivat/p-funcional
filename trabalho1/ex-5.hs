-- A
contaNegM2 :: [Integer] -> Int
contaNegM2 x = length [ y | y <- x, y >= 0, mod y 3 == 0]

-- B
listaNegM2 :: [Integer] -> [Integer]
listaNegM2 x = [ y | y <- x, y >= 0, mod y 3 == 0]