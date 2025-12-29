{- 
The compression of a list is a list that counts successive elements that are repeated and returns a list of pairs of the form (x, v) where (x, v) indicates that there are v successive elements that are x’s. 

For instance, the compression of
[ 1 ,1 ,1 ,2 ,1 ,4 ,4 ,4 ,1 ,1 ,6 ,1 ,6 ,4 ,4 ,4 ,4 ,4]

is the list
[(1 ,3) ,(2 ,1) ,(1 ,1) ,(4 ,3) ,(1 ,2) ,(6 ,1) ,(1 ,1) ,(6 ,1) ,(4 ,5) ]

and the compression of
[ True , True , True , F a l s e , True , F a l s e , F a l s e ]

is the list
[ ( True , 3 ) , ( F a l s e , 1 ) , ( True , 1 ) , ( F a l s e , 2 ) ]

The compression of an empty list is the empty list itself.
-}

-- compress :: (Eq a, Num b) => [a] -> [(a, b)] 
-- the function is parametric polymorphic beacause the types classes of a and b are specified as Eq and Num
compress (x:xs) = comp xs (x, 1) 
  where
    comp [] t = [t]
    comp (x:xs) (a, i) | x == a = comp xs (a, i + 1)
                       | otherwise = (a, i):(comp xs (x, 1))

-- decompress :: (Ord b, Num b) => [(a, b)] -> a
-- the same goes fo
decompress [] = []
decompress ((x, i):xs) | i > 0 = x:(decompress ((x, i-1):xs)) 
                       | otherwise = decompress xs
  
