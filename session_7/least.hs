{- 
Use the declaration of the type Tree on page 97 to define a function least that finds the
least element in a given binary tree.
What should the type of least be? 
-}

data Tree a = Leaf a | Node (Tree a) a (Tree a)

-- if we have a binary search tree
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))

least :: Tree a -> a
least (Leaf a) = a
least (Node l val r) = least l

-- otherwise we need to find the minimum
t' = Node (Node (Leaf 3) 1 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))

least' :: Ord a => Tree a -> a
least' (Leaf a) = a
least' (Node l x r) = minimum [least' l, x, least' r]

