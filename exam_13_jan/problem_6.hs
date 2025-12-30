{- 
The goal of this function is to complete the definition of a monad and define two functions that involve this monad.
Below is a piece of Haskell code.

data W x = Bingo x deriving Show

instance Functor W where
  fmap f (Bingo x) = Bingo (f x)

instance Monad W where
  return x = Bingo x
  Bingo x >>= f = f x

1. For this to make sense, a definition of W as an applicative functor is missing. Write such a definition.

2. Use do-notation to define a function wrapadd :: Int −> W Int −> W Int which satisfies that

wrapadd x (Bingo y) = Bingo (x+y)

3. Use do-notation to define a function h :: W Int −> W Int −> W Int which satisfies that

h (Bingo x) (Bingo y) = Bingo (x∗y)
-}

data W x = Bingo x deriving Show

instance Functor W where
  fmap f (Bingo x) = Bingo (f x)

instance Applicative W where 
  pure = Bingo

  (Bingo f) <*> g = fmap f g

instance Monad W where
  return x = Bingo x
  Bingo x >>= f = f x

wrapadd x by = do 
  y <- by
  return (x + y)

h bx by = do 
  x <- bx
  y <- by
  return (x*y)

-- ghci> h (Bingo 5) (Bingo 5)
-- Bingo 25
-- ghci> Bingo (5*5)
-- Bingo 25
