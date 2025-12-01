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

instance Monad Onion where
  return = pure
  -- >>= :: M a -> (a -> M b) -> M b
  (Core a) >>= f = f a
  (Layer a) >>= f = Layer (a >>= f)

combineOnion a b = do
  ca <- a
  cb <- b
  return (ca, cb)

onionA = Layer(Layer(Core 1)) 
onionB = Layer(Core 2)

-- main :: IO ()
-- main  =
--   do
--     let on1 = Layer (Core 5)
--     print ( on1 >>= (\x -> Core (x + 1)) )
