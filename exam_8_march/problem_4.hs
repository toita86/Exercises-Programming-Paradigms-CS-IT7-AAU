{- 
Here are the formation rules for the set of plus-expressions.
e ::= x | n | e1 + e2
where x represents a variable which is a string and n represents an integer numeral.

1. Define a type PExp for plus-expressions.

2. A state is a function that maps variables to integer values. Not all variables need to have a value assigned to them. An example of a state is s0 where s0 x 7→ 4 and s0 y 7→ 5 and the value of all other variables is undefined.

Define a type State that is the type of states.

3. The valuation eval is a function that takes a plus-expression e and a state s and returns the value of e if the value of the plus-expression is defined. As an example, the value of x + y in the state s0 defined above is 9, whereas the value of 4 + z in the state s0 is not defined, since z is not in the domain of s0 .

Use the Maybe monad to define the function eval.
-}

data PExp = Var String | Val Integer | Plus PExp PExp deriving Show

type State = String -> Maybe Int

s0 "x" = Just 4
s0 "y" = Just 5
s0 _   = Nothing

eval (Val n) _ = Just n 
eval (Var x) s = s x
eval (Plus xe ye) s = do 
  x <- eval xe s
  y <- eval ye s
  return (x + y)
