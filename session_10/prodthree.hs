{- 
Use the fact that the list type can be seen as an applicative functor to define
a function prodthree that takes three lists of numbers and computes the list of all products
of triples of numbers in the list. As an example, prodthree [1,2,3] [4,5,6] [7,8,9] should
give us the list
[ 2 8 , 3 2 , 3 6 , 3 5 , 4 0 , 4 5 , 4 2 , 4 8 , 5 4 , 5 6 , 6 4 , 7 2 , 7 0 , 8 0 , 9 0 , 8 4 , 9 6 , 1 0 8 , 8 4 , 9 6 , 1 0 8 ,
1 0 5 , 1 2 0 , 1 3 5 , 1 2 6 , 1 4 4 , 1 6 2 ]
Hint: Somewhere a funny star keeps shining.
-}

prodthree a b c = pure (\x y z -> x * y * z) <*> a <*> b <*> c


