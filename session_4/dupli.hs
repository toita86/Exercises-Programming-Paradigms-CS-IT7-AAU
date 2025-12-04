{- 
Write a function dupli that will duplicate the elements of any given list. As an example, dupli [1, 2,
3] must give us [1,1,2,2,3,3] . 

What should the type of dupli be? Hint: 

The concat function from Chapter 5 will be useful for stitching everything together.
• First figure out what the type of isperfect should be.
• Now write the code. Hint: Section 5.2 of the book is useful
-}

dupli :: [a] -> [a]

dupli [] = []
dupli (x:xs) = x:x:dupli xs
