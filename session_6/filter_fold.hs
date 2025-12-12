-- How can we implement the filter function using foldr 
filter' p xs = foldr step [] xs
  where step x ys | p x = x:ys
                  | otherwise = ys
