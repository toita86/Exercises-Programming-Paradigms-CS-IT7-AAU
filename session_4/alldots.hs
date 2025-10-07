alldots :: Num a => [(a,a)] -> [(a,a)] -> [a]

-- alldots lts1 lts2 = [(fst t1 * fst t2) + (snd t1 * snd t2) | t1 <- lts1, t2 <- lts2]
alldots lts1 lts2 = [(a * c) + (b * d) | (a,b) <- lts1, (c,d) <- lts2]
