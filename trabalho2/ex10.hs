data ArvoreBinInt = Nulo |
                    No Int ArvoreBinInt ArvoreBinInt
                        deriving Show

folhas :: ArvoreBinInt -> [Int]
folhas Nulo = []
folhas (No x Nulo Nulo) = [x]
folhas (No x esqA dirA) = (folhas esqA) ++ (folhas dirA)


somasNosInternos :: ArvoreBinInt -> Int
somasNosInternos Nulo = 0
somasNosInternos (No _ Nulo Nulo) = 0
somasNosInternos (No x esqA dirA) =
    (somasNosInternos esqA) + (somasNosInternos dirA) + x


pertence :: Int -> ArvoreBinInt -> Bool
pertence i Nulo = False
pertence i (No x esqA dirA) =
    pertence i esqA || i == x || pertence i dirA



arvExemplo0 = (No 2 (No 7 (No 2 Nulo Nulo)
                          (No 6 (No 5 Nulo Nulo)
                                (No 11 Nulo Nulo)))
                    (No 5 Nulo (No 9 (No 4 Nulo Nulo) Nulo)))

arvExemplo1 = (No 8 (No 3 (No 1 Nulo Nulo)
                          (No 6 (No 4 Nulo Nulo)
                                (No 7 Nulo Nulo)))
                    (No 10 Nulo (No 14 (No 13 Nulo Nulo) Nulo)))