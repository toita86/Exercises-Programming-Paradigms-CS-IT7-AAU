{- 
Tere is a function sums whose definition has one single use of list comprehension.

sums m n = [ x+y | x <− [ 1 . .m] , y <− [ 1 . . n ] ]

The list comprehension in this definition uses two generators. Write an alternative definition of sums that only uses list comprehensions (so you may need more than one instance of list comprehension) with one generator each. 

Hint: The concat function from Chapter 5 will also be useful here.
-}


sums m n = concat [ [x + y | y <- ys] | x <- xs ]
  where
    xs = [1..m]
    ys = [1..n]

