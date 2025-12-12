{- 
We can define the following:
x = 1 : (map (1+) x )
and then evaluate take 5 x.

One might think that in fact the following happens:
t a k e 5 x

= t a k e 5 ( 1 : 2 : map (+1) x )
= t a k e 5 ( 1 : 2 : map (+1) [ 1 , 2 ] )
= t a k e 5 ( 1 : 2 : 2 : 3 : map (+1) x )
= t a k e 5 ( 1 : 2 : 2 : 3 : map (+1) [ 1 , 2 , 2 , 3 ] )
= t a k e 5 ( 1 : 2 : 2 : 3 : 2 : 3 : 3 : 4 : map (+1) x )
. . .

Explain precisely why this is wrong. 
Saying that ”That is because the Haskell interpreter gives
a different result” is not a valid answer – you have to provide an evaluation sequence as the ones
presented in the text for today. 
-}


x = 1 : (map (1+) x )

-- take 5 x
-- = take 5 (1 : map (+1) x)
-- = take 5 (1 : map (+1) (1: map(+1) x))
-- look at slides the take function has a decreasing number
