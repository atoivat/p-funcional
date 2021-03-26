quadrados :: (Integer, Integer) -> [Integer]
quadrados (a, b) = [ x^2 | x <- [a..b]]