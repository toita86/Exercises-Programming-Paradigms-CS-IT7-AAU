data Onion a = Core a | Layer (Onion a) deriving Show

instance Functor Onion where
  -- fmap :: (a -> b) -> Onion a -> Onion b 
  fmap g (Core a) = Core (g a)
  fmap g (Layer o) = Layer (fmap g o)

instance Applicative Onion where 
  -- pure :: a -> Core a
  pure = Core

  -- (<*>) :: (a -> b) -> f a -> f b
  (Core g) <*> l = fmap g l
  (Layer g) <*> l = Layer(g <*> l)
