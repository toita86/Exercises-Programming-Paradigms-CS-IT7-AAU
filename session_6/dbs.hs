{- Define a function dbs over lists using higher-order functions. The list should take a list of pairs of numbers and return the list of tuples in which the second element in the first tuple is two times the first element. 
 -
 - As an example dbs [(1,4) ,(3,6) ,(9,2) ,(4,8) ] should return the list [(3,6),(4,8)]. -}

-- dsb :: Num a => [(a,a)] -> [(a,a)]

dbs = filter (\(a,b) -> a*2 == b)

dbs' :: (Eq a, Num a) => [(a,a)] -> [(a,a)]
dbs' = foldr (\x acc -> if (\(a,b) -> a*2 == b ) x then x : acc else acc) []
