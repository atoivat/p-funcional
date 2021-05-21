data Exp =
    Val Double
  | Add Exp Exp
  | Sub Exp Exp
  | Mul Exp Exp
  | Div Exp Exp

avalia :: Exp -> Double -- Conferir issaq
avalia (Val x) = x
avalia (Add exp1 exp2) = (avalia exp1) + (avalia exp2)
avalia (Sub exp1 exp2) = (avalia exp1) - (avalia exp2)
avalia (Mul exp1 exp2) = (avalia exp1) * (avalia exp2)
avalia (Div exp1 exp2) = (avalia exp1) / (avalia exp2)

-- ((3+12)*(15-5))/(1*3)
-- Div ((3+12)*(15-5)) (1*3)
-- Div ( Mul (Add 3 12) (Sub 15 5)) (Mul 1 3)
-- (Div ( Mul (Add (Val 3) (Val 12)) (Sub (Val 15) (Val 5))) (Mul (Val 1) (Val 3)))


-- - ((6+8-5+1)*(2+6/2))
-- Sub 0 ((6+8-5+1)*(2+6/2))
-- Sub 0 (Mul ((Add 6 8)-5+1) (Add 2 6/2))
-- Sub 0 (Mul ((Sub (Add 6 8) 5)+1) (Add 2 (Div 6 2)))
-- (Sub (Val 0) (Mul (Add (Sub (Add (Val 6) (Val 8)) (Val 5)) (Val 1)) (Add (Val 2) (Div (Val 6) (Val 2)))))