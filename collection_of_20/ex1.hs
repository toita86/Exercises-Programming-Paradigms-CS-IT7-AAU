{- Below are five types. For each of them, define a Haskell value (which may be a function) that has
this particular type as their most general type.
a) Ord a =>(a, a) −> String −> Integer
b) Bool −> p −> p
c) (Ord a1, Eq a2) =>a2 −> a2 −> (a1, a1)−> a1
d) Show a1 =>[a2] −> a1 −> IO ()
e) ((a1, a1), b) −> [a2] −> ((a1, b)−> [a3]) −> [a3]
Moreover, for each of these four types also indicate if the type involves
• parametric polymorphism only
• overloading (ad hoc-polymorphism) only
• both forms of polymorphism
• no polymorphism
Do not annotate your expressions and values with types. The types must be the ones found by
GHCi using type inference.
-}

fun1 (a,b) "str" = if a > b then 1 else 3

fun2 True p = p

fun3 a b (c,d) = if a == b && length [a,b] > 0 && c > d then c else d

fun4 [a] b = print b

fun5 ((l1, l2), r) [] f = res
                        where
                            typeList = [l1, l2]
                            res = f (l1, r)
                            last = head res


