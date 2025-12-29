{- 
Consider trees whose elements are values of some type in the type class Ord. The type Tree a is
defined by
data Tree a = Leaf a | Node ( Tree a ) ( Tree a )

Figure 2: The ordered mytree1

Use a monad to write a function minorder that takes such a tree and checks if the numbers in the structure are in non-decreasing order when read from left to right. If it is, the function should return Just k, where k is the smallest number in the tree, otherwise it should return Nothing. The tree mytree shown in Figure 2 is ordered, so minorder mytree1 should return Just ”aha’’, but the tree in Figure 3 is not ordered, so minorder mytree2 should return Nothing.

First define another function minmax that finds the minimal and the maximal element in a tree under the assumption that the tree is ordered. Then use minmax to define minorder.

Hints: First, find some good test cases. Then find out which monad you should use.
Warning! Only use monadic notation!
-}

data Tree a = Leaf a | Node ( Tree a ) ( Tree a )

ord = Node l1 l2
  where 
    l1 = Leaf 1
    l2 = Node (Leaf 2) (Leaf 3)

notOrd = Node l1 l2
  where 
    l1 = Leaf 3
    l2 = Node (Leaf 2) (Leaf 1)

minmax (Leaf l) = Just (l,l)
minmax (Node l r) = do 
                     (minL, maxL) <- minmax l
                     (minR, maxR) <- minmax r
                     if maxL <= minR 
                       then Just (min minL minR, max maxL maxR) 
                       else Nothing 
                       
minorder t = do 
  (min, _) <- minmax t 
  return min

minmax' (Leaf l) = Just (l,l)
minmax' (Node l r) = do 
  (min,_) <- minmax' l 
  (_,max) <- minmax' r 
  Just (min, max)

minorder' y = do 
  (min, max) <- minmax' y 
  if min < max 
    then return min 
    else Nothing
