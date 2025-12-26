{- 
1. Define a function rotate which places the head of a list at the end of the tail of the list. We expect
that rotate [1, 2, 3] = [2, 3, 1] and that rotate ”eat” = ”ate”. Is the function polymorphic?

If yes, is the polymorphism parametric, ad hoc or both? You must justify your answer.

2. Use recursion and the rotate function to define a function allrotates that produces all the rotations
of a list. We expect that allrotates [1, 2, 3] = [[1, 2, 3], [2, 3, 1], [3, 1, 2]].
Is the function polymorphic? If yes, is the polymorphism parametric, ad hoc or both? You must
justify your answer.

3. Give another definition of allrotates called allrotates’ that is not recursive but uses either map or
foldr as well as rotate.
-}

rotate (x:xs) = xs ++ [x] 
-- is parametric polymorphism, it works for very type of lists

allrotates xs = helper xs (length xs - 1)   
  where 
    helper ys 0 = [ys]
    helper ys l = (ys):helper (rotate ys) (l - 1)

allrotates' xs = foldr consumer [xs] xs
  where 
    consumer x acc | length acc == length xs = acc 
                   | otherwise = acc ++ [rotate (last acc)]
    
