-- Problem 1

-- 1.1

remove [] k = []
remove (x:xs) k | k <= 1 = xs
remove (x:xs) k = x : (remove xs (k-1))

-- Tests

-- ghci> remove [2,3,2,1] 2
-- [2,2,1]

-- ghci> remove [] 2
-- []

-- ghci> remove [2,3,2,1] 4
-- [2,3,2]

-- 1.2

removals xs = [ remove xs i | i <- [1..length xs]]

-- Tests

-- ghci> removals ["plip","plop","dingo"]
-- [["plop","dingo"],["plip","dingo"],["plip","plop"]]
-- ghci> removals [True,True,True,True]
-- [[True,True,True],[True,True,True],[True,True,True],[True,True,True]]
-- ghci> removals [1,2,3,4,3,2,1]
-- [[2,3,4,3,2,1],[1,3,4,3,2,1],[1,2,4,3,2,1],[1,2,3,3,2,1],[1,2,3,4,2,1],[1,2,3,4,3,1],[1,2,3,4,3,2]]

-- Problem 2

-- 2.1

data Person = Famous String | Normal String

data Unit = Single Person | Couple (Person,Person)

data Dynasty = A Unit [Dynasty]

-- t ==


t = A (Couple (Normal "Bob",Normal "Carol")) [t1,t2]
    where
       t1 = A (Couple (Famous "Ted",Famous "Alice")) [t11,t12]
       t2 = A (Couple (Famous "Joe", Famous "Donald")) [t21,t22,t23]
       t11 = A (Single (Famous "Archie")) [t111]
       t12 = A (Couple (Famous "Lilibet", Famous "Kate")) []
       t111 = A (Single (Famous "Trevor")) []
       t21 = A (Single (Famous "Harry")) []
       t22 = A (Single (Famous "Loreen")) []
       t23 = A (Single (Famous "Alison")) []

n = A (Couple (Normal "John",Famous "Alice")) [n1,n2]
    where
       n1 = A (Couple (Famous "Peter", Famous "Susanne")) [n11,n12]
       n11 = A (Single (Normal "Gertrud")) []
       n12 = A (Single (Normal "Verner")) []
       n2 = A (Couple (Famous "Viggo",Normal "Mads")) [n21,n22]
       n21 = A (Single (Normal "Anna")) []
       n22 = A (Single (Normal "Birger")) [n221]
       n221 = A (Couple (Famous "Jytte", Normal "Bente")) []

-- 2.2

isfamous (Single (Famous _)) = True
isfamous (Couple (Famous _, Famous _)) = True
isfamous _ = False

famoushead (A u d) = isfamous u

modern (A u dyn) | isfamous u = (all famoushead dyn) && (all modern dyn)
modern (A u dyn) | not (isfamous u) = (all modern dyn)

-- Tests

-- ghci> modern t
-- True
-- ghci> modern n
-- False
-- ghci> modern (A (Single (Normal "Frederik")) [])
-- True

-- Problem 3

-- 3.1

dwindle [] = [[]]
dwindle [x] = [[x]]
dwindle (x:xs) = (x:xs) : (dwindle xs)

-- 3.2

dwindle' xs = [(drop n xs) | n <- [1..(length xs)]]

-- 3.3

dwindle'' xs = reverse (foldr (\x (h:t) -> (tail h):(h:t)) [xs] xs)

-- Alternative version without reverse and tail

dwindle''' xs = foldr (\x (y:ys) -> (x:y):y:ys) [[]] xs

-- Tests

-- ghci> dwindle [6,3,0,1,2,5]
-- [[6,3,0,1,2,5],[3,0,1,2,5],[0,1,2,5],[1,2,5],[2,5],[5]]
-- ghci> dwindle "regninger"
-- ["regninger","egninger","gninger","ninger","inger","nger","ger","er","r"]
-- ghci> dwindle "mango"
-- ["mango","ango","ngo","go","o"]

-- Problem 4

-- 4.1

data Status a = Fresh a | Used a deriving Show

instance Functor Status where
    fmap f (Fresh x) = Fresh (f x)
    fmap f (Used x) = Used (f x)

instance Applicative Status where
    pure x = Fresh x
    (Fresh f) <*> (Used x) = (Used (f x))
    (Used f) <*> (Fresh x) = (Used (f x))
    (Fresh f) <*> (Fresh x) = (Fresh (f x))
    (Used f) <*> (Used x) = (Used (f x))

-- 4.2

instance Monad Status where
     return = pure
-- >>= ::  (Status a) -> (a -> Status b) -> (Status b)
     (Fresh x) >>= f = f x
     (Used
      x) >>= f = f x

-- 4.3

minimise :: Ord b => Status b -> Status b -> Status b

minimise x y = do
                xx <- x
                yy <- y
                Fresh (min xx yy)
     
-- Test

-- ghci> minimise (Used "ab") (Used "aa") 
-- Fresh "aa"
-- ghci> minimise (Fresh 4) (Fresh 8) 
-- Fresh 4
-- ghci> minimise (Fresh True) (Used False) 
-- Fresh False

-- Problem 5

-- (\x -> \y -> if x then (y,y) else (y,y+y))

-- Ad hoc polymorphism; a is constrained by type classes : Num a => Bool -> a -> (a, a)

-- (\x -> \y -> \(u,v) -> (x,[y,u,v]))

-- Parametric polymorphism; a1 og a2 are not is constrained by type classes : a1 -> a2 -> (a2, a2) -> (a1, [a2])

-- (Just [ \x -> 3+x])

-- Ad hoc polymorphism; a is constrained by type classes : Num a => Maybe [a -> a]

-- (\x -> \y -> [])

-- Parametric polymorphism; p1, p2 og a are not constrained by type classes : p1 -> p2 -> [a]

fup True = "dingo"
fup False = "mango"

-- No type variables, so no polymorphism here : Bool -> String

-- Problem 6

-- 6.1

squares = squaresfrom 1
          where
              squaresfrom n = n*n : (squaresfrom (n+1))

-- 6.2

squares' = map (\x -> x*x) [1..]

-- 6.3

-- We use lazy evaluation; the outermost redex is always the only that gets evaluated

-- The reduction sequence is

-- (\y−> (tail [1/(3−y), 7.9, 11.3])) (1+2) = 
-- (tail [1/(3−(1+2) ), 7.9, 11.3]))       =
-- [7.9, 11.3]


