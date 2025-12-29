{-  
The function isolate takes a list l and an element x and returns a pair of two new lists (l1 , l2).
The first list l1 is a list that contains all elements in l , that are not equal to x. The second list l2 is a list that contains all occurrences of x in l.

• isolate
[4,5,4,6,7,4] 4 evaluates to
([5,6,7],[4,4,4]) .

• isolate [’ g ’,’ a ’,’ k ’,’ a ’] ’a’ evaluates to ([’ g ’,’ k ’], [’ a ’,’ a ’]) .

a) What should the type of isolate be?

b) Is isolate a polymorphic function? If yes, explain what forms of polymorphism are used. If no, explain why isolate is not polymorphic.

c) Define isolate in Haskell
i. using recursion
ii. using list comprehension
iii. using foldr
-}

-- isolate :: Eq a => [a] -> a -> ([a],[a])
-- isolate is ad-hoc polymorphic function that work for all type that are under the class type Eq.
isolate [] _ = ([],[])
isolate (l:ls) x | x == l = (diff, l:same)
                 | otherwise = (l:diff, same)
                 where 
                  (diff, same) = isolate ls x

isolate' ls x = ([l | l <- ls, l /= x], [l | l <- ls, l == x])

isolate'' ls x = foldr separator ([],[]) ls
  where 
    separator l (diff, same) | x == l = (diff, l:same)
                             | otherwise = (l:diff, same)

