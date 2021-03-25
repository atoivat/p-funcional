n_tri :: Integer -> Integer
n_tri 0 = 0
n_tri x = x + n_tri(x-1)