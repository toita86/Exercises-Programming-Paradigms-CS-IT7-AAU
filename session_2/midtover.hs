-- midtover

midtover :: [a] -> ([a],[a])

midtover ns = (xs1, xs2)
  where
    xs1 = take (length ns `div` 2) ns
    xs2 = drop (length xs1) ns

