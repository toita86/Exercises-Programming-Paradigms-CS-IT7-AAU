{- 
1. Define, using recursion, an expression odds whose value is the infinite list of odd natural numbers.

2. Use the infinite list to build a new list tup consisting of tuples. The tuples must look as follows:
[(1,1/1),(3,1/3),(5,1/5),(7,1/7),...,(i,1/i), ...

3. Here is piece of code.
plop x = plop x

quango u v = u ++ (if (length u) > 3 then ”ringo” else v)

Explain as precisely as possible why the call

quango ”paul” (plop 14)

succeeds. Write your answer as a comment in solutions.hs. 
-}

odds = [i | i <- [1..], (mod i 2) == 1]
tup = [(i, 1/ fromIntegral i)| i <- odds]

plop x = plop x

quango u v = u ++ (if (length u) > 3 then "ringo" else v)
-- the call `quango "paul" (plop 14)` succeeds given the lazy evaluation of haskell. It evaluates the outermost expression first so u ++ then proceeds to evaluate the if statement in which the first condition is met and therefore "ringo" is returned. The plop 14 part that will cause a infinite recursive call is not evaluated beacause the if statement will not consider the else branch.
