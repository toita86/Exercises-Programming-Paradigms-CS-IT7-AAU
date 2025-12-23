{- 
Define a function amy that will tell us if any elements of a list satisfy a given predicate.

For instance, if
odd x = ( ( x ‘mod ‘ 2 ) == 1 )

then

amy odd [ 2 , 5 , 8 , 3 , 7 , 4 ]
should return True, whereas

amy odd [ 2 , 8 , 4 2 ]
should return False.
-}

odd' x = ( x `mod` 2 ) == 1

amy f [] = True
amy f (x:xs) = f x && amy f xs
