{- 
The authors of a new encyclopedia about values of type a represent their information using a hierarchical structure where every entry in the encyclopedia is tagged with a key that is a string and a value of type a. Entries can have subentries.

The authors of the encyclopedia asked a famous influencer to define a type Encyclopedia for encyclopedias. The influencer wrote

data Encyclopedia a = Leaf String a | Node1 String a ( Encyclopedia a ) | Node2 Stringa (Encyclopedia a ) (Encyclopedia a ) | Node3 String a (Encyclopedia a ) ( Encyclopedia a ) ( Encyclopedia a ) deriving Show

but complained about the limitations of Haskell: ”I see from the examples that any entry can have no more than three sub-entries. Nothing in Haskell allows you to write that there are arbitrarily many children of the same type, so I am forced to write a very clumsy definition. Haskell is pathetic!”

• Provide a better definition. Find out what is wrong and come up with a better solution. It is a good idea to read the problem text very carefully and find out what it says and does not say. Once you have criticized the existing solution, it is also a good idea not to try to repair the existing attempt but to start over.

• Show how you represent t1 and t2 in Figure 1 as values t1 and t2 of your type.
-}

data Encyclopedia a = Leaf String a | Node String a [Encyclopedia a]

t1 = Node "mango" True [c1, c2, c3]
  where
    c1 = Node "dingo" False [d1, d2]
    c2 = Leaf "plop" True
    c3 = Node "plys" False [p1]
    d1 = Leaf "plip" True 
    d2 = Leaf "ninka" False
    p1 = Leaf "boing" True

t2 = Node "plonk" 1 [p1,p2,p3]
  where
    p1 = Node "zap" 3 [z1] 
    p2 = Node "uhu" 4 [u1]
    p3 = Leaf "bingo" 5 
    z1 = Leaf "ninka" 8
    u1 = Leaf "gif" 9

{- 
An encyclopedia is layered if it holds that all values at the same level of the encyclopedia are larger than the values in the levels above. As an example, t2 in Figure 1 is layered, since 8 and 9 at level 3 are greater than the values 3, 4 and 5 at level 2 – which are greater than the value 1 at level 1.

Define a function layered that can tell us if an encyclopedia is layered.
-}
valueOf (Leaf _ v) = v 
valueOf (Node _ v _) = v

-- layered :: Ord a => Encyclopedia a -> Bool
layered (Leaf _ _) = True
layered (Node _ v children) = isGreaterThanChild && isChilsLayered
  where
    isGreaterThanChild = all (\c -> valueOf c > v) children 
    isChilsLayered = all layered children


