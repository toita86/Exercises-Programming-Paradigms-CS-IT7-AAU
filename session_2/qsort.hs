-- Try to modify the definition of qsort from the file simple.hs such that it sorts the elements in descending order

qsort :: (Ord a) => [a] -> [a]

qsort [] = []
qsort (x:xs) = big ++ [x] ++ small
                 where small = qsort [a | a <- xs, a < x]
                       big   = qsort [a | a <- xs, a > x]

-- ghci> qsort ["kpst", "ding", "bop", "plip"]
-- ["plip","kpst","ding","bop"]
-- yes calling qsort in this way makes sense given the fact that the function polymophism

-- Suppose we changed the definition of qsort from the file simple.hs such that we replaced <= to <. 
-- What would happen then?
-- ghci> qsort [1, 3, 2, 2, 5, 6]
-- [6,5,3,2,1]
-- it happens that in the case that the pivot choosen for the sorting has a duplicate it will be ignored and deleted from the actual result
