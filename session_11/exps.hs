{- 
2. What is the expression (that uses (`>>=`) that is equivalent to the following do block? (You will
have to look up the definition of (`>>=`))
```Haskell
do y <− z
s y
return ( f y )
```
-}

func z = z >>= (\y ->
          s y >>= (\_ ->
            return (f y))
