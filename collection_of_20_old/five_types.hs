{-
Below are five types. For each of them, define a Haskell value (which may be a function) that has
this particular type as their most general type

Ord a =>(a, a) −> String −> Integer                   is ad-hoc only 
Bool −> p −> p                                        is parametric  
(Ord a1, Eq a2) =>a2 −> a2 −> (a1, a1)−> a1           is ad-hoc only
Show a1 =>[a2] −> a1 −> IO ()                         is parametric
((a1, a1), b) −> [a2] −> ((a1, b) −> [a3]) −> [a3]     is parametric

Moreover, for each of these four types also indicate if the type involves
• parametric polymorphism only
• overloading (ad hoc-polymorphism) only
• both forms of polymorphism
• no polymorphism
-}

fun1 (a,b) s = if a > b && s == "" then 10^100 else 10^100

fun2 a p = if a then p else p

fun3 a v (c, d) = if v == a && c > d then c else d    

fun4 [p] v = print 

fun5 ((l1, l2), r) [] f = res
                        where
                            typeList = [l1, l2]
                            res = f (l1, r)
                            last = head res
