plip = fst (17, f 484000)
 where f x = f (x + 1)

{- 
 The value of `plip` is 17 because out of a tuple with 2 elements we are taking the first one with the `fst` function.
 The value computed by the function `f` will never be computed because of the lazy evaluation.
-}
