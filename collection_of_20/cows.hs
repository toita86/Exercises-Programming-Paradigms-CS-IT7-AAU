{- 
Cows say Moo and Roar. Sheep say Baa. Below is a conversation between a cow and a sheep
expressed as a list.

[ Moo , Roar , Baa , Moo , Moo , Baa , Roar ]

a) Define a datatype Utterances that expresses the sounds that cows and sheep can make.

b) Use your datatype Utterances to define a function apart using recursion such that apart xs
takes a conversation between a cow and a sheep and splits it into a pair (c, s) where c is a list
with the sounds made by the cow in the correct order and s is a list with the sounds made by
the sheep in the correct order.

As example, we should have that
apart [Moo,Roar,Baa,Moo,Moo,Baa,Roar]
gives us ([ Moo,Roar,Moo,Moo,Roar],[Baa,Baa]).
What is the type of apart? Is the function polymorphic?

c) Now your datatype Utterances to define a function apart using foldr 
-}

data Utterances = Moo | Roar | Baa deriving (Show, Eq)

apart :: [Utterances] -> ([Utterances], [Utterances]) -- the function is not polymorphic it work only for the Utterances data type
apart xs = pastor xs ([],[])
  where
    pastor [] (m, s) = (reverse m, s)
    pastor (Moo:xs) (m, s) = pastor xs (Moo:m, s) 
    pastor (Roar:xs) (m, s) = pastor xs (Roar:m, s) 
    pastor (Baa:xs) (m, s) = pastor xs (m, Baa:s) 

apart' xs = foldr (\x (m, s) -> if x == Baa then (m, x:s) else (x:m, s)) ([],[]) xs

