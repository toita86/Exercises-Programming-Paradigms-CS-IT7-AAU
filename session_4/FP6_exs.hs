safetail :: [a] -> [a]

-- a)
-- safetail as = if null as then [] else tail as
-- safetail as = if null as then [] else (\(_:as) -> as) as

-- b)
-- safetail as | null as = []
--             | otherwise = (\(_:as) -> as) as

-- safetail as | null as = []
--             | otherwise = tail as

-- c)
safetail [] = []
safetail (_:xs) = xs
