passo :: (Integer, Integer) -> (Integer, Integer)
passo(x, y) = (y, x+y)

fibo2 :: Integer -> (Integer, Integer)
fibo2 1 = (1, 1)
fibo2 x = passo(fibo2(x-1))

-- Não tinha certeza sobre como implementar:
-- Se a saída da fibo(x) não deva ser uma 
-- tupla em que o primeiro elemento é o número da 
-- sequência, mas apenas o número da sequência, e for
-- permitido o uso de mais uma função auxiliar, então 
-- a definição é como a seguir:

fiboFinal :: Integer -> Integer
fiboFinal x = fst(fibo2 x)