{- 
1. Write a Haskell program that asks for the name of the user and greets the user with a ”Hello”. We
would like to see the following behaviour:
```
∗Main> hello
What is your name?
Graham
Hello Graham
∗Main>
```
-}

theGreeter :: IO ()

theGreeter = do putStrLn "What is your name?"
                name <- getLine
                putStr "Hello "
                putStrLn name
                
