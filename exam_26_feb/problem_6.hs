{- 
Below is the declaration of a type Age and a declaration that makes it an instance of Functor. The idea
is that data can be classified as old or new.
data Age a = New a | Old a deriving Show
instance Functor Age where
fmap f (New x) = New (f x)
fmap f (Old x) = Old (f x)

1. Extend the above piece of code with an instance declaration such that Age becomes an applicative functor also. An element that we wrap in this type becomes classified as new, if we apply a new
function to it. Applying a function that is classified as old will always give us a value, that becomes classified as old.
2. Extend the above piece of code with an instance declaration such that Age also becomes a monad.
3. Use a do-block in the Age-monad to define a function

rejuvenate :: Ord b => Age b −> Age b −> Age b

which, given two values of type Age b where b is a type in Ord gives us the minimum value and re-classifies this minimum value to new.
rejuvenate (New 4) (New 8) should give us New 4 and rejuvenate (Old ”ab”) (Old ”aa”) should give us New ”aa’’.
-}

data Age a = New a | Old a deriving Show

instance Functor Age where
  fmap f (New x) = New (f x)
  fmap f (Old x) = Old (f x)

instance Applicative Age where
  pure = New

  (Old f) <*> (New a) = Old (f a)
  (New f) <*> (Old a) = New (f a)
  (New f) <*> (New a) = New (f a)
  (Old f) <*> (Old a) = Old (f a)

instance Monad Age where 
  return = pure

  (Old a) >>= f = f a
  (New a) >>= f = f a

rejuvenate a b = do 
                 age1 <- a 
                 age2 <- b 
                 return (min age1 age2)
