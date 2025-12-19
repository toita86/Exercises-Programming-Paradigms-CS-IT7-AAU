{- 
Write a recursive function sumInts :: Integer −> IO Integer that repeatedly reads integer numbers from input until the number 0 is given. 

When that happens, the function will return the sum of all the numbers that were entered plus the original (default) value, which is given as the first parameter of sumInts.
-}

sumInts acc = do
  x <- readLn
  if x == 0 then
    return acc 
  else 
    sumInts (acc + x)

{- 
We can generalize sumInts as a higher-order function whileIO which, for the given reading IO action
getIO, termination condition condF, folding function foldF, and the original value, returns the required
IO action.
Check that for some values of getIO, condF and foldF, we can redefine sumInts using whileIO.
-}
whileIO getIO condF foldF acc = do
  x <- getIO
  if condF x
    then return acc
    else whileIO getIO condF foldF (foldF acc x)

sumInts' acc = whileIO readLn (== 0) (+) acc

