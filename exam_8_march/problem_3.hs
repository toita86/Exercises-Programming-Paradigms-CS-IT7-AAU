{- 
The interleave function takes two lists xs and ys and builds a new list in which every element of xs appears immediately before the element at the same position in ys. If the two lists do not have the same length, the shortest list has priority.

As examples, interleave [1,2,3,17] [4,5,6] should return [1,4,2,5,3,6], and interleave [1,2] [4,5,6] should return [1,4,2,5].

1. Define interleave using recursion.
2. Define interleave using map and zip.
-}
interleave _ [] = []
interleave [] _ = []
interleave (x:xs) (y:ys) = x:y:(interleave xs ys)

interleave' xs ys = concat (map (\(x,y) -> [x,y]) (zip xs ys))
