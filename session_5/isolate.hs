{- 
The function isolate takes a list l and an element x and returns a pair of two new lists (l1 , l2).

The first list l1 is a list that contains all elements in l that are not equal to x. 
The second list l2 is a list that contains all occurrences of x in l.
• isolate [4,5,4,6,7,4] 4 evaluates to ([5,6,7],[4,4,4]) .
• isolate [’ g ’,’ a ’,’ k ’,’ a ’] ’a’ evaluates to ([’ g ’,’ k ’], [’ a ’,’ a ’]) .

Define isolate in Haskell without using fst , snd, head or tail . 
What should the type of isolate be? 
Major hint: Place the recursive call in a 
let - or where-clause and use pattern matching to find the components in the result of that call
-}

isolate l k = separator l k ([],[])
  where 
    separator [] k (a,b) = (reverse a, b)
    separator (x:xs) k (a,b) | x == k = separator xs k (a,(x:b))
                             | otherwise = separator xs k ((x:a),b)

isolate' [x] k | x == k = ([], [x])
               | otherwise = ([x], [])

isolate' (x:xs) k | x == k = (diff, x:eq)
                  | otherwise = (x:diff, eq)
                  where
                    (diff, eq) = isolate xs k
