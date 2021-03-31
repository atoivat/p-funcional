comprime :: [[t]] -> [t]
comprime [] = []
comprime [l] = l
comprime (h:t) = h ++ comprime t