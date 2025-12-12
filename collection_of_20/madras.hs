{-
Here is the definition of a Haskell function.
madras (f,x,y) = f (f x x) y
Give a curried version of madras that has type (t −> t −> t)−> t −> t −> t,
-}
madras f x y = f (f x x) y
