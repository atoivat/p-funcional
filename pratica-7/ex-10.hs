menores10 :: [Integer] -> ([Integer], Integer)
menores10 lst = conta_cmp(lst, 0) where
  conta_cmp :: ([Integer], Integer) -> ([Integer], Integer)
  conta_cmp ([], n) = ([],n)
  conta_cmp ((h:t), n)
    | h < 10 = let a = conta_cmp (t, n+1) in ([h] ++ fst a, snd a)
    | otherwise = conta_cmp(t, n)