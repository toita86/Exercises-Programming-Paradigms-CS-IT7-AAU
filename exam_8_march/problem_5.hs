{- 
Here are four types. For each of them find a declaration or expression that has this type as its most
general type. In other words, no type annotations are to be used. For each type, explain if there is
polymorphism involved, if there is, if this is parametric or ad hoc-polymorphism.
1. Num b => a -> b -> ([a], b)
2. (t1 -> t2 -> t1 -> t3) -> t1 -> t2 -> t3
3. Maybe [p -> Bool]
4. (t1 -> a) -> t1 -> (t2 -> a) -> t2 -> Int
-}
-- Num b => a -> b -> ([a], b)
-- this function is parametric polymorphism constrained by ad-hoc polymorphism by the type class Num
fun1 a b = ([a], b + 1)

-- (t1 -> t2 -> t1 -> t3) -> t1 -> t2 -> t3
-- this funcition is parametric polymorphism only
fun2 f t1 t2 = f t1 t2 t1

-- Maybe [p -> Bool]
-- this expression is parametric polymorphism
-- Just [(\x -> True)]

-- (t1 -> a) -> t1 -> (t2 -> a) -> t2 -> Int
-- this funcition is parametric polymorphism only
fun3 f t1 h t2 = length [f t1, h t2]
