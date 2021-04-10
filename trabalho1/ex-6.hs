fatores :: Integer -> [Integer]
fatores x = [ y | y <- [1..x], mod x y == 0]


primos :: Integer -> Integer -> [Integer]
primos x y = [ n | n <- [x..y], fatores n == [1, n]]



