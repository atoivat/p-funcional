uniaoNRec :: Eq t => [t] -> [t] -> [t]
uniaoNRec l1 l2 = l1 ++ [ x | x <- l2, elem x l1 == False ]