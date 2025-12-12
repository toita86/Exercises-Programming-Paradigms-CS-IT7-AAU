{- 
a) Define a datatype Btree a for binary trees that have nodes whose labels are taken from the type a.

b) The leftmost path in a binary tree is the path that can be obtained by starting at the root and
always following the left child of any node, if one exists. If at some point during this traversal
there is no left child, the path ends. In the tree drawn above, the leftmost path is the sequence
4, 3, 2. Define a function leftpath such that leftpath t gives us the list that represents the
leftmost path in the tree t.
Is leftpath polymorphic? If yes, how is it polymorphic? If no, why not?
-}
data Btree a = None | Leaf a | Node a (Btree a) (Btree a)

tree = Node 4 (
              Node 3 (
                      Node 2 (None) (Leaf 1)
                     ) (
                      None
                     )
              ) (
              Node 6 (
                      Leaf 5
                     ) (
                      Leaf 7
                     )
              )

-- leftpath :: Btree a -> [a]
leftpath None = []
leftpath (Leaf v) = [v]
leftpath (Node v a _) = v:(leftpath a)
-- this function uses ad-hoc polymorphism beacause the type of the function explicity states Btree a
