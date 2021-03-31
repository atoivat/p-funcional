conta_ch:: [Char] -> Integer
conta_ch [] = 0
conta_ch (x:r) = 1 + conta_ch r

conta:: [t] -> Integer
conta [] = 0
conta (x:r) = 1 + conta r

maior:: [Integer] -> Integer
maior [x] = x
maior (x:y:r)
  | x > y = maior (x:r)
  | otherwise = maior (y:r)


primeiros:: Integer -> [t] -> [t]
primeiros 0 _ = []
primeiros _ [] = []
primeiros n (x:r) = x: primeiros (n-1) r

pertence :: Eq t => t -> [t] -> Bool
pertence a [] = False
pertence a (h:t)
  | a == h = True
  | otherwise = pertence a t

uniaoR:: Eq t => [t] -> [t] -> [t]
uniaoR [] lst = lst
uniaoR (h:t) lst
  | pertence h lst = uniaoR t lst
  | otherwise = h: uniaoR t lst