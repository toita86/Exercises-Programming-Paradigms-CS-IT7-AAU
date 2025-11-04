{- 
Use recursion to define a Haskell value letter that is a sequence of actions which does the following:
• Receive a string
• Print out the characters of the string one by one, with each character followed by a linebreak
As an example, we would expect the following:
∗Main> l e t t e r s
dingo
d
i
n
g
o
∗Main>
-}
-- letters :: IO ()

letters = do
  word <- getLine
  loop word
  where 
    loop [] = return ()
    loop (x:xs) = do
      putChar x
      putStr "\n"
      loop xs

-- TODO foldr waiting for monads lecture..
-- letters' = do
--   word <- getLine
--   loop' word
--   where
--     loop' = foldr (\x xs -> do 
--       putChar x 
--       putStr "\n"
--       ) (return ())

-- sequence_
letters'' = do
  word <- getLine
  sequence_ [putStr (x:" \n") | x <- word]

