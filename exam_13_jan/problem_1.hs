{- 
The goal of this problem is to define a function partition which takes a predicate, p, and a list lst, and returns a pair of lists (yes,no) such that the list yes contains the elements of lst for which p is true and the list no contains the elements of lst for which p is false. In both yes and no the elements appear in the same order as they did in lst.

Here are three examples of what partition will do.

partition (odd) [1,2,3,4,5] gives us ([1,3,5],[2,4])

partition (== ”la”) [”tra”,”la”,”la”,”tra”,”la”] gives us ([”la”,”la”,”la”],[”tra”,”tra”])

partition (> False) [True,False,False,True] gives us ([True,True],[False,False])

1. What is the type of partition? Is the partition function polymorphic? If yes, explain if partition uses parametric polymorphism or ad hoc polymorphism (overloading) or a combination of them and why. If no, explain why partition is not polymorphic.

2. Give a definition of partition in Haskell that uses list comprehension only.

3. Give a definition in Haskell of partition that uses that uses recursion but not list comprehension or higher-order functions.
-}

-- partition :: (a -> Bool) -> [a] -> ([a], [a])
-- partition is a polymorphic function for all the arguments except for the return of the function that is given as the first argument that returns a boolean.
partition f xs = ([x | x <- xs, f x],[x | x <- xs, not (f x)])

partition' _ [] = ([],[])
partition' f (x:xs) | f x = (x:yes, no)
                    | otherwise = (yes, x:no)
                    where 
                      (yes, no) = partition f xs
