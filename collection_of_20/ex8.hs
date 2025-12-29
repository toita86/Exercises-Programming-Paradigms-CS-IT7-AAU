{- 
A triangular number counts the number of dots arranged in an equilateral triangle. The nth triangular number Pn is the number of dots in the triangular arrangement with n dots on each side, and is equal to k=1 k, that is, the sum of the n natural numbers from 1 to n.
The infinite sequence of triangular numbers, starting with the 0th triangular number, starts as follows.

0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55 . . .

a) Give a definition in Haskell of the infinite list triangles of triangular numbers that uses list comprehension only, but not recursion.

b) Give a definition of the infinite list triangles ’ of triangular numbers that uses recursion, but not list comprehension.

c) Give a definition of the infinite list triangles ’’ of triangular numbers that uses higher-order functions (but no recursion or list comprehension).
-}
triangles = 0:[sum [k | k <- [1..n]] | n <- [1..]]


triangle n = if n > 0 then n:(triangle (n - 1)) else [0]

triangles' = helper 0
  where 
    helper n = (sum (triangle n)):(helper (n + 1)) 

triangles'' = 0:foldr tri [] [1..]
  where   
    tri x acc = (sum [1..x]):acc
