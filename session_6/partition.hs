{- 
he partition function generalizes the isolate function from Session 5. The partition function takes
a predicate p and a list xs and returns the pair of lists of elements which do and do not satisfy the
predicate, respectively.
a) Define partition using filter .
b) Define partition using foldr .
-}

-- partition :: (p -> Bool) -> [a] -> ([a],[a])

isOdd x = x `mod` 2 /= 0

partition p xs = (filter p xs, filter (not . p) xs)

partition' p xs = foldr step ([],[]) xs
  where step x (sp , ns) | p x = (x:sp, ns)
                         | otherwise = (sp, x:ns)


