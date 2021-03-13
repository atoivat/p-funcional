-- Função Dobro
dobro:: Int -> Int
dobro x = 2 * x

-- Função Quadruplo
quad:: Int -> Int
quad x = dobro (dobro x)

-- Calculo da hipotenusa
hipo:: Float -> Float -> Float
hipo c1 c2 = sqrt ((c1 ^ 2) + (c2 ^ 2))

-- Função distancia em plano
dist:: Float -> Float -> Float -> Float -> Float 
dist ax ay bx by = sqrt (((ax - bx)^2) + ((ay - by)^2))