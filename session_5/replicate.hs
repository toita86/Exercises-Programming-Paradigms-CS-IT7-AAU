-- type inference says replicates :: (Eq n, Num n) => n -> a -> [a]
-- if we use this type allows also non integer numbers that cause 
-- an infinte loop. We need to constrain the type of `n`

replicates :: Int -> a -> [a]

replicates 0 _ = []
replicates n a = a : replicates (n-1) a

-- replicates n a = replicates (n - 1) a ++ [a]
