{- 
Create a function frequencies that, given a string s, creates a list of pairs [( x1,f1) ,....( xk,fk) ] such
that if the character xi occurs a total number of fi times throughout the list s, then the list of pairs
will contain the pair (xi , fi ).

As an example of this,
f r e q u e n c i e s ” r e g n i n g e r ”
should return the list
[ ( ’ r ’ , 2 ) , ( ’ e ’ , 2 ) , ( ’ g ’ , 2 ) , ( ’ n ’ , 2 ) , ( ’ i ’ , 1 ) ]

First find out what the type of the function should be
-}
-- frequencies :: Eq a => [a] -> [(b, Int)]

-- the list of tuples comes before the letter we want to insert because of the foldl that does things in the opposite way of foldr 
inserChar [] x = [(x, 1)]
inserChar ((l, n):xs) x = 
  if x == l 
    then (l, n + 1):xs 
  else (l, n) : inserChar xs x


-- frequencies [s] = inserChar s []
-- frequencies (s:xs) = inserChar s (frequencies xs)
-- this implementation is not correct beacuse is works like a foldr and the order of the letters is backwards

frequencies s = foldl inserChar [] s
