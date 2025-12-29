{- A palindrome is a string that is the same written forwards and backwards such as “Otto” or
“Madam”.
The goal of this problem is to write a Haskell function ispalindrome that will determine if a string
of characters is a palindrome.
a) First figure out the type of ispalindrome without using the Haskell system. Is the function
polymorphic? Why? How?
b) Now give two different definitions of the function, one that uses the reverse function and one
that does not.
-}

-- ispalindrome :: Eq a => [a] -> Bool

-- no is not polymoprphic beacause the type are not parametrized

ispalindrome xs = xs == (reverse xs) 

invert [] = []
invert (x:xs) = invert xs ++ [x] 
ispalindrome' xs = xs == invert xs 

ispalindrome'' [] = True
ispalindrome'' xs = f == l && ispalindrome'' ys    
  where
    f = head xs
    l = last xs
    ys = drop 1 (init xs)
