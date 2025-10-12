-- improve :: [a] -> [a]

improve [] = []

-- improve (x1:xs) = x1 : improve (drop 1 xs)

improve [x1] = [x1] 
improve (x1:_:xs) = x1 : improve xs 
