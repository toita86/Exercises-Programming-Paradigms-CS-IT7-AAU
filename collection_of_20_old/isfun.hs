{- 
A function maps different arguments to different values. In Haskell, we can represent any function
that is only defined for finitely many cases as an association list.
We can define a Haskell function isfun that will take any association list and tell us if it represents
a function.

For instance, isfun [(1,’ a’) ,(2,’ b’) ] should return True whereas isfun [(1,’ a’) ,(1,’ b’) ] should
return False .

a) What should the type of isfun be?

b) Now define isfun in Haskell.

c) We know that a function f is 1-1 if whenever we have x, y with x != y we have that f (x)̸ = f (y).
We can define a Haskell function is11 that will take any association list and tell us if it
represents a function which is also 1-1.

For instance, is11 [(1,’ a’) ,(2,’ b’) ] should return True whereas is11 [(1,’ a’) ,(2,’ a’) ] should
return False .

What should the type of is11 be?

d) Now define is11 in Haskell. It is a good idea to make use of the solutions to the previous
subproblems.
-}

isFun xs = and [not a == c | (a, _) <- xs, (c, _) <- tail xs]

-- is11 :: (Eq a, Eq b) => [(a, b)] -> Bool
is11 xs = and [if a == c then b == d else a /= c && b /= d | (a, b) <- xs, (c, d) <- xs]


