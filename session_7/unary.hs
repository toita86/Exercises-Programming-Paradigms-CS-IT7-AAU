{-
The natural number n can be represented as n successive I’s and a Z, so e.g. 4 is represented in unary notation as IIIIZ.  
The natural number 0 is represented as Z.

Define a recursive datatype Unary for unary numerals and use your type definition to define a function `unary2int` of type:

```haskell
unary2int :: Unary -> Integer
```

that finds the natural number represented by a given number.  
As an example, unary IIIIZ should give us 4. 
-}

data Unary = Z | I Unary deriving Show 

string2unary :: String -> Unary
string2unary "IZ" = I Z 
string2unary (x:xs) = I (string2unary xs)


unary2int :: Unary -> Integer
unary2int Z = 0
unary2int (I r) = 1 + unary2int r

-- usage
-- unary2int (I (I (I Z)))
-- or
-- unary2int (string2unary "IIIZ")
