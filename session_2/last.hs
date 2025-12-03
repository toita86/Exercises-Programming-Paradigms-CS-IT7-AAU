-- There is a function called reverse in the Haskell prelude that allows us to reverse any list. Use reverse to give a definition of the function last that returns the last element of a given list.

firstend :: [a] -> a

firstend a = head (reverse a)
