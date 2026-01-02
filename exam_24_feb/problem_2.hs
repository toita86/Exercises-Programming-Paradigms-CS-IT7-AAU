{- 
Let a be an arbitrary type. A (2, 3)-a-tree is a tree if the following two conditions hold:
• All nodes are labelled with values of type a
• All internal nodes (that is, nodes that are not leaves) have either 2 or 3 children.

A (2, 3)-a-tree is uniform if either

• Every internal node has precisely 2 children (so this is a binary tree), or
• Every internal node has precisely 3 children (so this is then a ternary tree).
Figure 1 shows a (2, 3)-Int-tree that is uniform and a (2, 3)-String-tree that fails to be uniform because the node labelled ”dada’’ has 3 children, where all other internal nodes in the tree have only 2.

Your task is now to define a datatype for trees of this kind and a function that can
tell us if a given tree is uniform.
1. Define a datatype TwoThree a that describes (2, 3)-a-trees.
2. Represent the trees shown in the Figure as terms of the datatype that you have defined.
3. Define a function uniform that will tell us if a (2, 3)-a-tree is uniform.
-}

data TwoThree a = Leaf a | BiNode a (TwoThree a) (TwoThree a) | TeNode a (TwoThree a) (TwoThree a) (TwoThree a) deriving Show

bi = BiNode 4 l r 
  where 
    l = BiNode 4 (Leaf 7) (Leaf 9)
    r = BiNode 12 (Leaf 12) (Leaf 17)

bl = BiNode "papa" l r 
  where 
    l = BiNode "yoyo" (Leaf "lala") (Leaf "gygy")
    r = TeNode "dada" (Leaf "nene") (Leaf "fifi") (Leaf "bubu")


isBi (Leaf _) = True
isBi (TeNode _ _ _ _) = False
isBi (BiNode _ _ _) = True

isTe (Leaf _) = True
isTe (TeNode _ _ _ _) = True
isTe (BiNode _ _ _) = False

uniform (Leaf _) = True
uniform (TeNode _ l r t) = isTe l && isTe r && isTe t && uniform t && uniform l && uniform r 
uniform (BiNode _ l r) = isBi l && isBi r && uniform l && uniform r 
