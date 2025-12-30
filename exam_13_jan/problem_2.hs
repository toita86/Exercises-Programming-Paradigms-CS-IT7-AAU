{- 
This goal of this problem is to define a data structure and a function over it.
We consider a data structure that we call mixed a, b-trees. Let a and b be any types. Then we say that a tree is a mixed a, b-tree if it is has one of these forms given below.
• It can be an empty leaf
• It can be a leaf labelled with an element of type a
• It can be a leaf labelled with an element of type b
• It can consist of a node labelled with an element of type a and a left and right subtree that are also mixed a, b-trees.
• It can consist of a node labelled with an element of type b and a left and right subtree that are also mixed a, b-trees.

1. Define a datatype MixedTree for mixed a, b-trees in Haskell.
2. Represent the tree in Figure 1a as a term of type MixedTree.
We say that a mixed a, b-tree t is layered if the following holds:
• Every node in t labelled with an element of type a has all its children labelled with elements of type b.
• Every node in t labelled with an element of type b has all its children labelled with elements of type a. The tree in Figure 1a is layered, the tree in Figure 1b is not.
3. Define a function islayered which takes a tree as argument and tells us if the tree is layered
-}

data MixedTree a b = Empty | LeafA a | LeafB b | NodeA a (MixedTree a b) (MixedTree a b) | NodeB b (MixedTree a b) (MixedTree a b)

t1a = NodeA 4 (c1) (c2)
  where 
    c1 = NodeB "dudu" (LeafA 2) (LeafA 9)
    c2 = NodeB "zyzy" (LeafA 6) (LeafA 7)

t1b = NodeA 4 (c1) (c2)
  where 
    c1 = NodeB "dudu" (LeafA 2) (LeafA 9)
    c2 = NodeB "zyzy" (LeafA 6) (LeafB "pip")

isA (NodeA _ _ _) = True
isA (LeafA _) = True
isA (NodeB _ _ _) = False
isA (LeafB _) = False
isA Empty = False

isB (NodeB _ _ _) = True
isB (LeafB _) = True
isB (NodeA _ _ _) = False
isB (LeafA _) = False
isB Empty = False

islayered (Empty) = True
islayered (LeafA _) = True
islayered (LeafB _) = True
islayered (NodeA _ l r) = isB l && isB r && islayered l && islayered r 
islayered (NodeB _ l r) = isA l && isA r && islayered l && islayered r 
