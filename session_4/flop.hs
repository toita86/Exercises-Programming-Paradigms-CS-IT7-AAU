{- 
se list comprehension to define a function flop that, when given a list of pairs returns a list of pairs
whose components are reversed. The list can be empty.
For example, flop [(1,’ a’) ,(3,’ r ’) ,(9,’ e ’) ] should return the list [(’ a ’,1) ,(’ r ’,3) ,(’ e ’,9) ].
What is the type of flop?
-}

flop :: [(a,b)] -> [(b,a)]

flop [] = []
flop ((a,b):xs) = (b,a) : flop xs 
