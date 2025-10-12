-- ands :: [Bool] -> Bool

ands [] = True
ands (b : bs) = b && ands bs

-- concatenation :: [[a]] -> [a]

concatenation [] = []
concatenation (xs : xss) = xs ++ concatenation xss

-- replicates :: Int -> a -> [a]

replicates 0 _ = []
replicates n a = replicates (n - 1) a ++ [a]

-- replicates n a = a : replicates (n-1) a

(!!!) :: [a] -> Int -> a
(x : _) !!! 0 = x
(_ : xs) !!! n = xs !!! (n - 1)

elemt :: (Eq a) => a -> [a] -> Bool
elemt _ [] = False
elemt a (x : xs) = (x == a) || elemt a xs

-- insert :: Int -> [Int] -> [Int]
insert n [] = [n]
insert n (x : xs) = if n <= x then n : x : xs else x : insert n xs

insertSort :: [Int] -> [Int]
insertSort [] = []
insertSort (x : xs) = insert x (insertSort xs)

mergeH :: [Int] -> [Int] -> [Int]
mergeH [] ys = ys
mergeH xs [] = xs
mergeH (x : xs) (y : ys) =
  if x <= y
    then x : mergeH xs (y : ys)
    else y : mergeH (x : xs) ys

halve :: [a] -> ([a], [a])
halve ns = (xs1, xs2)
  where
    xs1 = take (length ns `div` 2) ns
    xs2 = drop (length xs1) ns

mergesort :: [Int] -> [Int]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = mergeH (mergesort ys) (mergesort zs)
  where
    (ys, zs) = halve xs
