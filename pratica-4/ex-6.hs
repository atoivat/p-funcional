seleciona_impares :: [Integer] -> [Integer]
seleciona_impares x = [ n | n <- x , mod n 2 == 1 ]