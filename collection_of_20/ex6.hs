{- 
Let l = [x1, . . . , xn] be a list of numbers. The squared norm of l is defined by

norm l = \sum^n_i=1 (x_i)2

As an example, norm [1, 3, 5, 6] = 12 + 32 + 52 + 62 = 71.
Your task is to defined a Haskell function norm that computes the norm of any given list of numbers.

a) What is the type of norm? Is norm a polymorphic function? If yes, explain if and why it is
ad hoc or parametric polymorphic. If no, explain why it is not polymorphic.
b) Give a definition in Haskell of norm that uses recursion.
c) Give a definition in Haskell of norm (called norm’) that uses foldr or foldl .

Now consider two lists of numbers, l1 = [x1, . . . , xn],and l2 = [y1, . . . , yn]. We assume that l1 and
l2 have the same length. The squared distance dist(l1, l2) between the lists is defined by

dist l1 l2 = \sum^n_i=1 (x_i − y_i)2

If l1 and l2 do not have the same length, the squared distance is not defined.
d) Give a definition of dist in Haskell.
-}

-- norm :: Num a => [a] -> a
-- norm is a polymorphic function using parametric polymorphism, constrained by ad-hoc polymorphism via the type class Num
norm [] = 0
norm (l:ls) = (l^2) + norm (ls)

norm' ls = foldr (\l acc -> (l^2) + acc) 0 ls

dist [] [] = 0
dist (x:l1) (y:l2) = (x - y)^2 + dist l1 l2 
