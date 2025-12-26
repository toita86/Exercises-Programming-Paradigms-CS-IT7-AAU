{- 
A frequency table ft is a finite list of type Integral b => (a,b) of the form
[(x1 , t1 ), . . . (xk , fk )]
where f1 , . . . , fk are positive whole numbers. The intention is that a frequency table ft can tell us how
many times elements occur in a list. We say that x is mentioned in ft if there is a pair (x, f ) somewhere
in ft.
In the following, we assume that every frequency table ft is well-formed : if x is mentioned in ft, it is
mentioned exactly once, and then (x, f ) has f > 0.
We say that a well-formed frequency table ft = [(x1 , t1 ), . . . (xk , fk )] is valid for a list xs if the table
correctly tells us how many times each element occurs in xs and tells us nothing more. In other words,
for every element x of xs, x is mentioned in ft with the pair (x, f ) and there are exactly f occurrences of
x in xs. Moreover, ft does not mention elements that are not found in xs.
As an example, ft1 = [(”a”,2),(”b”,1)] is valid for the list [”a”,”b”,”a’’]. On the other hand, we have
that ft2 = [(”a”,1),(”b”,1)] is not valid for the list [”b’’,”a”,”b”] (because ”b’’ occurs two times in the list)
or for the list [”a”,”b”,”b”,”c’’] (because ”c’’ is not mentioned in ft2). Moreover, ft2 = [(”a”,1),(”b”,1)]
is not valid for the list [”b’’] (because ft2 mentions ”a’’ which does not occur in [”b’’]).

1. Define a function dec that takes a frequency table ft (which we assume is well-formed; this is not
supposed to be checked by dec) and an element x and gives us a new frequency table in which the
occurrence count of x is decreased by 1 if x was mentioned in ft as (x, f ) with f > 1 and removes
x from ft if f = 1. Otherwise, ft is returned.
So dec [(”a”,2),(”b”,1)] ”a’’ should give us [(”a”,1),(”b”,1)]. And dec [(”a”,2),(”b”,1)] ”b’’ should
give us [(”a”,2)].
2. Define a function validfq that will tell us if a frequency table (which we assume is well-formed; this
is not supposed to be checked by validfq) is valid for a list. What should its type be?
-}
ft [] _ = []
ft ((x, f):xs) v | x == v = if f == 1 then xs else (x, f - 1):xs 
                 | otherwise = (x, f):(ft xs v)

-- validfq :: Eq a, Eq b, Num b => [(a,b)] -> [a] -> Bool
validfq fs vs = (reduce fs vs) == [] 
  where 
    reduce fs [] = fs 
    reduce fs (x:vs) = ft (reduce fs vs) x 
