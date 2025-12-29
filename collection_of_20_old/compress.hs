{- 
The compression of a list is a list that counts successive elements that are repeated and returns a
list of pairs of the form (x, v) where (x, v) indicates that there are v successive elements that are
x’s. 
For instance, the compression of
[ 1 , 1 , 1 , 2 , 1 , 4 , 4 , 4 , 1 , 1 , 6 , 1 , 6 , 4 , 4 , 4 , 4 , 4 ]

is the list
[ ( 1 , 3 ) , ( 2 , 1 ) , ( 1 , 1 ) , ( 4 , 3 ) , ( 1 , 2 ) , ( 6 , 1 ) , ( 1 , 1 ) , ( 6 , 1 ) , ( 4 , 5 ) ]

and the compression of
[ True , True , True , F a l s e , True , F a l s e , F a l s e ]
is the list
[ ( True , 3 ) , ( F a l s e , 1 ) , ( True , 1 ) , ( F a l s e , 2 ) ]

The compression of an empty list is the empty list itself.

a) Using Haskell, define a function compress that computes the compression of a list. What is
the type of compress? Is the function polymorphic? Justify your answer.

b) If we are given a list of pairs where each pair is of the form (x, v) where v is a natural number,
we can decompress the list such that for every element (x, v) we get v successive copies of
each x. The decompression of [[(1,3) ,(2,1) ,(1,1) ,(4,3) ,(1,2) ,(6,1) ,(1,1) ,(6,1) ,(4,5) ] is
therefore [ 1,1,1,2,1,4,4,4,1,1,6,1,6,4,4,4,4,4] Using Haskell, define a function decompress
that computes the decompression of a list. What is the type of decompress? Is the function
polymorphic? Justify your answer.
-}

-- compress :: (Num b, Eq a) => [a] -> [(a, b)] --the function uses ad-hoc polymorphyms  

compress (x:xs) = encode x 1 xs
  where 
    encode x acc [] = [(x, acc)]
    encode x acc (y:ys) | x == y = encode x (acc + 1) ys
                        | otherwise = (x, acc) : encode y 1 ys 

decompress :: (Num b, Eq b) => [(a,b)] -> [a] --the function uses ad-hoc polymorphyms
decompress [] = []
-- decompress ((a, b):xs) = [a | i <- [1..b]] ++ decompress xs
decompress ((a,b):xs) = a : if b == 1 then decompress xs else decompress ((a,b - 1):xs)
