{- 
The base of the natural exponential function e = 2.718 . . . can be written as the limit of the infinite
series ∞X
k=0
1
k!
The function approx should give us the approximation of e that we find by adding the first n terms
of this infinite series. That is,
approx n =
nX
k=0
1
k!
Define approx using the higher-order functions in Chapter 7; the factorial function k! is defined by
f a c t k = product [ 1 . . k ]
-}

fact k = product [1..k]

approx n = foldr (\k acc -> 1/ fact k + acc) 0 [0..n]

approx' n = sum (map (\x -> 1/fact x) [0..n])

approx'' n = sum (terms n )
          where
            terms n = map rep [0..n]
            rep k = 1/(fact' k)
            fact' x = product [1..x]
