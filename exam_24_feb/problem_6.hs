{- 
A triangular number counts the number of dots arranged in an equilateral triangle. The nth triangular number is the number of dots in the triangular arrangement with n dots on each side, and is equal to nk=1 k, that is, the sum of the n natural numbers from 1 to n.
The infinite sequence of triangular numbers, starting with the 0th triangular number, starts as follows.

0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55 . . .

1. Give a definition in Haskell of the infinite list triangles of triangular numbers that uses list comprehension only, but not recursion.
2. Give a definition of the infinite list triangles’ of triangular numbers that uses recursion, but not list comprehension.
3. Give a definition of the infinite list triangles’’ of triangular numbers that uses map and foldr or foldl (but no recursion or list comprehension).
-}

triangles = [sum [0..l] | l <- [0..]]

tri 0 = 0
tri i = i + tri (i - 1)

triangles' = triangle [0..]
  where 
    triangle (i:is) = tri i : triangle is 

triangles'' = foldr (\i acc -> (sum [0..i]):acc) [] [0..]

