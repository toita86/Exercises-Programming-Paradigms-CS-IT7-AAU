{- 
Let l = [x1 , . . . , xn ] be a list of numbers. The squared norm of l is defined by

norm l = sum^n_{i=1} (x_i)^2

As an example, norm [1, 3, 5, 6] = 12 + 32 + 52 + 62 = 71.
Your task is to defined a Haskell function norm that computes the norm of any given list of numbers.

1. What is the type of norm? Is norm a polymorphic function? If yes, explain if and why it is ad hoc or parametric polymorphic. If no, explain why it is not polymorphic.

2. Give a definition in Haskell of norm that uses recursion.

3. Give a definition in Haskell of norm (called norm’) that uses foldr or foldl.

Now consider two lists of numbers, l1 = [x1 , . . . , xn ],and l2 = [y1 , . . . , yn ]. We assume that l1 and l2 have the same length. The squared distance dist(l1 , l2 ) between the lists is defined by

dist l_1 l_2 = sum^n_{i=1} (x_i - y_i)^2

If l1 and l2 do not have the same length, the squared distance is not defined.
4. Give a definition of dist in Haskell.
-}
-- norm :: Num a => [a] -> a
-- the function norm uses parametric polymorphism constrained ad-hoc polymorphism by a type class Num

norm [] = 0
norm (x:xs) = (x^2) + norm xs

norm' xs = foldr (\x acc -> (x^2) + acc) 0 xs

dist l1 l2 = sum (map (^2) (zipWith (-) l1 l2)) 
