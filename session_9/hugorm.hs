import Data.Char (digitToInt, isDigit)
{- 
Define an action hugorm :: IO() that reads a given number of integers from the keyboard, one
per line, and then finally displays the sum of the integers1. As an example, we would expect the
following:
1Hugorm is the Danish word for adder.
1
∗Main> hugorm
How many numbers would you l i k e t o add ? 5
1
2
3
4
5
The sum i s 15∗Main>
You will need the functions read :: Read a =>String −> a and show :: Show a =>a −> String
to get numbers from strings and to display numbers as strings, respectively. All types in the type
class Num are also types in the type classes Read and Show.
-}

hugorm :: IO()
hugorm = do putStr "How many numbers would you like to add? "
            input <- getLine
            let num = read input :: Int
            res <- readAndSum num 0
            putStrLn ("The sum is " ++ show res)


readAndSum :: Int -> Int -> IO Int
readAndSum 0 total = return total
readAndSum n total = do 
                        input <- getLine
                        let num = read input :: Int
                        readAndSum (n-1) (total + num)


readAndSum' :: Int -> Int -> IO Int
readAndSum' n total | n == 0 = return total
                   | otherwise = 
                            do 
                                input <- getLine
                                let num = read input :: Int
                                readAndSum (n-1) (total + num)
