{-  
Let r be some given type. The function type constructor Arrow−r is defined such that
Arrow−r a will be (r −> a).
Define an instance of Functor for this type constructor.

In order to test your solution, add the following at the start of the file containing your
code:
import qualifiedPrelude
import P r e l u d e h i d i n g ( Functor , fmap )
-}
instance Functor ArrowR where 
  -- fmap :: (a -> b) -> Arrow-R a -> Arrow-R b
  fmap g arr =  g arr 
