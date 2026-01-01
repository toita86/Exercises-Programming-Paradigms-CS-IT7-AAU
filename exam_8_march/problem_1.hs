{- 
1. A list [a1 , a2 , . . . , an ] is descending if a1 ≥ a2 ≥ . . . ≥ an .

• Write a function descending that will return True if a list is descending and False otherwise. As examples, descending [6,5,5,1] should return True and descending ["plip","pli","ppp"] should return False.

• Is descending polymorphic? If yes, is it parametric polymorphic, ad hoc-polymorphic or both?

2. A segment of a list xs is a sublist of xs such that all its elements are equal and the neighbouring elements are different from the elements in the sublist. As an example, [2,2,2] is a segment of [1,1,2,2,2,3,6] but [2,2] is not a segment of [1,1,2,2,2,3,6], since 2 is a neighbouring number in the list.

• Define a recursive function segments that computes the list of segments of a given list. As an example, segments [1,1,2,2,2,5,6] should return [[1,1],[2,2,2],[5],[6]] and segments [True,False,False,True should return [[True],[False,False],[True,True,True]].

• Is segments polymorphic? If yes, is it parametric polymorphic, ad hoc-polymorphic or both?
-}
-- descending :: Ord a => [a] -> Bool
-- descending is a parametric polymorphic function constrained by ad-hoc polymorphyms via the type class Ord
descending (x:y:[]) = x >= y
descending (x:y:xs) = (x >= y) && descending (y:xs)

-- segments :: Eq a => [a] -> [[a]]
-- segment is a parametric polymorphic function constrained by ad-hoc polymorphyms via type class Eq
segments (x:xs) = segment x [] xs
  where
    segment x acc [] = [x:acc]
    segment x acc (y:xs) | x == y = segment y (x:acc) xs
                         | otherwise = (x:acc):(segment y [] xs)
