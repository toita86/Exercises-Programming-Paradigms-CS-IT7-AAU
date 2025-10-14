{- 
The within function takes a list of numbers and a pair of numbers, returns a list of numbers which
are in the input list and within the range (inclusive) given by the input pair.
The elements in the output list appear be in the same order they appeared in the input list. If the
input pair is (n1,n2), assume that n1 is the lower bound of the range and n2 is the upper bound of
the range.
As an example, within [1,3,4,5,2] (1,3) should give us [1,3,2] and within [1,3,4,5,2] (3,1) should
give us [] .
Define within using the higher-order functions in Chapter 7.
-}

within :: (Num a, Ord a) => [a] -> (a,a) -> [a]
within xs (a,b) = filter (\x -> x >= a && x <= b) xs

within' xs (a,b) = foldr (\x acc -> if (\x -> x >= a && x <= b) x then x : acc else acc) [] xs
