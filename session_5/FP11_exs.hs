sumL :: (Num a) => [a] -> a
-- sumL [] = 0
-- sumL (x:xs) = x + sum xs

sumL = foldr (+) 0

dropr :: Int -> [a] -> [a]
dropr _ [] = []
dropr 0 xs = xs
dropr n (_ : xs) = dropr (n - 1) xs

initl :: [a] -> [a]
initl [_] = []
initl (x : xs) = x : init xs

-- initl (x:xs)
--   | null xs = []
--   | otherwise = x:init xs
