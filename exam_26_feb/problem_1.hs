-- Ord d => d −> d −> (Bool, Bool, d, d)
fun1 d a = (True, False, max d a, a)

-- Num b => (a, [a]) −> ([a], b)
fun2 (a, [c]) = ([a,c], 3)

-- (a, b) −> p1 −> p2 −> p3 −> a
fun3 (a, b) x y z = a

-- [Char] −> ([Char], Bool)
fun4 ['a'] = (['b'], True)
