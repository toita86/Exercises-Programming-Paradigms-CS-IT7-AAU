data W x = Bingo x deriving Show

instance Functor W where
    fmap f (Bingo x) = Bingo (f x)

instance Monad W where
    return = pure
    Bingo x >>= f = f x

{- 
a. For this to make sense, a definition of W as an applicative functor is missing. Write such a
definition 
-}

instance Applicative W where
    pure = Bingo 

    -- (<*>) :: (a -> b) -> f a -> f b
    (Bingo g) <*> l = fmap g l 

{-
b. A major clothing company sponsors a popular TV show and asked the star of the show to define
a function wrapadd :: Num b =>b −> W b −> W b which satisfies that

wrapadd (Bingo x)(Bingo y) = Bingo (x+y)

and to make use of the fact that W is monad. 
The definition was to be used in advertisements on social media for a series of new jackets.
The TV star came up with the definition

wrapadd x ( Bingo y ) = do
Bingo ( x+y )

However, the clothing company complained that this definition was clumsy – it did not use
monads in a sensible way. The TV star was asked to revise the definition. 

What is wrong with it?
-}
wrapadd a wb = do 
  b <- wb
  return (a + b)
