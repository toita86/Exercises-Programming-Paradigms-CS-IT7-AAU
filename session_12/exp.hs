{-
Here is a type declaration for simple expressions.

data Exp a = Var a | Val Integer | Add (Exp a) (Exp a) | Mult (Exp a) (Exp a) deriving Show

Show how do make this type into an instance of Functor.
When would it be useful to think of Exp a as a functor? Think of a good example
-}

data Exp a = Var a | Val Integer | Add (Exp a) (Exp a) | Mult (Exp a) (Exp a) deriving Show

instance Functor Exp where
  -- fmap :: (a -> b) -> Exp a -> Exp b
  fmap f (Var a) = Var (f a)
  fmap f (Val a) = Val a
  fmap f (Add ex1 ex2) = Add (fmap f ex1) (fmap f ex2)
  fmap f (Mult ex1 ex2) = Mult (fmap f ex1) (fmap f ex2)

myExp = Add (Var "x") (Val 7)
s "x" = 17

-- fmap s myExp
