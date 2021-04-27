-- Implementação das expressões lambda
-- (Execução no arquivo ex-5.png)

-- A
a = (\x -> \y -> y)((\z -> z)(\z -> z))(\w -> w) 5
-- B
b = ((\f -> (\x -> f(f x))) (\y -> (y * y))) 3
-- C
c = ((\f -> (\x -> f(f x)))(\y -> ((+) y y))) 5
-- D
d = ((\x -> (\y -> (+) x y) 5) ((\y -> (-) y 3) 7))
-- E
e = (((\f -> (\x -> f(f(f x)))) (\y -> (y * y))) 2)
-- F
f = (\x -> \y -> (+) x ((\x -> (-) x 3) y)) 5 6