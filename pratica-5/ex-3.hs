produtorio :: [Integer] -> Integer
produtorio [x] = x
produtorio (h:t) = h * produtorio t