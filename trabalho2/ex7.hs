data Jogada = Pedra | Papel | Tesoura deriving Show

vence :: Jogada -> Jogada -> Bool
vence Pedra Tesoura = True
vence Tesoura Papel = True
vence Papel Pedra = True
vence _ _ = False


vencedoras :: [(Jogada, Jogada)] -> [Jogada]
vencedoras [] = []
vencedoras ((a, b):xs)
  | vence a b = a:(vencedoras xs)
  | otherwise = b:(vencedoras xs)