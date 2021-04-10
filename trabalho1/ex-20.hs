-- Confere se duas rainhas se atacam
ataca :: (Integer, Integer) -> (Integer, Integer) -> Bool
ataca (xl, xc) (yl, yc) =
  (xl == yl) || 
  (xc == yc) ||
  (xl-xc == yl-yc) ||
  (xl+xc == yl+yc)

headNaoAtaca :: [Integer] -> Integer -> Bool
headNaoAtaca [h1] _ = True
headNaoAtaca (h1:h2:t) index = 
  (not (ataca(h1, 1) (h2, index+1))) && 
  headNaoAtaca (h1:t) (index+1)

naoAtacam :: [Integer] -> Bool
naoAtacam [x] = True
naoAtacam (h:t) = headNaoAtaca (h:t) 1 && naoAtacam t


permutacaoAux :: Integer -> Integer -> [[Integer]]
permutacaoAux 0 _ = [[]]
permutacaoAux x xr = [ [e] ++ l | e <- [1..xr], l <- permutacaoAux (x-1) xr]

permutacao :: Integer -> [[Integer]]
permutacao x = permutacaoAux x x

nRainhas :: Integer -> [[Integer]]
nRainhas n = [ mapa | mapa <- permutacao n, naoAtacam mapa]