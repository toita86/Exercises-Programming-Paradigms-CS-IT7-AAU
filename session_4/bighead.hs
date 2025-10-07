bighead :: Ord a => [a] -> Int

-- bighead (x:xs) = sum [1 | y <- xs, y > x]
bighead (x:xs) = length [y | y <- xs, y > x]


bigheadTail :: (Ord t1, Num t2) => [t1] -> t2

bigheadTail (x:xs) = bht x 0 xs 

bht _ count [] = count
bht target count (x:xs) 
    | x > target = bht target (count + 1) xs
    | otherwise = bht target count xs
