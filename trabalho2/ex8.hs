data Nebuloso = Verdadeiro | Falso | Talvez Float deriving Show

fuzzifica :: Float -> Nebuloso
fuzzifica x
  | x >= 1 = Verdadeiro
  | x <= 0 = Falso
  | otherwise = Talvez x

verifica_alto :: Float -> Nebuloso
verifica_alto x = fuzzifica ((x-1.7)/0.2)

verifica_barato :: Float -> Nebuloso
verifica_barato x = fuzzifica ((50000-x)/20000)