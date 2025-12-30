{- 
The goal of this problem is to define values, given specifications of them in the form of types.
Below are four types. For each of them, define a Haskell value (which may be a function) that has this particular type.

1. (Eq a, Num a) => a −> a −> [b] −> (b, b)
2. (Show a, Fractional a) => p −> a −> [Char]
3. [a] −> [a] −> [a]
4. (t1 −> t2) −> ((b, b) −> t1) −> b −> t2

For each of these four types indicate if the type involves
• parametric polymorphism only
• overloading (ad hoc-polymorphism) only
• both forms of polymorphism
-}

-- (Eq a, Num a) => a −> a −> [b] −> (b, b) is parametric but constricted by ad-hoc polymorphism by the type classes Eq and Num 
fun1 a c [b] = if a == c && a+c == 3 then (b,b) else (b,b)

-- (Show a, Fractional a) => p −> a −> [Char] is parametric for the funciton but constricted by the type classes Show and Fractional.
fun2 p a = show (a * 0.5) 

-- [a] −> [a] −> [a] only parametric polymorphism
fun3 [a] [b] = [a,b]

-- (t1 −> t2) −> ((b, b) −> t1) −> b −> t2
-- this function is parametric polymorphism
fun4 f h b = f t1
  where 
   t1 = h (b, b) 
