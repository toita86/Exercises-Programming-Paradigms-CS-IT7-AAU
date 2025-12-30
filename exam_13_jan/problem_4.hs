{- 
The goal of this problem is to define a function lists that will generate an infinite list.
When given a natural number n, lists n will generate an infinite list of lists of natural numbers in which every number n occurs exactly n times.
First a list of n copies of n, then a list of n + 1 copies of n + 1, then a list of n + 2 copies of n + 2 and so on.

As an example, a call to lists 4 will result in an infinite list beginning with the following fragment
[[4,4,4,4],[5,5,5,5,5],[6,6,6,6,6,6],[7,7,7,7,7,7,7],[8,8,8,8,8,8,8,8]...

1. Is lists a polymorphic function? If yes, explain if lists uses parametric polymorphism or ad hoc polymorphism (overloading) or a combination of them and why. If no, explain why lists is not polymorphic.

2. Define lists by a definition that uses recursion but not list comprehension or higher-order functions.

3. Define lists without recursion by using higher-order functions (such as map, foldr) and possibly also list comprehension.
-}

-- lists :: (Eq a, Num a) => a -> [[a]] the function uses parametric polymorphism but constrained by the type classes Eq and Num
lists n = rep n n []
  where
    rep n r acc | r == 0 = acc:(rep (n+1) (n+1) [])
                | otherwise = rep n (r - 1) (n:acc)

lists' n = foldr rep [] [n..]
  where
    rep n acc = (reprep n n []):acc
    reprep _ 0 acc = acc
    reprep n r acc = reprep n (r - 1) (n:acc) 

lists'' n = [[l | i <- [1..l]] | l <- [n..]]
