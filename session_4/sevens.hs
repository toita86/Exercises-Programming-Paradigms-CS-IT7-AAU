{-
se list comprehension to define a function sevens that given an integer k gives us a list of all natural
numbers that are divisible by 7 and are less than k. First find out what its type should be.
-}

sevens :: Integral a => a -> [a]

sevens k = [x | x <- [1..(k-1)], x `mod` 7 == 0] 
