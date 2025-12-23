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

insertChar x [] = [(x, 1)]
insertChar x ((v,n):xs) | x == v = (x,n+1):xs
                        | otherwise = (v,n):insertChar x xs


frequencies (x:xs) = fr (insertChar x []) xs
  where
    fr acc [] = acc 
    fr acc (y:xs) = fr (insertChar y acc) xs
