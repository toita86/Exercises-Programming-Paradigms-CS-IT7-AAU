{- 
A tree of whole numbers is a tree in which nodes are labelled with integers and where each node can have zero or more (arbitrarily many) subtrees.
Figure 1 shows two trees of whole numbers, t1 and t2 .
1. Define a datatype WNTree that describes the trees of whole numbers.
2. Show how one should represent t1 and t2 as values of type WNTree.
3. Define a function maxval that, when given a tree of whole numbers t, returns the maximal number found in t. In Figure 1 we should have that maxval t1 gives us 484000 and that maxval t2 gives us 8235. Hint: The function maximum in the Prelude is useful
-}

data WNTree = Leaf Int | Node Int [WNTree] deriving Show 

t1 = Node 12 [a, b]
  where 
    a = Node 17 [Leaf 1964]
    b = Node 484000 [c,d,e,f]
    c = Leaf 50
    d = Node 6 [Leaf 81, Leaf 1]
    e = Leaf 42
    f = Leaf 3

t2 = Node 12 [a, b]
  where 
    a = Node 8235 [c]
    b = Node 2 [d,e,f]
    c = Node 1812 [Leaf 99, Leaf 100]
    d = Leaf 666
    e = Leaf 7 
    f = Leaf 7


maxval (Leaf v) = v
maxval (Node v xs) = maximum (v:(flatten xs))
  where
    flatten [] = []
    flatten ((Leaf v):xs) = v:(flatten xs)
    flatten ((Node v ys):xs) = v:(flatten ys) ++ (flatten xs) 
