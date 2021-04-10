reverte :: [a] -> [a]
reverte [x] = [x]
reverte (h:t) = reverte t ++ [h]