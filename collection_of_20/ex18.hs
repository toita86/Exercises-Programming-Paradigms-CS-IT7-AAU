{- 
The goal of this problem is to define a functor instance for a type and prove a property of the definition that you make.
Here is a type declaration.

newtype Funpair a = Fun ( Bool −> a , S t r i n g −> a )

a) Give an example of an expression in Haskell that has type Funpair Integer.

b) Show how to define Funpair to be a functor.

c) Show that the functor law

fmap id = id

holds for your definition.
-}

newtype Funpair a = Fun ( Bool -> a , String -> a ) 

ex = Fun (\b -> if b then 1 else 0, \"hi" -> 5)

instance Functor Funpair where 
  fmap f (Fun (a, b)) = Fun (f.a, f.b)
