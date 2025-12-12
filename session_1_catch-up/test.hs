latest ns = ns !! (length ns - 1)
latest_take2 ns = head (reverse ns)

initest ns = take (length (ns) -1) ns
initest_take2 ns = reverse (tail (reverse ns))

add' :: Int -> (Int -> Int)
add' x y = x + y
