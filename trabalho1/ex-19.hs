disponiveis = [1, 2, 5, 10, 20, 50, 100]

notasTroco :: Integer -> [[Integer]]
notasTroco 0 = [[]]
notasTroco x = [ [e] ++ l | e <- disponiveis, e <= x,  l <- notasTroco (x-e)]