{- 
1. Define a function
```Haskell
tuple :: Monad m => m a −> m b −> m( a , b )
```
using explicit (`>>=`) and then again, now using do-notation. What does the function do in the
case, where the monad is Mambbe?
-}
-- tuple :: Monad m => m a −> m b −> m (a , b)
tuple ma mb = ma >>= \a ->
              mb >>= \b -> 
              return (a,b)

tuple' ma mb = do
                a <- ma
                b <- mb
                return (a,b)
            
