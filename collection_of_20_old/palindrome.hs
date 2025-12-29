{- 
A palindrome is a string that is the same written forwards and backwards such as “Otto” or
“Madam”.

The goal of this problem is to write a Haskell function ispalindrome that will determine if a string
of characters is a palindrome.

a) First figure out the type of ispalindrome without using the Haskell system. Is the function
polymorphic? Why? How?

b) Now give two different definitions of the function, one that uses the reverse function and one
that does not
-}

-- ispalindrome :: String -> Bool. This is not polymorphic
-- which is equivalent to
-- ispalindrome :: [Char] -> Bool. This is not polymorphic
-- ispalindrome :: (Eq a) -> [a] -> Bool. This is ad-hoc polymorphism

ispalindrome xs = xs == reverse xs

ispalindrome' [] = True 
ispalindrome' [_] = True
ispalindrome' xs = f == l && ispalindrome' rest 
  where 
    f = head xs
    l = last xs
    rest = init (tail xs)
