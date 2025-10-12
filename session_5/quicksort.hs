quicksort :: Ord a => [a] -> [a]

quicksort [] = []

quicksort (x : xs) =
  quicksort smaller ++ [x] ++ quicksort larger
  where
    smaller = [a | a <- xs, a <= x]
    larger = [a | a <- xs, a > x]
