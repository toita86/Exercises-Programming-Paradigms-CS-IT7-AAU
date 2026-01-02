{- 
The goal of this problem is to define a function repeatStrings that takes a list xs and a list of integers ns and returns a list of elements where each element in xs has been repeated the number of times specified by the corresponding integer. If the lengths of xs and ns are different, the shorter of the two lists defines the outcome.

As examples, we expect that
repeatStrings [”plip’’,’’bob’’,’’bubu’’] [3,2,3]
will give us
[”plip”,”plip”,”plip”,”bob”,”bob”,”bubu”,”bubu”,”bubu”]

and that
repeatStrings [True,True,False,True] [3,2,3]
will give us
[True,True,True,True,True,False,False,False]

and that
repeatStrings [”plip”,”bob”] [3,2,3]
will give us
[”plip”,”plip”,”plip”,”bob”,”bob”]

1. What is the type of repeatStrings? Is the function polymorphic? If it is, does it use overloading/ad hoc polymorphism, parametric polymorphism or a mix of them? If if is not, why is this the case?
2. Define a version of repeatStrings that uses recursion.
3. Define a version of repeatStrings that uses map, foldr and zip but no recursion and no list comprehensions.
-}
-- repeatString :: (Ord b, Num b) => [a] -> [b] -> [a]
-- the function uses parametric polymorphism for a and adhoc constrained by type class Ord and Num for b
repeatString ws rs = concat (repeat ws rs []) 
  where 
    repeat [] [] acc = [acc]
    repeat (w:ws) (r:rs) acc | r > 0 = repeat (w:ws) ((r - 1):rs) (w:acc) 
                             | otherwise = acc : (repeat ws rs [])

repeatString' ws rs = foldr repeat [] (zip ws rs)
  where 
    repeat (w, r) acc = rep [1..r] w ++ acc
    rep xs l = map (\x -> l) xs
