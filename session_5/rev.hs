{-
The function reverse appears in the Haskell prelude. 
It will reverse a list such that e.g. reverse [1,2,3] evaluates to [3,2,1] .

Now it is your task to define your own version of this function, rev. First try to find out what the
type of rev should be and follow the overall approach described in Section 6.6
-}

reverse' :: [a] -> [a]

reverse' [] = []
reverse' (x:xs) = (reverse' xs) ++ [x]
