{- 
Here is the declaration of a type WrapString and a declaration that makes it an instance of Functor.
newtype WrapString a = WS (a,String) deriving Show
instance Functor WrapString where
fmap f (WS (x,s)) = WS (f x,s)

1. Extend the above piece of code with an instance declaration such that WrapString becomes an
applicative functor also.

2. Extend the above piece of code with an instance declaration such that WrapString becomes a monad
also.

3. Use a do-block in the WS-monad that you now have to define a function pairup such that we have
that pairup (WS (4,”horse”)) (WS (5,”plonk”)) gives us WS ((4,5),”horse”).
-}
newtype WrapString a = WS (a,String) deriving Show

instance Functor WrapString where
  fmap f (WS (x,s)) = WS (f x,s)

instance Applicative WrapString where
  pure a = WS (a, "") 

  (WS (f, s)) <*> (WS (x, xs)) = WS (f x, s)  

instance Monad WrapString where
    return x = WS (x, "")
    (WS (x, s)) >>= f = let (WS (y, s')) = f x in WS (y, s)

pairup a b = do
    x <- a
    y <- b
    return (x, y)            
