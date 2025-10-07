onlytwo :: [a] -> Bool

onlytwo [] = False
onlytwo [a] = False
onlytwo (_:_:xs) = null xs

