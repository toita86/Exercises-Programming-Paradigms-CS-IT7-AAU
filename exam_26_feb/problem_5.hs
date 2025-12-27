{- 
The function dublist takes a number x and produces the infinite list of numbers
[x, 2 · x, 2 · 2 · x, 2 · 2 · 2 · x, . . .]
As an example. 1.2 should give us the infinite list that begins with [1.2,2.4,4.8,9.6,19.2,38.4,...].

1. What should the type of dublist be?

2. Define dublist using recursion.

3. Define a version of dublist called dublist’ that has the same type as dublist but is defined using list comprehension and without using recursion or the function dublist from the previous subproblem.
Hint: In Haskell, we can write 42 as 4ˆ2.

4. Here is an expression.
(\x y −> x + 3) 7 dublist
Why does the evaluation of this expression succeed? Explain in a comment.
-}

-- dublist :: Num t => t -> [t]
dublist x = inflist x [0..]
  where 
    inflist x (y:ys) = (x * 2^y):(inflist x ys)  

dublist' x = [(x * 2^i) | i <- [0..]]

-- 4. the expression succeds beacause the lazy evaluation of haskell does it's magic. In the lambda the arguments get betareduced but the body of the lambda does not contain y therefore the infinite function does not get evaluated and does not block the execution.
