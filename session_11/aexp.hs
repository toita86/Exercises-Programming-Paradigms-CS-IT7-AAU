data Aexp = N (Maybe Integer) | Var (Maybe String) | Add Aexp Aexp | Mul Aexp Aexp deriving Show

instance Functor Aexp where
  fmap g (N a) = N (g a)
  fmap g (Var a) = Var (g (look))
  fmap g (Add o) = Add (fmap g o)


--  2 + (x + (9 * 3))
myExpr = Add (N (Just 2)) (Add (Var (Just"x")) (Mul (N (Just 9)) (N (Just 3)))) 

-- look :: Eq a => a -> [(a,b)] -> b
look var ((v,x):xs) = do
  va <- var
  if v == va then x else look var xs 

-- eval :: Aexp -> [(String,Int)]-> b
eval (Var x) as = look x as
eval (N x) _ = x

eval (Add x y) as = eval x as + eval y as
eval (Mul x y) as = eval x as * eval y as
