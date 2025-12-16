{- 
The function min2 takes a list of numbers and returns the second-smallest number of the input list. If a list contains duplicates, the second-smallest number and the smallest number can be identical; then the function should return that number. Assume that every input lists contains at least two numbers.

As an example, min2 [2110, 4820, 3110, 4120] should give us 3110 and min2 [2110, 4820, 2110, 4120] should give us 2110.

Define the min2 function using the higher-order functions in Chapter 7.
-}

min2 xs = snd (foldr step (v1, v2) xs)
  where 
    v1 = max (xs !! 0) (xs !! 1)
    v2 = max (xs !! 0) (xs !! 1)

    step x (a,b) | x <= a = (x, a)
                 | x < b = (a, x)
                 | otherwise = (a, b)
