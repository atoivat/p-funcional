zipar:: [a] -> [a] -> [[a]]
zipar _ [] = []
zipar [] _ = []
zipar (x:xl) (y:yl) = ([x, y]:(zipar xl yl))