-- wrapup :: [a] -> [[a]]

wrapup [] = []
wrapup [x] = [[x]]
wrapup (x : y : ys) = if x == y then (x : l) : l1 else [x] : l : l1
  where
    (l : l1) = wrapup (y : ys)
