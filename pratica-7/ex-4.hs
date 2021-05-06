filtrar :: (a -> Bool) -> [a] -> [a]
filtrar f lst = [ e | e <- lst, f e ]