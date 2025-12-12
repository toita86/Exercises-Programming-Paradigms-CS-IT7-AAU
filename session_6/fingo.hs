{- 
Here is a function. What does it do? And why? Use the explanation at the very end of Section 7.3
in the book to help you answer the ”why”-question.
-}

fingo :: [ a ] -> [ a ] -> [ a ]
fingo xs ys = foldr ( : ) xs ys

-- this function concatenates the second argument ys to the first one xs. This happens because the xs is the base case for foldr and by definition of foldr when ys is completely consumed the base cae gets returned creating the concatenation. At the end this happens 1:2:3:[1,2,3]. 
-- ghci> fingo [1,2,3] [1,2,3]
-- [1,2,3,1,2,3]
