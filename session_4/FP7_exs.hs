-- First excercise
pyths :: Int -> [(Int,Int,Int)]

pyths n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], (x^2)+(y^2) == (z^2)]

-- Second exercise
factors :: Int -> [Int]

factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]

perfects n = [l | l <- [1..n], l == sum (init (factors l))]

-- perfects n = [l | l <- [1..n], l == sum [f | f <- factors l, f /= x]]
-- perfects n = [l | l <- [1..n], sum(factors(n)) - n == n]

-- Third exercise
scalProd :: [Int] -> [Int] -> Int

scalProd l1 l2 = sum [x * y | (x,y) <- zip l1 l2]
-- scalProd l1 l2 = sum [l1 !! i * l2 !! i | i <- [0..n-1]]
--   where n = length l1
