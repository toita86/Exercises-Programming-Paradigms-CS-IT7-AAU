naturals = nat 1
  where 
    nat x = x:nat (x + 1)

facs = [fact i | i <- [0..]]

fact 0 = 1
fact i = i * fact (i - 1)

facs' = 1 : zipWith (*) [1..] facs' 
