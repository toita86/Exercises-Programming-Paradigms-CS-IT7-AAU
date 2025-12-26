{- 
Define a function remove which takes two strings as its arguments and removes every letter from the
second list that occurs in the first list.
As an example, remove ”first” ”second” should give us the string ”econd”.

1. Define remove using list comprehension.

2. Define remove using recursion without using list comprehension.
-}
remove f s = [c | c <- s, not (c `elem` f)]

remove' f [] = []
remove' f (x:xs) | x `elem` f = remove' f xs 
                 | otherwise = x:(remove' f xs)
