sublistas :: [[t]] -> [t]
sublistas x = [ n | subx <- x, n <- subx ]