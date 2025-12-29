{- 
The goal of this problem is to complete the definition of a monad and define two functions that
involve this monad.

Below is a piece of Haskell code.

data W x = Bingo x d e r i v i n g Show

i n s t a n c e Functor W where
  fmap f ( Bingo x ) = Bingo ( f x )
i n s t a n c e Monad W where
  r e t u r n x = Bingo x
  Bingo x >>= f = f x

a) For this to make sense, a definition of W as an applicative functor is missing. Write such a definition.
b) Use do-notation to define a function wrapadd :: Int −> W Int −> W Int which satisfies that wrapadd x (Bingo y) = Bingo (x+y)
c) Use do-notation to define a function h :: W Int −> W Int −> W Int which satisfies that h (Bingo x) (Bingo y) = Bingo (x∗y)
-}

data W x = Bingo x deriving Show

instance Functor W where
  fmap f ( Bingo x ) = Bingo ( f x )

instance Applicative W where 
  pure = Bingo

  (Bingo f) <*> (Bingo a) = Bingo (f a)

instance Monad W where
  return x = Bingo x
  Bingo x >>= f = f x

wrapadd val bin = do 
                   y <- bin
                   return (val + y)

h binx biny = do 
              x <- binx
              y <- biny
              return (x * y)
