data Vote = Yes | No | Abstain deriving Show

countVotes [] = 0
countVotes (Yes:xs) = 1 + countVotes xs
countVotes (_:xs) = (-1) + countVotes xs 

success xs = (countVotes xs) > 0 

success' xs = sum [1 | Yes <- xs] > (div (length xs) 2)

success'' xs = foldr checker 0 xs > 0
  where 
    checker x acc = case x of 
                            Yes -> 1 + acc
                            _ -> (-1) + acc 
