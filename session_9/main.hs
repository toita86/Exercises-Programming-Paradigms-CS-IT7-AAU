{- 
1. (15 minutes) Here is a program.
main = do
w <− g e t L i n e
l o o p ( ( read w) : : I n t )
where
l o o p 1 = p u t S t r ( show 1 )
l o o p x = do
p u t S t r ( show x )
i f even x
then l o o p ( x ‘ div ‘ 2 )
e l s e l o o p ( 3 ∗ x + 1 )
Do not run it! Try to find out what it does.
-}

-- Collatz congecture
main = do
  w <- getLine
  loop ( (read w) :: Int )
  where
    loop 1 = putStr ( show 1 )
    loop x = do
      putStr ( show x )
      if even x
        then loop ( x `div` 2 )
        else loop ( 3 * x + 1 )

-- Do not run it! Try to find out what it does.
