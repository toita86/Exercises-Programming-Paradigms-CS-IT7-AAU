-- isolate :: Eq a => [a] -> a -> ([a],[a])

isolate [] _ = ([],[])
isolate (y:ys) x = if y == x then (l1, y:l2) else (y:l1,l2) 
  where (l1,l2) = isolate ys x
-- l1 different from x 
-- l2 items are equal to x
