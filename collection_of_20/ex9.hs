{- 
The set of perfect cubes is the set of natural numbers that are of the form n3 for some n ∈ N, i.e.
the infinite set
{1, 8, 27, 54, . . .}
a) Using Haskell, define the infinite list cubes whose elements are the perfect cubes. What is the type of cubes?
b) Given a natural number n, the integral cube root of n is the greatest natural number i such that i3 ≤ n. As an example, the integral cube root of 9 is 2, since 23 = 8 but 33 = 27.
Use list comprehension in Haskell to define the function icr that for any natural number will compute its integral cube root. What is the type of icr ?

c) Use foldr to define the function sumcubes that computers the sum of the first n cubes for any given n. For instance, we should have that sumcubes 3 returns 36
-}

-- [Integer]
cubes = [i^3 | i <- [1..]]

-- icr :: Integer -> Int 
icr n = findCube n cubes 0
  where
    findCube n cubes i | (cube i) <= n = findCube n cubes (i + 1) 
                       | otherwise = i
    cube i = cubes !! i

sumcubes n = foldr (+) 0 (take n cubes)
