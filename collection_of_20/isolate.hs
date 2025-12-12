{- 
The function isolate takes a list l and an element x and returns a pair of two new lists (l1 , l2).
The first list l1 is a list that contains all elements in l , that are not equal to x. The second list l2
is a list that contains all occurrences of x in l.

• isolate [4,5,4,6,7,4] 4 evaluates to ([5,6,7],[4,4,4]) .
• isolate [’ g ’,’ a ’,’ k ’,’ a ’] ’a’ evaluates to ([’ g ’,’ k ’], [’ a ’,’ a ’]) .

a) What should the type of isolate be?

b) Is isolate a polymorphic function? If yes, explain what forms of polymorphism are used. If
no, explain why isolate is not polymorphic.

c) Define isolate in Haskell

i. using recursion
ii. using list comprehension
iii. using foldr
-}

-- isolate :: a -> [a] -> ([a], [a]) 

isolate l x = partition l x ([], []) 
  where
    partition [] _ res = res
    partition (l:ls) x (zs, ks) | l == x = partition ls x (zs, l:ks)
                                | otherwise = partition ls x (zs ++ [l], ks)

{- other possible implementation 
isolate' [] _ = ([], [])
isolate' (x:xs) y | x == y = (different, x:equal)
                  | otherwise = (x:different, equal)
                 where
                    (different, equal) = isolate' xs y
-}

isolate' l x = ([e | e <- l, e /= x], [e | e <- l, e == x])

isolate'' l x = foldr (\y (zs, ks) -> if y == x then (zs , y:ks) else (y:zs, ks)) ([], []) l
