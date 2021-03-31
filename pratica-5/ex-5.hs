tamanho :: [t] -> Integer
tamanho [] = 0
tamanho (h:t) = 1 + tamanho t