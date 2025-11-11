{- 
The type of unbounded trees UTree is given by
data UTree a = Node a [ UTree a ]
Define an instance of Functor for UTree.
-} 
data UTree a = Node a [UTree a] deriving Show 

instance Functor UTree where
  -- fmap :: (a -> b) -> UTree a -> UTree b
  fmap g (Node a t) = Node (g a) [fmap g i | i <- t]

myTree = Node "bingo" [Node "logo" [], Node "dingo" [Node "pop" [], Node "quango" []]]
