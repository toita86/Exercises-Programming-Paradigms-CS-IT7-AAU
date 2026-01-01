{- 
The authors of a new encyclopedia about values of type a represent their information using a hierarchical structure where every entry in the encyclopedia is tagged with a key that is a string and a value of the appropriate type.

1. Define a type Encyclopedia for encyclopedias. Show how you represent t1 and t2 in Figure 1 as values t1 and t2 of your type.

2. An encyclopedia has a search function containskey that will tell us if an element with a given key is found in the encyclopedia. As an example, containskey "ninka" t1 should return True and containskey "bob" t2 should return False.

Define containskey.

3. An encyclopedia is layered if it holds that all values at the same level of the encyclopedia are larger than the values in the levels above. As an example, t2 is layered, since 8 and 9 at level 3 are greater than the values 3, 4 and 5 at level 2 – which are greater than the value 1 at level 1.

Define a function layered that can tell us if an encyclopedia is layered.
-}

data Encyclopedia a = Leaf String a | Node String a [Encyclopedia a]

t1 = Node "mango" True [c1, c2, c3]
  where 
    c1 = Node "dingo" False [cc1, cc2]
    c2 = Leaf "plop" True
    c3 = Node "plys" False [Leaf "boing" True]
    cc1 = Leaf "plip" True
    cc2 = Leaf "ninka" False

t2 = Node "plonk" 1 [c1, c2, c3]
  where 
    c1 = Node "zap" 3 [Leaf "ninka" 8]
    c2 = Node "ubu" 4 [Leaf "gif" 9]
    c3 = Leaf "bingo" 5

containskey key (Leaf s _) = key == s
containskey key (Node s _ childs) = key == s || childContainskey key childs

childContainskey _ [] = False
childContainskey key (x:xs) = containskey key x || childContainskey key xs

layered (Node _ v childs) = isBranchOrdered v childs 
  where   
    isBranchOrdered v ((Leaf _ l):xs) = v < l
    isBranchOrdered v ((Node _ l childs):xs) = v < l && isBranchOrdered v xs && isBranchOrdered l childs
