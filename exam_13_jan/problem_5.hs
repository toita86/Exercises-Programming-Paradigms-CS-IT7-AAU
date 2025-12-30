{- 
The goal of this function is to define a functor instance for a type and prove a property of the definition that you make.

Here is a type declaration.

newtype Funpair a = Fun (Bool −> a, String −> a)

1. Give an example of an expression in Haskell that has type Funpair Integer.

2. Show how to define Funpair to be a functor.

3. Show that the functor law
fmap id = id
holds for your definition
-}

newtype Funpair a = Fun (Bool -> a, String -> a) 

ex = Fun ((\x -> if x then 1 else 0),(\y -> length y ))

instance Functor Funpair where 
  fmap f (Fun (a, b)) = Fun (f.a, f.b)

-- to prove the functor law that `fmap id = id`
-- assuming that that we have an expression x = Fun (f,h)
-- if we appli the fmap id x we have Fun (id.f, id.h) that returns Fun (f,h) 
-- Now if we do `id x` we have Fun (f,h) and this prove our initial equaiton.
