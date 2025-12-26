data Tree a =  Leaf a | NodeU (Tree a) (Tree a) | Node a (Tree a) (Tree a)

t1 = NodeU n1 n2
  where 
    n1 = NodeU a1 a2 
    n2 = Leaf 1964
    a1 = Leaf 17
    a2 = Leaf 484000

t2 = Node "bingo" a1 a2
  where 
    a1 = Leaf "plip"
    a2 = Node "plop" b1 b2
    b1 = Leaf "uhu"
    b2 = Leaf "fedtmule"

isfull (NodeU _ _) = False
isfull (Leaf _) = True
isfull (Node _ l r) = (isfull l) && (isfull r)

preorder (NodeU _ _) = Nothing
preorder (Leaf a) = Just [a] 
preorder (Node x l r) = do 
  left <- (preorder l) 
  right <- (preorder r)
  return (x : left ++ right)

