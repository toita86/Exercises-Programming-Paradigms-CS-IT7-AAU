{- 
Here is a function readNumber that takes an s of type String and returns a value of type Maybe Int.
It will evaluate to Nothing if s does not represent a valid integer.

readNumber : : S t r i n g −> Maybe I n t
readNumber s = c a s e r e a d s s o f
[ ( n , ” ” ) ] −> J u s t n
x −> Nothing

As an example, we have that readNumber ”484000’’ will evaluate to Just 484000, and we have that readNumber ”plip’’ will evaluate to Nothing.

a) Use do-notation and the function readNumber to define a function add that takes two Maybe Int values. If the two values represent numbers, the function must return a value of type Maybe Int. If one or both arguments is Nothing, the result must be Nothing
Your solution must not use pattern matching or local declarations, only the usual constructs of do-notation.

b) Use do-notation and the function readNumber to create a function readAndAdd that takes two arguments of type String. If the two arguments represent numbers, the function must return a value of type Maybe Int. If one or both arguments is Nothing, the result must be
Nothing

The function should behave as follows.
> readAndAdd ” 5 ” ” 3 ”
Just 8
> readAndAdd ” 5 ” ” abc ”
Nothing

Again, your solution must not use pattern matching or local declarations, only the usual constructs of do-notation.
-}

readNumber :: String -> Maybe Int
readNumber s = case reads s of
                              [(n, "")] -> Just n
                              x -> Nothing

add a b = do 
           n1 <- a 
           n2 <- b 
           return (n1 + n2)

readAndAdd a b = do 
           n1 <- readNumber a
           n2 <- readNumber b
           return (n1 + n2)
