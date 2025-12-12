{-
Here is a datatype definition. The intention is that we can use it to tell if the application of a function
on real numbers results in a meaningful result and that, if that is not the case, the value of the argument
that led to an error.

data Err a = Result a | Wrong Float deriving Show

The goal is now to turn Err into a monad such the we can compute logarithms and sums of logarithms
in a safe way.

The logarithm function (with base e) is called log in the Haskell prelude. From mathematics we know
that the logarithm log x is only defined if x is a positive real number.

1. Define a function safelog :: Float −> Err Float such that safelog x gives us Result r where r = log x
if x > 0 and Wrong x if x ≤ 0.

2. Define Err a to be a functor.

3. Define Err a to be an applicative functor.

4. We now define

instance Monad Err where
return = pure
(>>=) (Result x) g = g x
(>>=) (Wrong x) g = Wrong x

The goal is now to use safelog and do-notation to define a function safesum :: Float −> Float −>
Err Float.

The intention is that safesum will compute the sum of the logarithms of two numbers, if this result
is defined. Otherwise, we get the value of the first of the two arguments for which the logarithm is
not defined.

Thus, safesum 5 4 should give us Result 2.9957323. We should have that safesum (−5) 0 gives us
Wrong (−5.0) and that safesum 5 (−4) gives us Wrong (−4.0).

The definition of safesum must make use of the fact that Err a is a monad. Answers that do not
make use of this will get no credit.
-}

data Err a = Result a | Wrong Float deriving Show

safelog :: Float -> Err Float

safelog x | x > 0 = Result (log x)
          | otherwise = Wrong x 

instance Functor Err where
  fmap f (Result x) = Result (f x)
  fmap _ (Wrong x) = Wrong x

instance Applicative Err where
  pure = Result

  (Result g) <*> l = fmap g l
  _ <*> (Wrong x) = Wrong x 

instance Monad Err where
  return = pure
  (>>=) (Result x) g = g x
  (>>=) (Wrong x) g = Wrong x

safesum x y = do 
                logx <- safelog x
                logy <- safelog y
                return (logx + logy)
