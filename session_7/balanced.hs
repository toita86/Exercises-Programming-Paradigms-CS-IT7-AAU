{-
We say that a binary tree is balanced if the number of leaves in every left and right subtree differ by at most one with leaves themselves being trivially balanced. 

Define a function balanced that will tell us if a binary tree is balanced or not. 

Hint: It is a good idea to also define a function that finds the number of leaves of a tree.
-}

data BTree a = Leaf a | Node a (BTree a) (BTree a)

t1 = Node 'a' l1 r1
  where 
    l1 = Node 'b' l2 r2
    r1 = Node 'c' l3 r3
    l2 = Leaf 'i'
    r2 = Leaf 'o'
    l3 = Leaf 'v'
    r3 = Leaf 'n'
    
t2 = Node 'a' l1 r1
  where 
    l1 = Node 'b' l2 r2
    r1 = Node 'c' l3 r3
    l2 = Node 'i' (Leaf 'h') (Leaf 'l')
    r2 = Leaf 'o'
    l3 = Leaf 'v'
    r3 = Leaf 'n'

numOfLeaf (Leaf _) = 1
numOfLeaf (Node _ l r) = numOfLeaf l + numOfLeaf r

balanced (Leaf _) = True
balanced (Node _ l r) = abs (numOfLeaf l - numOfLeaf r) < 1
