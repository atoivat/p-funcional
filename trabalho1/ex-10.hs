seleciona_multiplos :: Integer -> [Integer] -> [Integer]
seleciona_multiplos n lst = [e | e <-lst, mod e n == 0]