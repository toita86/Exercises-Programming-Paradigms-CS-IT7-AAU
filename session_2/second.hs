-- Second
second :: [a] -> a
second [] = error "There no elements in the list"
second [x] = error "There is only one element"
second ns = ns !! 1

second_2 ns = head (reverse (take 1 ns))

second_3 (n:ns) = head ns

second_4 (_ : n : ns) = n

allbutsecond [] = []
allbutsecond (n:ns) = [n] ++ (tail ns)

allbutsecond_1 [] = []
allbutsecond_1 (h:s:ts) = [h] ++ ts

allbutsecond_2 [] = []
allbutsecond_2 (h:ts) = [h] ++ (drop 1 ts)

allbutsecond_3 [] = []
allbutsecond_3 (h:_:ts) = h:ts


