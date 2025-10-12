{- 
define a Haskell function triples that takes a list of tuples (each tuple has exactly 3 elements)
and converts that list of tuples into a tuple of lists.
triples [(1,2,3) , (4, 5, 6), (7, 8, 9)] should produce ( [1,4,7], [2, 5, 8], [3, 6, 9] ).
The minister wrote the following piece of code and a type specification but ran into problems. What
seems to be wrong?

t r i p l e s : : Num a => [ ( a , a , a ) ] −> ( [ a ] , [ a ] , [ a ] )
t r i p l e s [ ] = ( )
t r i p l e s [ ( a , b , c ) ]= ( [ a ] , [ b ] , [ c ] )
t r i p l e s ( x : xs , y : ys , z : z s ) = [ x , y , z ] : T r i p l e s [ ( xs , ys , z s ) ]
-}

-- ((1:3:6:[]),(2:4:7:[]),(3:5:8:[]))

triples [] = ([], [], [])
triples ((a,b,c):xs) = (a:as,b:bs,c:cs)        
               where (as,bs,cs) = triples xs    
