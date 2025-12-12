-- Name: Eduard Brahas
-- AAU mail address: ebraha25@student.aau.dk
-- Study number: 20251296


-- PROBLEM 1

-- 1.1
remove :: [a] -> Int -> [a]
remove xs 0 = xs
remove (x:xs) k | k > length (x:xs) = x:xs
                | otherwise = if k == 1 then xs else x:remove xs (k-1)

-- TESTCASES
-- The type is polymorphic for a that accepts a list with whatever type but for k is monomorphic beacause needs to be a Int
--
-- ghci> remove [17,42,484000,9400] 2
-- [17,484000,9400]
-- ghci> remove [[17,42],[484000,9400]
-- , [1,2,3]] 2
-- [[17,42],[1,2,3]]
-- ghci> remove "pippo" 3
-- "pipo"

-- 1.2
removals xs = [remove xs i| i <- [1..length xs]]

-- TESTCASES
-- ghci> removals [1,2,3,4]
-- [[2,3,4],[1,3,4],[1,2,4],[1,2,3]]
-- ghci> removals "pippo"
-- ["ippo","pppo","pipo","pipo","pipp"
-- ]
-- ghci> removals [[1],[2],[3],[4]]
-- [[[2],[3],[4]],[[1],[3],[4]],[[1],[
-- 2],[4]],[[1],[2],[3]]]

-- PROBLEM 2

-- 2.1
data Person = Famous String | Ordinary String
data Children = None | Person Children
data Family = Single Person Children | Couple Person Person Children
data Dynasty = Family Family

-- 2.2


-- PROBLEM 3
-- 3.1
dwindle [] = [[]]
dwindle (x:xs) = (x:xs) : dwindle xs


-- 3.2
dwindle' xs = [drop i xs | i <- [0..length xs]]

-- 3.3
dwindle'' xs = foldr (\x acc -> (drop (length xs - length acc) xs):acc ) [[]] xs

-- TESTCASES
-- ghci> dwindle "pippo"
-- ["pippo","ippo","ppo","po","o",""]
-- ghci> dwindle [6,3,0,1,2,5]
-- [[6,3,0,1,2,5],[3,0,1,2,5],[0,1,2,5],[1,2,5],[2,
-- 5],[5],[]]
-- ghci> dwindle []
-- [[]]

-- PROBLEM 4
data Status a = Fresh a | Used a deriving Show

instance Functor Status where
  fmap f (Fresh x) = Fresh (f x)
  fmap f (Used x) = Used (f x)

-- 4.1
instance Applicative Status where
  pure = Fresh

  (Fresh g) <*> l = fmap g l
  (Used g) <*> l = fmap g l

-- 4.2
instance Monad Status where
  (Fresh a) >>= f = f a
  (Used b) >>= f = f b

-- 4.3
minimise s1 s2 = do 
                  realA <- s1
                  realB <- s2
                  return (min realA realB)

-- PROBLEM 5 
-- 1. (Num a => Bool −> a −> (a, a)
-- 2. a1 −> a2 −> (a2, a2) −> (a1, [a2])
-- 3. Num a => Maybe [a −> a]
-- 4. p1 −> p2 −> [a]
-- 5. Bool −> String

-- 5.1
fun1 boo x = if boo then (x+x, x+x) else (x+x, x)
-- this is ad-hoc polymorphism for a

-- 5.2
fun2 a b (c,d) = (a, [b] ++ [c] ++ [d])
-- is is parametric polymorphism

-- 5.3
-- is not a funtion but an expression
ex = Just ([\x -> x+x])
-- thi is ad-hoc polymorphism

-- 5.4
fun4 x y = [] 
-- this is parametric polymorphism

-- 5.5
fun5 boo = if boo then "scary" else "not scary"
-- this is a monomorphism

-- PROBLEM 6

-- 6.1
squares = square 1  
  where
    square i = (i^2):square (i+1)

-- 6.2
squares' = map (^2) [1..]

-- 6.3
-- v = (\y -> (tail [1 / (3-y), 7.9, 11.3])) (1+2)
-- given the fact that lazy evaluation(call-by-name evaluation) takes allows us to avoid doing some useless steps in this expression so our result will be done in less steps then the call-by-value evaluation.
-- Lazy evaluation:
-- v1 = (\y -> (tail [1 / (3-y), 7.9, 11.3])) (3)
-- v2 = (tail [1 / (3-3), 7.9, 11.3])
-- v3 = [7.9, 11.3]

