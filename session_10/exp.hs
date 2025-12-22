{- 
Here is a type declaration for simple expressions.
data Exp a = Var a | Val I n t e g e r | Add ( Exp a ) ( Exp a ) |
Mult ( Exp a ) ( Exp a ) d e r i v i n g Show

Show how do make this type into an instance of Functor.
When would it be useful to think of Exp a as a functor? Think of a good example!
-}
data Exp a = Var a | Val Integer | Add ( Exp a ) ( Exp a ) | Mult ( Exp a ) ( Exp a ) deriving Show

instance Functor Exp where 
  -- fmap :: (a -> b) -> f a -> f b
  fmap g (Var a) = Var (g a)  
  fmap _ (Val a) = Val a  
  fmap g (Add e1 e2) = Add (fmap g e1) (fmap g e2)
  fmap g (Mult e1 e2) = Mult (fmap g e1) (fmap g e2)

{- how how to make the type Exp from the previous problem into an instance of Applicative. -}

instance Applicative Exp where
  -- pure  :: a -> f a
  pure = Var
  --(<*>) :: f (a -> b) -> f a -> f b
  Var f <*> e = fmap f e 
  Val f <*> _ = Val f 
  Add f1 f2 <*> e = Add (f1 <*> e) (f2 <*> e)
  Mult f1 f2 <*> e = Mult (f1 <*> e) (f2 <*> e)

instance Monad Exp where
  return = Var

  Var x      >>= f = f x
  Val n      >>= _ = Val n
  Add e1 e2  >>= f = Add  (e1 >>= f) (e2 >>= f)
  Mult e1 e2 >>= f = Mult (e1 >>= f) (e2 >>= f)

