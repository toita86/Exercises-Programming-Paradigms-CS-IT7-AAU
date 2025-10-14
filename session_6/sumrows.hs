{- 
Implement the sumrows function. The function takes a list of number lists returns a one-dimensional
list of numbers with each number equal to the sum of the corresponding row in the input list. If a
list is empty, its sum is 0.
As an example, sumrows [[1,2], [3,4]] should give us [3, 7], and sumrows [[],[],[1]] should give
us [0,0,1] .
Define sumrows using the higher-order functions in Chapter 7.
-}

sumrows :: Num a => [[a]] -> [a]
sumrows = map sum 

sumrows' :: Num a => [[a]] -> [a]
sumrows' = map (foldr (+) 0)
