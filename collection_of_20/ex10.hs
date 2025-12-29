{- 
Here is a small piece of Haskell code for defining nested pairs.
data N e s t i n g a b = S ( a , b ) | C ( N e s t i n g a b , N e s t i n g a b )

a) What is the correct terminology for the Haskell concept of which Nesting is an example?

b) What is the correct terminology for the Haskell concept of which S is an example?
c) Here is a Haskell expression.

C (C( S ( True , True ) ,C( S ( True , True ) , S ( True , F a l s e ) ) ) , S ( True , F a l s e ) )

We say that its nesting depth is 3, since every subexpression is found within no more than 3
nested C’s.

Define a depth function that computes the nesting depth of any expression that has type Nesting a b for any a and b and give the type of the depth function.
-}

data Nesting a b = S ( a , b ) | C ( Nesting a b , Nesting a b )

-- Neting is a recursive algebraic datatype 
-- S is contrusctor of the datatype Nesting

e = C(
      C(
        S(True ,True),
        C(
          S(True, True),
          S(True, False)
        )
      ), 
      S(True, False)
     )

-- depth :: (Num a1, Ord a1) => Nesting a2 b -> a1
depth (S _) = 0
depth (C (a,b)) = 1 + (if da > db then da else db) 
  where 
    da = depth a 
    db = depth b
