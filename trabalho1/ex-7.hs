mdc :: Integer -> Integer -> Integer
mdc x 0 = x
mdc x y = mdc y (mod x y)

-- MMC de dois numeros
mmc2 :: Integer -> Integer -> Integer
mmc2 x y = div (x*y) (mdc x y) 

-- MMC de tres numeros
mmc :: Integer -> Integer -> Integer -> Integer
mmc x y z = mmc2 (mmc2 x y) (z)