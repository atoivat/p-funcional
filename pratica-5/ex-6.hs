pertence :: Eq t => t -> [t] -> Bool
pertence a [] = False
pertence a (h:t)
  | a == h = True
  | otherwise = pertence a t

uniaoRec2 :: Eq t => [t] -> [t] -> [t]
uniaoRec2 x [] = x
uniaoRec2 lst (h:t)
  | pertence h lst = uniaoRec2 lst t 
  | otherwise = uniaoRec2 (lst++[h]) t