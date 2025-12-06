{-
The function rle is a function that, when given a list xs produces a list of pairs of elements of xs and
integers2. This list of pairs has its elements appears in the order that they appeared originally and
contains (x, n) if there are n successive occurrences of x in the list. 

For instance

r l e [ ’ a ’ , ’ a ’ , ’ a ’ , ’ g ’ , ’ g ’ , ’ b ’ , ’ a ’ , ’ a ’ ]
should give us the list [(’ a ’,3) ,(’ g ’,2) ,(’ b ’,1) ,(’ a ’,2) ] and

r l e [ 1 , 1 , 1 , 2 , 2 , 1 , 3 , 3 ]
should give us [(1,3) ,(2,2) ,(1,1) ,(3,2) ].

Define rle in Haskell. First try to find out what the type of rle should be and follow the overall
approach described in Section 6.6.
-}


rle :: Eq a => [a] -> [(a, Int)]
rle [] = []
rle (x:xs) = encode x 1 xs
  where 
    encode x n [] = [(x,n)]
    encode x n (y:ys)
      | x == y = encode x (n + 1) ys
      | otherwise = (x, n) : encode y 1 ys

