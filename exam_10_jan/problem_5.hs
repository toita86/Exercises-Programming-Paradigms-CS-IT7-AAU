-- 1. (Ord a, Num a) => a −> a −> a −> (a, a)
fun1 a b c = (max a b, b + c)

-- 2. [(Integer, p −> Char)]
fun2 = [(1, (\x -> 'c'))]

-- 3. (t1 −> Bool −> t2) −> t1 −> t2
fun3 f a = f a True 

-- 4. (Num a, Enum a) => [a]
fun4 a = [0..a] 
