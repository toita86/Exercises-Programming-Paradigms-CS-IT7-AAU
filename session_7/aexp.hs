{- 
Define a Haskell datatype Aexp for arithmetic expressions with addition, multiplication, numerals
and variables. The formation rules are
E ::= n | x | E1 + E2 | E1 · E2
Assume that variables x are strings and that numerals n are integers.Node
-}

data Aexp = N Integer | Var String | Add Aexp Aexp | Mul Aexp Aexp deriving Show

--  2 + (x + (9 * 3))
myExpr = Add (N 2) (Add (Var "x") (Mul (N 9) (N 3))) 

{- 
Use your Haskell datatype from the previous problem to define a function eval that can, when given a term of type Aexp and an assignment ass of variables to numbers compute the value of the expression.

As an example, if we have the assignment [x → 3, y → 4], eval should tell us that the value of 2 · x + y is 10.
Hint: An assignment is a function. How can you represent?
-}
-- look :: Eq a => a -> [(a,b)] -> b
look var ((v,x):xs) = if v == var then x else look var xs 

-- eval :: Aexp -> [(String,Int)]-> b
eval (Var x) as = look x as
eval (N x) _ = x

eval (Add x y) as = eval x as + eval y as
eval (Mul x y) as = eval x as * eval y as

