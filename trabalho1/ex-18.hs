elimina_repet :: Eq a => [a] -> [a]
elimina_repet [x] = [x]
elimina_repet (x:t) = [x] ++ [ e | e <- (elimina_repet t), e /= x]