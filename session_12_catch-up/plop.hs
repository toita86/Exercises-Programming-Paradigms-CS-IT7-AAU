-- 2. What does this piece of code do? Which monad is involved? Explain!

-- plop :: Monad m => (t -> m a) -> [t] -> m [a]
plop f [] = return []
plop f ( x : xs ) = 
  do
    y <- f x
    ys <- plop f xs
    return ( y : ys )

-- test case: plop (\x -> return (x + 1)) [1,2,3]

{- 
This function maps a monadic function over a list. 
and returns a list of whatever monad you used in the monad function.
-}
