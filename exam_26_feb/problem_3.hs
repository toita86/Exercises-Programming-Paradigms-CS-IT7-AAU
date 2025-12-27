{- 
The function runs takes a list and returns a list that tells us for each element x in xs how many consecutive appearences there are of x.
As an example, runs [1,2,2,2,3,4,5,5,1] should give us [1,3,1,1,2,1], as there is 1 occurrence of 1, followed by 3 occurrences of 2, followed by 1 occurrence of 3, followed by 1 occurrence of 4 and 2 occurrences of 5 and finally 1 more occurrence of 1.

1. Someone claimed that the type of runs that would be found using type inference would be [Int] −>[Int].
Explain in a comment why this is not correct and give the correct type of runs.

2. Define runs using recursion.
The function gcp takes two lists xs and ys and returns the list that is the greatest common prefix of xs and ys.

As an example, gcp [1,2,3,5,6] [1,2,17,42] should return [1,2].

3. Define gcp using recursion.
-}

-- This type is not correct as is too restrictive and therefore binds the funciton to work only with integers while it could work with tifferent type
-- runs :: (Num t, Eq t, Eq a) => [a] -> [t]

runs xs = accountant xs 1 []
  where 
    accountant [] count acc = count:acc
    accountant (x:[]) count acc = if count == 1 then 1:acc else (count + 1):acc
    accountant (x:y:xs) count acc | x == y = (accountant (y:xs) (count + 1) acc) 
                                  | otherwise = count:(accountant (y:xs) 1 acc)

-- gep :: Eq a => [a] -> [a] -> [a]
gep [] [] =  []
gep (x:xs) (y:ys) = if x==y then x:(gep xs ys) else []
