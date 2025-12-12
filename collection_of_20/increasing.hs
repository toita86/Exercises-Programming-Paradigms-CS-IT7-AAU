{- 
A list l is increasing wrt. some ordering relation < if whenever x appears earlier in l than y, then
x < y . The goal is now to define a Haskell function increasing that will take any list as argument
and tell us if it is increasing.

For instance,
increasing [1,2,7,484000]
should return True. On the other hand,

increasing [”ged”,”abe”,”hest”]
should return False .

a) What should the type of increasing be? Is the function polymorphic? Explain.
b) Define increasing using recursion.
c) Define increasing using suitable higher-order functions
-}

-- is ad-hoc polymorphysm given the typeclass
increasing :: Ord a => [a] -> Bool

increasing [] = True
increasing [a] = True
increasing (x:y:xs) = x < y && increasing (y:xs)  

increasing' xs = and (zipWith (<) xs (tail xs))
