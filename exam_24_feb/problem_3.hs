{- 
The goal of this problem is to define values, given specifications of them in the form of types.
Below are four types. For each of them, define a Haskell value (which may be a function) that has this particular type as their most general type.

1. Ord a => (a, a) −> String −> Integer
2. Bool −> p −> p
3. Show a1 => [a2] −> a1 −> IO ()
4. ((a1, a1), b) −> [a2] −> ((a1, b) −> [a3]) −> [a3]

Moreover, for each of these four types also indicate if the type involves
• parametric polymorphism only
• overloading (ad hoc-polymorphism) only
• both forms of polymorphism
• no polymorphism
-}
-- Ord a => (a, a) −> String −> Integer
-- is parametric polymorphism constrained with ad-hoc by the typeclass Ord 
fun1 (a, b) "pippo" = if a > b then 2 else 1

-- Bool −> p −> p
-- parametric polymorphism for p and no polymorphism for Bool
fun2 True p = p

-- Show a1 => [a2] −> a1 −> IO ()
-- is parametric polymorphism constrained with ad-hoc by the typeclass Show 
fun3 [a2] a1 = print a1


-- ((a1, a1), b) −> [a2] −> ((a1, b) −> [a3]) −> [a3]
-- is just parametric polymorphism
fun4 ((a, c), b) [p] f = if length [a,c] > 0 then take 3 (f (a,b)) else take 6 (f (a,b))
