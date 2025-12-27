{- 
The goal of this problem is to define a function pairm that will take an element x and a list ys and will return a list of pairs where the first component of each pair is x and the second component is an element of ys that is different from x. The second components must appear in the same order as they appeared in xs.

As an example, pairm 1 [3,4,1,5,1,8] should give us [(1,3),(1,4),(1,5),(1,8)]. As another example, pairm
”plip” [”plop”,”plip”,”plap”,”plup”] should give us [(”plip”,”plop”),(”plip”,”plap”),(”plip”,”plup”)].

1. Is pairm polymorphic? Give a precise explanation in a comment.

2. Define pairm using recursion.

3. Define pairm using list comprehension and with no use of recursion.

4. Define pairm using higher-order functions and with no use of recursion
-}

pairm y (x:[]) = if x == y then [] else [(y, x)]
pairm y (x:xs) = if y == x then (pairm y xs) else (y, x):(pairm y xs)

pairm' y xs = [(y, x) | x <- xs, x /= y]

pairm'' y xs = foldr (\x acc -> if x /= y then (y, x):acc else acc) [] xs
