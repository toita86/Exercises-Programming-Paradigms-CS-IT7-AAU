{-
Below are four types. For each type, find an expression or definition that 
will have this particular type as its most general type if you use type inference.

In each case, explain if the expression or definition is polymorphic 
and if it is, in which way it is polymorphic.

1. a −> b −> [(a, b)] −> [(a, b)]
2. Num a => a −> a −> (a, [a])
3. (Ord a, Num a) => ([Char], a −> Bool)
4. [[Char] −> [Char]]
-}

fun1 a b xs = (a,b):xs -- parametrict polymorphysm

fun2 a b = (a, [b + a]) -- ad-hoc polymorphysm only

ex1 = (['a'], \x -> x < x*x) -- ad-hoc polymorphysm  

ex2 = [\[a] -> a:['b']] -- monomorphic
