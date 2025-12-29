{- 
Here is the declaration of a type WrapString and a declaration that makes it an instance of Functor. 

newtype WrapString a = WS ( a , S t r i n g ) d e r i v i n g Show

i n s t a n c e Functor WrapString where
  fmap f (WS ( x , s ) ) = WS ( f x , s )

a) Extend the above piece of code with an instance declaration such that WrapString becomes an applicative functor also.
b) Extend the above piece of code with an instance declaration such that WrapString becomes a monad also.
c) Use a do-block in the WS-monad that you now have to define a function pairup such that we have that pairup (WS (4,”horse”))(WS (5,”plonk”)) gives us WS ((4,5),”horse”).
-}
newtype WrapString a = WS ( a , String ) deriving Show

instance Functor WrapString where
  fmap f (WS ( x , s ) ) = WS ( f x , s )

instance Applicative WrapString where
  pure a = WS (a, "")

  (WS (f, _)) <*> (WS (a, s)) = WS (f a, s)

instance Monad WrapString where 
  return = pure

  (WS (a, s)) >>= f = let WS (b, s1) = f a in WS (b, s)

pairup w1 w2 = do 
                a <- w1
                b <- w2
                return (a, b)
