{- 
A list xs = [x1, . . . , xk] is a prefix of the list ys if we have that ys = xs or ys = [x1, . . . , xk, y1, . . . , ym],
that is, if ys consists of at least the elements of xs, possibly followed by more elements. As an
example, [3,4,5] is a prefix of [3,4,5,6,484000] . As another example, [] is a prefix of [True,False].

a) Define a function prefix that will tell us if a list is a prefix of another list. Is prefix polymor-
phic? Why and how?

A list xs is found within the list ys if there exist lists z1 and z2 (one or both of which may be empty)
such that ys = z1 ++ xs ++ z2. As an example, [3,4,5] is found within [1,2,3,4,5,6,484000] . As
another example, [ False , False ] is found within [True,False, False ,True].

b) Use prefix to define a function fwin that will tell us if a list is found within another list. Is
fwin polymorphic? Why and how?
-}

-- is ad-hoc polymorphysm beacuse the values need the Eq classtype 
prefix [] _ = True 
prefix _ [] = False
prefix (x:xs) (y:ys) = if x == y then prefix xs ys else False 

-- same goes for fwin that calls prefix because inherits from prefix
fwin _ [] = False
fwin xs (y:ys) = prefix xs (y:ys) || fwin xs ys
