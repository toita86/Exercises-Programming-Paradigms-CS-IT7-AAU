{-
Consider trees whose elements are values of some type in the type class Ord. The type Tree a is
defined by
data Tree a = Leaf a | Node (Tree a) (Tree a)

Use a monad to write a function minorder that takes such a tree and checks if the numbers in
the structure are in non-decreasing order when read from left to right. 

If it is, the function should return Just k, where k is the smallest number in the tree, otherwise it should return Nothing. 
The tree mytree shown in Figure 1 is ordered, so minorder mytree1 should return Just ”aha’’, but the
tree in Figure 2 is not ordered, so minorder mytree2 should return Nothing.

First define another function minmax that finds the minimal and the maximal element in a tree
under the assumption that the tree is ordered. 

Then use minmax to define minorder.

Hints: First, find some good test cases. 

Then find out which monad you should use.
Warning! Only use monadic notation!
-}

data Tree a = Leaf a | Node (Tree a) (Tree a)

-- minmax :: (Ord a, Maybe a) => Tree a -> (a,a) -> a
minmax (Leaf a) = Just(a, a)
minmax (Node a b) = do
                (lMax, lMin) <- minmax a
                (rMax, rMin) <- minmax b
                
                if rMax >= lMin
                then return (min lMin rMin, max lMax rMax)
                else Nothing

minorder t = do
  (minval,_) <- minmax t
  return minval

t = Node (Leaf "aha") (Leaf "plip") 
