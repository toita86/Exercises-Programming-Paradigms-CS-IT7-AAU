{- 
Define a datatype Btree a for binary trees that have nodes whose labels are taken from the type a.

b) The leftmost path in a binary tree is the path that can be obtained by starting at the root and always following the left child of any node, if one exists. If at some point during this traversal there is no left child, the path ends. In the tree drawn above, the leftmost path is the sequence
4, 3, 2. Define a function leftpath such that leftpath t gives us the list that represents the leftmost path in the tree t.
Is leftpath polymorphic? If yes, how is it polymorphic? If no, why not?
-}

data Btree a = None | Leaf a | Node a (Btree a) (Btree a)

t1 = Node 4 l r 
  where 
    l = Node 3 l1 None
    r = Node 6 (Leaf 5) (Leaf 7)
    l1 = Node 2 None (Leaf 1)

-- leftpath :: Btree a -> [a]
-- the function leftpath is parametric polymorphic for the value of the Btree type and adhoc polymorphic for the type of the data structure with wich the funciton is working
leftpath (Leaf v) = [v]
leftpath (Node v None _) = [v]
leftpath (Node v l _) = v:(leftpath l)
