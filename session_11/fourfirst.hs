{- 
wo influencers were having a heated discussion about the List monad. Influencer 1 presented a
new function called fourfirst :

f o u r f i r s t xs = do
x <− xs
r e t u r n ( 4 , x )

”This function takes a list and gives us a pair (4, x) where x is the first element of the list”, the
first influencer said.
”You are wrong”, said Influencer 2. ”The code assigns xs to the variable x and we get a pair where
the first component is 4 and the second component is x, which is a list that is also known as xs.”
Explain, using the definition of the List monad but without executing the code, what this actually
does and why
-}

fourfirst xs = do 
  x <- xs
  return ( 4 , x )

fourfirst' ma = ma >>= \a -> 
                  return (4 , a)  

{- 
instance Monad [] where
-- (>>=) :: [a] -> (a -> [b]) -> [b]
xs >>= f = [y | x <- xs, y <- f x]

or 

xs >>= f = concat (map f xs)

following the definition of monad for list we can see that in both cases iterates over the entire
list and applies the return that is the creation of a tuple with 4 at the beginning.

for both definition xs is the list and f is the lambda function that returns the tuple
-}
 

