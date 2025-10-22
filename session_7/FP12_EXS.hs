data Nat = Zero | Succ Nat

toNat :: Int -> Nat
toNat 0 = Zero
toNat n = Succ (toNat (n - 1))

fromNat :: Nat -> Int
fromNat Zero = 0
fromNat (Succ n) = 1 + fromNat n

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n) 

mult :: Nat -> Nat -> Nat
mult Zero n = Zero
mult (Succ n) m = add (mult m n) m

data Expr = Val Int | Add Expr Expr | Mul Expr Expr

eval :: Expr -> Int
eval (Val n) = n
eval (Add x y) = eval x + eval y
eval (Mul x y) = eval x * eval y

-- folde id f1 = 
-- eval' = folde id (+)

data Tree a = Leaf a | Node (Tree a) (Tree a)
