-- Letra A
ou :: Bool -> Bool -> Bool
ou True True = True
ou True False = True
ou False True = True
ou False False = False

ou2 :: Bool -> Bool -> Bool
ou2 False False = False
ou2 _ _ = True

ou3 :: Bool -> Bool -> Bool
ou3 False x = x
ou3 True _ = True


-- Letra B
ou4 :: Bool -> Bool -> Bool
ou4 a b
  | (a == True) = True
  | (b == True) = True
  | otherwise = False

ou5 :: Bool -> Bool -> Bool
ou5 a b =
    if (a == False) then
        if (b == False) then False
        else True
    else True