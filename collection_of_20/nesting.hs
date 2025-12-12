{- 
Here is a small piece of Haskell code for defining nested pairs.
data Nesting a b = S ( a , b ) | C ( Nesting a b , Nesting a b )

a) What is the correct terminology for the Haskell concept of which Nesting is an example?
Nesting is polymorphic(a, b can accept every type) algebraic(because is defined with data) recursive(beacause it refers to itself) data type

b) What is the correct terminology for the Haskell concept of which S is an example?
S is a data constructor for the type Nesting 

c) Here is a Haskell expression.

C (C( S ( True , True ) ,C( S ( True , True ) , S ( True , False ) ) ) , S ( True , False ) )

We say that its nesting depth is 3, since every subexpression is found within no more than 3
nested C’s.

Define a depth function that computes the nesting depth of any expression that has type
Nesting a b for any a and b and give the type of the depth function.
-}
data Nesting a b = S ( a , b ) | C ( Nesting a b , Nesting a b )


nest =C ( 
        C ( 
          S ( True , True ) , 
          C ( 
            S ( True , True ) , 
            S ( True , False ) 
          ) 
        ) , 
        S ( True , False ) 
        )

nest2 =C ( 
        C ( 
          S ( True , True ) , 
          C ( 
            S ( True , True ) , 
            C (
              S ( True , False ),
              S ( True , False )
            )
          ) 
        ) , 
        S ( True , False ) 
        )

depth :: (Num a1, Ord a1) => Nesting a2 b -> a1

depth (S (a,b)) = 0  
depth (C (a,b)) = max (1 + depth a) (1 + depth b)

