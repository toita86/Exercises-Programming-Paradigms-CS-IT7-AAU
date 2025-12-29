{- 
A triangular number counts the number of dots arranged in an equilateral triangle. The nth
triangular number is the number of dots in the triangular arrangement with n dots on each side,
and is equal to \sum^n_k=1 k, that is, the sum of the n natural numbers from 1 to n.

The infinite sequence of triangular numbers, starting with the 0th triangular number, starts as
follows.

0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55 . . .

a) Give a definition in Haskell of the infinite list triangles of triangular numbers that uses list
comprehension only, but not recursion.
b) Give a definition of the infinite list triangles ’ of triangular numbers that uses recursion, but
not list comprehension.
c) Give a definition of the infinite list triangles ’’ of triangular numbers that uses higher-order
functions (but no recursion or list comprehension).
-}

triangles = [sum [0..i] | i <- [0..]]

triangles' = triangle [0..]
  where
    triangle (z:zs) = sum [0..z] : triangle zs

triangles'' = map (\x -> sum [0..x]) [0..]

triangles''' = foldr (\z rs -> (sum [0..z]):rs) [] [0..]
